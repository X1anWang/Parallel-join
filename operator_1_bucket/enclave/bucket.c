#include "enclave/bucket.h"

#ifdef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOXORSWAP
#define LIBOBLIVIOUS_CMOV
#endif

#include <errno.h>
#include <string.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <threads.h>
#include <time.h>
#include <liboblivious/algorithms.h>
#include <liboblivious/primitives.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "enclave/crypto.h"
#include "enclave/mpi_tls.h"
#include "enclave/nonoblivious.h"
#include "enclave/parallel_enc.h"
#include "enclave/synch.h"
#include "enclave/threading.h"

static size_t total_length;

/* Thread-local buffer used for generic operations. */
static thread_local elem_t *buffer;

static int get_bucket_rank(size_t bucket) {
    size_t num_buckets =
        MAX(next_pow2ll(total_length) * 2 / BUCKET_SIZE,
                (size_t) world_size * 2);
    return bucket * world_size / num_buckets;
}

static size_t get_local_bucket_start(int rank) {
    size_t num_buckets =
        MAX(next_pow2ll(total_length) * 2 / BUCKET_SIZE,
                (size_t) world_size * 2);
    return (rank * num_buckets + world_size - 1) / world_size;
}

/* Initialization and deinitialization. */

int bucket_init(void) {
    /* Allocate buffer. */
    buffer = malloc(BUCKET_SIZE * MAX(SWAP_CHUNK_BUCKETS, 2) * sizeof(*buffer));
    if (!buffer) {
        perror("Error allocating buffer");
        goto exit;
    }

    return 0;

exit:
    return -1;
}

void bucket_init_prealloc(elem_t *buffer_) {
    buffer = buffer_;
}

void bucket_free(void) {
    /* Free resources. */
    free(buffer);
}

/* Bucket sort. */

/* For output elements OUT[i * LENGTH / NUM_THREADS] to
 * OUT[(i + 1) * LENGTH / NUM_THREADS], if the index j is even, copy element
 * ARR[j / 2] to the OUT[j]. Else, mark OUT[j] as a dummy element. */
struct assign_random_id_args {
    const elem_t *arr;
    elem_t *out;
    size_t arr_length;
    size_t out_length;
    size_t result_start_idx;
    size_t num_threads;
    int ret;
};
static void assign_random_id(void *args_, size_t i) {
    struct assign_random_id_args *args = args_;
    const elem_t *arr = args->arr;
    elem_t *out = args->out;
    size_t arr_length = args->arr_length;
    size_t out_length = args->out_length;
    size_t result_start_idx = args->result_start_idx;
    size_t num_threads = args->num_threads;
    int ret;

    size_t start = i * out_length / num_threads;
    size_t end = (i + 1) * out_length / num_threads;
    for (size_t j = start; j < end; j++) {
        if (j % 2 == 0 && j < arr_length * 2) {
            /* Copy elem from index j / 2 and assign ORP ID. */
            memcpy(&out[j], &arr[j / 2], sizeof(out[j]));
            ret = rand_read(&out[j].orp_id, sizeof(out[j].orp_id));
            if (ret) {
                handle_error_string("Error assigning random ID to elem %lu",
                        i + result_start_idx);
                goto exit;
            }
            out[j].is_dummy = false;
        } else {
            /* Use dummy elem. */
            out[j].is_dummy = true;
        }
    }

    ret = 0;

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}

/* Assigns random ORP IDs to the elems in ARR and distributes them evenly over
 * the 2 * LENGTH elements in OUT. Thus, ARR is assumed to be at least
 * 2 * MAX(LENGTH, BUCKET_SIZE) bytes. The result is an array with real elements
 * interspersed with dummy elements. */
// TODO Can we do the first bucket assignment scan while generating these?
static int assign_random_ids_and_spread(const elem_t *arr, void *out,
        size_t length, size_t result_start_idx, size_t num_threads) {
    int ret;

    struct assign_random_id_args args = {
        .arr = arr,
        .out = out,
        .arr_length = length,
        .out_length = MAX(length, BUCKET_SIZE) * 2,
        .result_start_idx = result_start_idx,
        .num_threads = num_threads,
        .ret = 0,
    };
    struct thread_work work = {
        .type = THREAD_WORK_ITER,
        .iter = {
            .func = assign_random_id,
            .arg = &args,
            .count = num_threads,
        },
    };
    thread_work_push(&work);
    thread_work_until_empty();
    thread_wait(&work);
    ret = args.ret;
    if (ret) {
        handle_error_string("Error assigning random ids");
        goto exit;
    }

exit:
    return ret;
}

struct merge_split_ocompact_aux {
    elem_t *bucket1;
    elem_t *bucket2;
    size_t bit_idx;
};

#ifdef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOOCOMPACT
static void merge_split_swapper(size_t a, size_t b, void *aux_) {
    struct merge_split_ocompact_aux *aux = aux_;
    elem_t *elem_a =
        &(a < BUCKET_SIZE ? aux->bucket1 : aux->bucket2)[a % BUCKET_SIZE];
    elem_t *elem_b =
        &(b < BUCKET_SIZE ? aux->bucket1 : aux->bucket2)[b % BUCKET_SIZE];
    bool cond = ((elem_a->orp_id & ~elem_b->orp_id) >> aux->bit_idx) & 1;
    o_memswap(elem_a, elem_b, sizeof(*elem_a), cond);
}
#else
static bool merge_split_is_marked(size_t index, void *aux_) {
    /* The element is marked if the BIT_IDX'th bit of the ORP ID of the element
     * is set to 0. */
    struct merge_split_ocompact_aux *aux = aux_;
    elem_t *elem =
        &(index < BUCKET_SIZE ? aux->bucket1 : aux->bucket2)[index % BUCKET_SIZE];
    return !((elem->orp_id >> aux->bit_idx) & 1);
}

static void merge_split_swapper(size_t a, size_t b, bool should_swap, void *aux_) {
    struct merge_split_ocompact_aux *aux = aux_;
    elem_t *elem_a =
        &(a < BUCKET_SIZE ? aux->bucket1 : aux->bucket2)[a % BUCKET_SIZE];
    elem_t *elem_b =
        &(b < BUCKET_SIZE ? aux->bucket1 : aux->bucket2)[b % BUCKET_SIZE];
    o_memswap(elem_a, elem_b, sizeof(*elem_a), should_swap);
}
#endif

/* Merge (BUCKET1 + i, BUCKET2 + i) for i = 0, ..., CHUNK_BUCKETS - 1 and split
 * each such that the BUCKET1 buckets contains all elements corresponding with
 * bit 0 and the BUCKET2 buckets contains all elements corresponding with bit
 * 1, with the bit given by the bit in BIT_IDX of the nodes' ORP IDs.
 * CHUNK_BUCKETS may be no more than SWAP_CHUNK_BUCKETS.
 *
 * Note that this is a modified version of the merge-split algorithm from the
 * paper, since the elements are swapped in-place rather than being swapped
 * between different buckets on different layers. */
static int merge_split_chunk(elem_t *arr, size_t bucket1_idx, size_t
        bucket2_idx, size_t bit_idx, size_t chunk_buckets) {
    int ret = -1;
    int bucket1_rank = get_bucket_rank(bucket1_idx);
    int bucket2_rank = get_bucket_rank(bucket2_idx);
    bool bucket1_local = bucket1_rank == world_rank;
    bool bucket2_local = bucket2_rank == world_rank;
    size_t local_bucket_start = get_local_bucket_start(world_rank);

    /* If both buckets are remote, ignore this merge-split. */
    if (!bucket1_local && !bucket2_local) {
        ret = 0;
        goto exit;
    }

    /* Load bucket 1 elems if local. */
    elem_t *bucket1_buckets = NULL;
    if (bucket1_local) {
        bucket1_buckets = arr + (bucket1_idx - local_bucket_start) * BUCKET_SIZE;
    }

    /* Load bucket 2 elems if local. */
    elem_t *bucket2_buckets = NULL;
    if (bucket2_local) {
        bucket2_buckets = arr + (bucket2_idx - local_bucket_start) * BUCKET_SIZE;
    }

    /* If remote, send our local buckets then receive the remote buckets from
     * the other node. */
    if (!bucket1_buckets || !bucket2_buckets) {
        int local_bucket_idx = bucket1_local ? bucket1_idx : bucket2_idx;
        int nonlocal_bucket_idx = bucket1_local ? bucket2_idx : bucket1_idx;
        int nonlocal_rank = bucket1_local ? bucket2_rank : bucket1_rank;

        /* Post receive for remote buckets. */
        mpi_tls_request_t request;
        ret = mpi_tls_irecv_bytes(buffer,
                sizeof(*buffer) * chunk_buckets * BUCKET_SIZE, nonlocal_rank,
                nonlocal_bucket_idx, &request);
        if (ret) {
            handle_error_string(
                    "Error receiving remote buckets into %d from %d",
                    world_rank, nonlocal_rank);
            goto exit;
        }
        if (bucket1_buckets) {
            bucket2_buckets = buffer;
        } else {
            bucket1_buckets = buffer;
        }

        /* Send local bucket. */
        ret =
            mpi_tls_send_bytes(
                bucket1_local ? bucket1_buckets : bucket2_buckets,
                sizeof(*bucket1_buckets) * chunk_buckets * BUCKET_SIZE,
                nonlocal_rank, local_bucket_idx);
        if (ret) {
            handle_error_string("Error sending local buckets from %d to %d",
                    world_rank, nonlocal_rank);
            goto exit;
        }

        /* Wait for bucket receive. */
        ret = mpi_tls_wait(&request, MPI_TLS_STATUS_IGNORE);
        if (ret) {
            handle_error_string(
                    "Error waiting on receive for buckets into %d from %d",
                    world_rank, nonlocal_rank);
            goto exit;
        }
    }

    /* Perform merge-split for each bucket. */
    for (size_t i = 0; i < chunk_buckets; i++) {
        elem_t *bucket1 = &bucket1_buckets[i];
        elem_t *bucket2 = &bucket2_buckets[i];

        /* The number of elements with corresponding bit 1. */
        size_t count1 = 0;
        for (size_t j = 0; j < BUCKET_SIZE; j++) {
            /* Obliviously increment count. */
            count1 +=
                ((bucket1[j].orp_id >> bit_idx) & 1) & !bucket1[j].is_dummy;
        }
        for (size_t j = 0; j < BUCKET_SIZE; j++) {
            /* Obliviously increment count. */
            count1 +=
                ((bucket2[j].orp_id >> bit_idx) & 1) & !bucket2[j].is_dummy;
        }

        /* There are count1 elements with bit 1, so we need to assign
         * BUCKET_SIZE - count1 dummy elements to have bit 1, with the
         * remaining dummy elements assigned with bit 0. */
        count1 = BUCKET_SIZE - count1;

        /* Assign dummy elements. */
        for (size_t j = 0; j < BUCKET_SIZE; j++) {
            /* If count1 > 0 and the node is a dummy element, set BIT_IDX bit
             * of ORP ID and decrement count1. Else, clear BIT_IDX bit of ORP
             * ID. */
            bucket1[j].orp_id &= ~(bucket1[j].is_dummy << bit_idx);
            bucket1[j].orp_id |=
                ((bool) count1 & bucket1[j].is_dummy) << bit_idx;
            count1 -= (bool) count1 & bucket1[j].is_dummy;
        }
        for (size_t j = 0; j < BUCKET_SIZE; j++) {
            /* If count1 > 0 and the node is a dummy element, set BIT_IDX bit
             * of ORP ID and decrement count1. Else, clear BIT_IDX bit of ORP
             * ID. */
            bucket2[j].orp_id &= ~(bucket2[j].is_dummy << bit_idx);
            bucket2[j].orp_id |=
                ((bool) count1 & bucket2[j].is_dummy) << bit_idx;
            count1 -= (bool) count1 & bucket2[j].is_dummy;
        }

        /* Oblivious bitonic sort elements according to BIT_IDX bit of ORP
         * id. */
        struct merge_split_ocompact_aux aux = {
            .bucket1 = bucket1,
            .bucket2 = bucket2,
            .bit_idx = bit_idx,
        };
#ifdef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOOCOMPACT
        o_sort_generate_swaps(BUCKET_SIZE * 2, merge_split_swapper, &aux);
#else
        o_compact_generate_swaps(BUCKET_SIZE * 2, merge_split_is_marked,
                merge_split_swapper, &aux);
#endif
    }

    ret = 0;

exit:
    return ret;
}

/* Performs the merge_split operation over a starting bucket specified by an
 * index. The IDX parameter is just a way of dividing work between threads.
 * Iterating from 0 to NUM_BUCKETS / CHUNK_BUCKETS / 2 when BUCKET_OFFSET == 0
 * is equivalent to
 *
 * for (size_t bucket_start = 0; bucket_start < num_buckets;
 *         bucket_start += bucket_stride) {
 *     for (size_t bucket = bucket_start;
 *             bucket < bucket_start + bucket_stride / 2;
 *             bucket += SWAP_CHUNK_BUCKETS) {
 *         ...
 *     }
 * }
 *
 * but with easier task generation. The loop goes backwards if BIT_IDX is odd,
 * since this hits buckets that were most recently loaded into the decrypted
 * bucket cache. BUCKET_OFFSET is used for chunking so that we can reuse this
 * function at different starting points for different chunks. */
struct merge_split_idx_args {
    elem_t *arr;
    size_t bit_idx;
    size_t bucket_stride;
    size_t bucket_offset;
    size_t num_buckets;
    size_t chunk_buckets;

    int ret;
};

static void merge_split_idx(void *args_, size_t idx) {
    struct merge_split_idx_args *args = args_;
    elem_t *arr = args->arr;
    size_t bit_idx = args->bit_idx;
    size_t bucket_stride = args->bucket_stride;
    size_t bucket_offset = args->bucket_offset;
    size_t num_buckets = args->num_buckets;
    size_t chunk_buckets = args->chunk_buckets;
    int ret;

    if (bit_idx % 2 == 1) {
        idx = num_buckets / chunk_buckets / 2 - idx - 1;
    }

    size_t bucket = (idx * chunk_buckets)
            % (bucket_stride / 2)
        + (idx * chunk_buckets) / (bucket_stride / 2)
            * bucket_stride
        + bucket_offset;
    size_t other_bucket = bucket + bucket_stride / 2;
    ret =
        merge_split_chunk(arr, bucket, other_bucket, bit_idx,
                chunk_buckets);
    if (ret) {
        handle_error_string(
                "Error in merge split with indices %lu and %lu\n", bucket,
                other_bucket);
        goto exit;
    }

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELAXED, __ATOMIC_RELAXED);
    }
}

/* Run merge-split as part of a butterfly network, routing based on
 * ORP_ID[START_BIT_IDX:START_BIT_IDX + NUM_LEVELS - 1]. This is modified from
 * the paper, since all merge-split operations will be constrained to the same
 * buckets of memory. */
static int bucket_route(elem_t *arr, size_t num_levels, size_t start_bit_idx) {
    int ret;

    size_t bucket_start = get_local_bucket_start(world_rank);
    size_t num_buckets = get_local_bucket_start(world_rank + 1) - bucket_start;
    if (1lu << num_levels > num_buckets) {
        /* If 2 ^ NUM_LEVELS > NUM_BUCKETS, we need to do some merge-splits
         * across different enclaves, so we round BUCKET_START down to the
         * nearest multiple of 2 ^ NUM_LEVELS. */
        bucket_start -= bucket_start % (1 << num_levels);
        num_buckets = 1 << num_levels;
    }
    for (size_t bit_idx = 0; bit_idx < num_levels; bit_idx++) {
        size_t bucket_stride = 2u << bit_idx;
        size_t chunk_buckets = MIN(bucket_stride / 2, SWAP_CHUNK_BUCKETS);

        /* Create iterative task for merge split. */
        struct merge_split_idx_args args = {
            .arr = arr,
            .bit_idx = start_bit_idx + bit_idx,
            .bucket_stride = bucket_stride,
            .bucket_offset = bucket_start,
            .num_buckets = num_buckets,
            .chunk_buckets = chunk_buckets,
        };
        struct thread_work work = {
            .type = THREAD_WORK_ITER,
            .iter = {
                .func = merge_split_idx,
                .arg = &args,
                .count = num_buckets / chunk_buckets / 2,
            },
        };
        thread_work_push(&work);

        thread_work_until_empty();

        /* Get work from others. */
        thread_wait(&work);
        ret = args.ret;
        if (ret) {
            handle_error_string("Error in merge split range at level %lu",
                    bit_idx);
            goto exit;
        }
    }

    ret = 0;

exit:
    return ret;
}

#ifndef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOROUTE
/* Distribute and receive elements from buckets in ARR to buckets in OUT.
 * Bucket i is sent to enclave i % E. */
struct distributed_bucket_route_args {
    elem_t *arr;
    elem_t *out;
    volatile size_t *send_idxs;
    volatile size_t recv_idx;
    volatile int ret;
};
static void distributed_bucket_route(void *args_, size_t thread_idx) {
    struct distributed_bucket_route_args *args = args_;
    elem_t *arr = args->arr;
    elem_t *out = args->out;
    volatile size_t *send_idxs = args->send_idxs;
    volatile size_t *recv_idx = &args->recv_idx;
    size_t local_bucket_start = get_local_bucket_start(world_rank);
    size_t num_local_buckets =
        get_local_bucket_start(world_rank + 1) - local_bucket_start;
    int ret;

    mpi_tls_request_t requests[world_size];

    if (world_size == 1) {
        if (thread_idx == 0) {
            memcpy(out, arr, num_local_buckets * BUCKET_SIZE * sizeof(*out));
        }
        ret = 0;
        goto exit;
    }

    /* Wait so that thread 0 has defeintely updated RECV_IDX. */
    thread_wait_for_all();

    /* Copy our own buckets to the output if any. */
    if (thread_idx == 0) {
        for (size_t j = send_idxs[world_rank]; j < num_local_buckets;
                j += world_size) {
            size_t copy_idx =
                __atomic_fetch_add(recv_idx, 1, __ATOMIC_RELAXED);
            memcpy(out + copy_idx * BUCKET_SIZE, arr + j * BUCKET_SIZE,
                    BUCKET_SIZE * sizeof(*out));
        }
    }

    /* Post a receive request for the current bucket. */
    size_t num_requests = 0;
    size_t our_recv_idx = __atomic_fetch_add(recv_idx, 1, __ATOMIC_RELAXED);
    if (our_recv_idx < num_local_buckets) {
        ret =
            mpi_tls_irecv_bytes(out + our_recv_idx * BUCKET_SIZE,
                    BUCKET_SIZE * sizeof(*out), MPI_TLS_ANY_SOURCE,
                    BUCKET_DISTRIBUTE_MPI_TAG, &requests[world_rank]);
        if (ret) {
            handle_error_string("Error posting receive into %d", world_rank);
            goto exit;
        }
        num_requests++;
    } else {
        requests[world_rank].type = MPI_TLS_NULL;
    }

    /* Send and receive buckets. */
    for (int i = 0; i < world_size; i++) {
        if (i == world_rank) {
            continue;
        }

        /* Post a send request to the remote rank containing the first
         * bucket. */
        size_t our_send_idx =
            __atomic_fetch_add(&send_idxs[i], world_size, __ATOMIC_RELAXED);
        if (our_send_idx < num_local_buckets) {
            ret =
                mpi_tls_isend_bytes(arr + our_send_idx * BUCKET_SIZE,
                        BUCKET_SIZE * sizeof(*arr), i,
                        BUCKET_DISTRIBUTE_MPI_TAG, &requests[i]);
            if (ret) {
                handle_error_string(
                        "Error sending bucket %lu to %d from %d",
                        our_send_idx + local_bucket_start, i, world_rank);
                goto exit;
            }
            num_requests++;
        } else {
            requests[i].type = MPI_TLS_NULL;
        }
    }

    while (num_requests) {
        size_t index;
        mpi_tls_status_t status;
        ret = mpi_tls_waitany(world_size, requests, &index, &status);
        if (ret) {
            handle_error_string("Error waiting on requests");
            goto exit;
        }

        if (index == (size_t) world_rank) {
            /* This was the receive request. */

            size_t our_recv_idx =
                __atomic_fetch_add(recv_idx, 1, __ATOMIC_RELAXED);
            if (our_recv_idx < num_local_buckets) {
                /* Post receive for the next bucket. */
                ret =
                    mpi_tls_irecv_bytes(out + our_recv_idx * BUCKET_SIZE,
                            BUCKET_SIZE * sizeof(*out), MPI_TLS_ANY_SOURCE,
                            BUCKET_DISTRIBUTE_MPI_TAG, &requests[index]);
                if (ret) {
                    handle_error_string("Error posting receive into %d",
                            (int) index);
                    goto exit;
                }
            } else {
                /* Nullify the receiving request. */
                requests[index].type = MPI_TLS_NULL;
                num_requests--;
            }
        } else {
            /* This was a send request. */

            size_t our_send_idx =

                __atomic_fetch_add(&send_idxs[index], world_size,
                        __ATOMIC_RELAXED);
            if (our_send_idx < num_local_buckets) {
                ret =
                    mpi_tls_isend_bytes(arr + our_send_idx * BUCKET_SIZE,
                            BUCKET_SIZE * sizeof(*arr), index,
                            BUCKET_DISTRIBUTE_MPI_TAG, &requests[index]);
                if (ret) {
                    handle_error_string(
                            "Error sending bucket %lu from %d to %d",
                            our_send_idx + local_bucket_start, world_rank,
                            (int) index);
                    goto exit;
                }
            } else {
                /* Nullify the sending request. */
                requests[index].type = MPI_TLS_NULL;
                num_requests--;
            }
        }
    }

    ret = 0;

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}
#endif

/* Compares elements first by sorting real elements before dummy elements, and
 * then by their ORP ID. */
static int permute_comparator(const void *a_, const void *b_,
        void *aux UNUSED) {
    const elem_t *a = a_;
    const elem_t *b = b_;
    return (a->is_dummy - b->is_dummy) * 2
        + ((a->orp_id > b->orp_id) - (a->orp_id < b->orp_id));
}

/* Permutes the real elements in the bucket by sorting according to all bits of
 * the ORP ID. This is valid because the bin assignment used the lower bits of
 * the ORP ID, leaving the upper bits free for comparison and permutation within
 * the bin.  The elems are then written sequentially to ARR[*COMPRESS_IDX], and
 * *COMPRESS_IDX is incremented. The elems receive new random ORP IDs. The first
 * element is assumed to have START_IDX for the purposes of decryption. */
struct permute_and_compress_args {
    elem_t *arr;
    elem_t *out;
    size_t start_idx;
    size_t *compress_idx;
    int ret;
};
static void permute_and_compress(void *args_, size_t bucket_idx) {
    struct permute_and_compress_args *args = args_;
    elem_t *arr = args->arr;
    elem_t *out = args->out;
    size_t start_idx = args->start_idx;
    size_t *compress_idx = args->compress_idx;
    int ret;

    o_sort(arr + bucket_idx * BUCKET_SIZE, BUCKET_SIZE, sizeof(*arr),
            permute_comparator, NULL);

    /* Assign random ORP IDs and Count real elements. */
    size_t num_real_elems = 0;
    for (size_t i = 0; i < BUCKET_SIZE; i++) {
        /* If this is a dummy element, break out of the loop. All real elements
         * are sorted before the dummy elements at this point. This
         * non-oblivious comparison is fine since it's fine to leak how many
         * elements end up in each bucket. */
        if (arr[bucket_idx * BUCKET_SIZE + i].is_dummy) {
            num_real_elems = i;
            break;
        }

        /* Assign random ORP ID. */
        ret =
            rand_read(&arr[bucket_idx * BUCKET_SIZE + i].orp_id,
                    sizeof(buffer[i].orp_id));
        if (ret) {
            handle_error_string("Error assigning random ID to %lu",
                    bucket_idx * BUCKET_SIZE + start_idx);
            goto exit;
        }
    }

    /* Fetch the next index to copy to. */
    size_t out_idx =
        __atomic_fetch_add(compress_idx, num_real_elems,
                __ATOMIC_RELAXED);

    /* Copy the elements to the output. */
    memcpy(out + out_idx, arr + bucket_idx * BUCKET_SIZE,
            num_real_elems * sizeof(*out));

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}

int bucket_sort(elem_t *arr, size_t length, size_t num_threads) {
    int ret;

    total_length = length;

    size_t src_local_start = total_length * world_rank / world_size;
    size_t src_local_length =
        total_length * (world_rank + 1) / world_size - src_local_start;
    size_t local_bucket_start = get_local_bucket_start(world_rank);
    size_t num_local_buckets =
        get_local_bucket_start(world_rank + 1) - local_bucket_start;
    size_t local_start = local_bucket_start * BUCKET_SIZE;
    size_t local_length = num_local_buckets * BUCKET_SIZE;

#ifndef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOROUTE
    size_t send_idxs[world_size];
#endif

    elem_t *buf = arr + local_length;

    struct timespec time_start;
    if (clock_gettime(CLOCK_REALTIME, &time_start)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Spread the elements located in the first half of our input array. */
    ret =
        assign_random_ids_and_spread(arr, buf, src_local_length, local_start,
                num_threads);
    if (ret) {
        handle_error_string("Error assigning random IDs to elems");
        ret = errno;
        goto exit;
    }

    struct timespec time_assign_ids;
    if (clock_gettime(CLOCK_REALTIME, &time_assign_ids)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

#ifdef DISTRIBUTED_SGX_SORT_MICROBENCHMARK_NOROUTE
    ret = bucket_route(buf, log2ll(world_size * num_local_buckets), 0);
    if (ret) {
        handle_error_string("Error routing elements through butterfly network");
        goto exit;
    }

    memcpy(arr, buf, local_length * sizeof(*arr));
#else
    size_t route_levels1 = log2ll(world_size);
    ret = bucket_route(buf, route_levels1, 0);
    if (ret) {
        handle_error_string("Error routing elements through butterfly network");
        goto exit;
    }

    /* Distributed bucket routing. */
    for (int i = 0; i < world_size; i++) {
        send_idxs[i] = (i - local_bucket_start % world_size) % world_size;
    }
    struct distributed_bucket_route_args args = {
        .arr = buf,
        .out = arr,
        .send_idxs = send_idxs,
        .recv_idx = 0,
        .ret = 0,
    };
    struct thread_work work = {
        .type = THREAD_WORK_ITER,
        .iter = {
            .func = distributed_bucket_route,
            .arg = &args,
            .count = num_threads,
        },
    };
    thread_work_push(&work);
    thread_work_until_empty();
    thread_wait(&work);
    ret = args.ret;
    if (ret) {
        handle_error_string("Error distributing elements in butterfly network");
        goto exit;
    }

    size_t route_levels2 = log2ll(num_local_buckets);
    ret = bucket_route(arr, route_levels2, route_levels1);
    if (ret) {
        handle_error_string("Error routing elements through butterfly network");
        goto exit;
    }
#endif

    struct timespec time_merge_split;
    if (clock_gettime(CLOCK_REALTIME, &time_merge_split)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Permute each bucket and concatenate them back together by compressing all
     * real elems together. We also assign new ORP IDs so that all elements have
     * a unique tuple of (key, ORP ID), even if they have duplicate keys. */
    size_t compress_len = 0;
    {
        struct permute_and_compress_args args = {
            .arr = arr,
            .out = buf,
            .start_idx = local_start,
            .compress_idx = &compress_len,
            .ret = 0,
        };
        struct thread_work work = {
            .type = THREAD_WORK_ITER,
            .iter = {
                .func = permute_and_compress,
                .arg = &args,
                .count = num_local_buckets,
            },
        };
        thread_work_push(&work);
        thread_work_until_empty();
        thread_wait(&work);
        ret = args.ret;
        if (ret) {
            handle_error_string("Error permuting buckets");
            goto exit;
        }
    }

    struct timespec time_compress;
    if (clock_gettime(CLOCK_REALTIME, &time_compress)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Nonoblivious sort. */
    ret = nonoblivious_sort(buf, arr, length, compress_len, num_threads);
    if (ret) {
        handle_error_string("Error in nonoblivious sort");
        goto exit;
    }

    if (world_rank == 0) {
        printf("assign_ids       : %f\n",
                get_time_difference(&time_start, &time_assign_ids));
        printf("merge_split      : %f\n",
                get_time_difference(&time_assign_ids, &time_merge_split));
        printf("compression      : %f\n",
                get_time_difference(&time_merge_split, &time_compress));
        printf("shuffle          : %f\n",
                get_time_difference(&time_start, &time_compress));
    }

exit:
    return ret;
}
