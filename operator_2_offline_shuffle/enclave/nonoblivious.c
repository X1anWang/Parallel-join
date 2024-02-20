#include "enclave/nonoblivious.h"
#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "enclave/mpi_tls.h"
#include "enclave/parallel_enc.h"
#include "enclave/qsort.h"
#include "enclave/synch.h"
#include "enclave/threading.h"

#define BUF_SIZE 1024
#define SAMPLE_PARTITION_BUF_SIZE 512

/* Compares elements by the tuple (key, ORP ID). The check for the ORP ID must
 * always be run (it must be oblivious whether the comparison result is based on
 * the key or on the ORP ID), since we leak info on duplicate keys otherwise. */
static int mergesort_comparator(const void *a_, const void *b_,
        void *aux UNUSED) {
    const elem_t *a = a_;
    const elem_t *b = b_;
    int comp_key = (a->key > b->key) - (a->key < b->key);
    int comp_orp_id = (a->orp_id > b->orp_id) - (a->orp_id < b->orp_id);
    return (comp_key << 1) + comp_orp_id;
}

/* Sort ARR[RUN_IDX * LENGTH / NUM_THREADS] to ARR[(RUN_IDX + 1) * LENGTH / NUM_THREADS]. The results
 * will be stored in the same location as the inputs. */
struct mergesort_first_pass_args {
    elem_t *arr;
    size_t length;
    size_t num_threads;
};
static void mergesort_first_pass(void *args_, size_t run_idx) {
    struct mergesort_first_pass_args *args = args_;
    elem_t *arr = args->arr;
    size_t length = args->length;
    size_t num_threads = args->num_threads;

    size_t run_start = run_idx * length / num_threads;
    size_t run_end = (run_idx + 1) * length / num_threads;

    /* Sort using libc quicksort. */
    qsort_glibc(arr + run_start, run_end - run_start, sizeof(*arr),
            mergesort_comparator, NULL);
}

/* Non-oblivious mergesort. */
static int mergesort(elem_t *arr, elem_t *out, size_t length,
        size_t num_threads) {
    int ret;

    /* Start by sort runs of LENGTH / NUM_THREADS. */
    struct mergesort_first_pass_args args = {
        .arr = arr,
        .length = length,
        .num_threads = num_threads,
    };
    struct thread_work work = {
        .type = THREAD_WORK_ITER,
        .iter = {
            .func = mergesort_first_pass,
            .arg = &args,
            .count = num_threads,
        },
    };
    thread_work_push(&work);
    thread_work_until_empty();
    thread_wait(&work);

    if (num_threads == 1) {
        memcpy(out, arr, length * sizeof(*out));
        return 0;
    }

    /* Compute initial mergesort indices. */
    size_t merge_indices[num_threads];
    for (size_t i = 0; i < num_threads; i++) {
        merge_indices[i] = i * length / num_threads;
    }

    /* Merge runs from each thread into output. */
    for (size_t i = 0; i < length; i++) {
        /* Scan for lowest elem. */
        // TODO Use a heap?
        size_t lowest_run = SIZE_MAX;
        for (size_t j = 0; j < num_threads; j++) {
            if (merge_indices[j] >= (j + 1) * length / num_threads) {
                continue;
            }
            if (lowest_run == SIZE_MAX
                    || mergesort_comparator(&arr[merge_indices[j]],
                        &arr[merge_indices[lowest_run]], NULL) < 0) {
                lowest_run = j;
            }
        }

        /* Copy lowest elem to output. */
        memcpy(&out[i], &arr[merge_indices[lowest_run]], sizeof(*out));
        merge_indices[lowest_run]++;
    }

    ret = 0;

    return ret;
}

struct sample {
    uint64_t key;
    uint64_t orp_id;
};

static int elem_sample_comparator(const elem_t *a, const struct sample *b) {
    int comp_key = (a->key > b->key) - (a->key < b->key);
    int comp_orp_id = (a->orp_id > b->orp_id) - (a->orp_id < b->orp_id);
    return (comp_key << 1) + comp_orp_id;
}

struct quickselect_args {
    elem_t *arr;
    size_t length;
    const size_t *targets;
    struct sample *samples;
    size_t num_targets;
    size_t left;
    size_t right;
    size_t num_threads;
    volatile int ret;
};
static void quickselect_helper(void *args_) {
    struct quickselect_args *args = args_;
    elem_t *arr = args->arr;
    size_t length = args->length;
    const size_t *targets = args->targets;
    struct sample *samples = args->samples;
    size_t num_targets = args->num_targets;
    size_t left = args->left;
    size_t right = args->right;
    size_t num_threads = args->num_threads;
    int ret;

    if (!num_targets) {
        ret = 0;
        goto exit;
    }

    /* If we've run out of elements for quickselect, we just have to take the
     * leftmost item if possible, or 0 otherwise. */
    if (left == right) {
        if (left > length) {
            for (size_t i = 0; i < num_targets; i++) {
                samples[i].key = 0;
                samples[i].orp_id = 0;
            }
        } else {
            for (size_t i = 0; i < num_targets; i++) {
                samples[i].key = arr[left].key;
                samples[i].orp_id = arr[left].orp_id;
            }
        }
        ret = 0;
        goto exit;
    }

    /* Use first elem as pivot. This is a random selection since this
     * quickselect or quickpartition should happen after immediatley after
     * ORP. */
    struct sample pivot = {
        .key = arr[left].key,
        .orp_id = arr[left].key,
    };

    /* Partition data based on pivot. */
    // TODO It's possible to do this in-place.
    size_t partition_left = left + 1;
    size_t partition_right = right;
    enum {
        PARTITION_SCAN_LEFT,
        PARTITION_SCAN_RIGHT,
    } partition_state = PARTITION_SCAN_LEFT;
    while (partition_left < partition_right) {
        switch (partition_state) {
        case PARTITION_SCAN_LEFT:
            /* Scan left for elements greater than the pivot. If found, start
             * scanning right. */
            if (elem_sample_comparator(&arr[partition_left], &pivot) > 0) {
                partition_state = PARTITION_SCAN_RIGHT;
            } else {
                partition_left++;
            }

            break;

        case PARTITION_SCAN_RIGHT:
            /* Scan right for elements less than the pivot. */

            /* If found, swap and start scanning left. */
            if (elem_sample_comparator(&arr[partition_right - 1], &pivot) < 0) {
                elem_t temp;
                memcpy(&temp, &arr[partition_right - 1], sizeof(temp));
                memcpy(&arr[partition_right - 1], &arr[partition_left],
                        sizeof(*arr));
                memcpy(&arr[partition_left], &temp, sizeof(*arr));

                partition_state = PARTITION_SCAN_LEFT;
                partition_left++;
                partition_right--;
            } else {
                partition_right--;
            }

            break;
        }
    }

    /* Finish partitioning by swapping the pivot into the center. */
    elem_t temp;
    memcpy(&temp, &arr[partition_right - 1], sizeof(temp));
    memcpy(&arr[partition_right - 1], &arr[left], sizeof(*arr));
    memcpy(&arr[left], &temp, sizeof(*arr));
    partition_right--;

    /* Check which directions we need to iterate in, based on the current pivot
     * index. If there are smaller targets, then iterate on the left half. If
     * there are larger targets, then iterate on the right half. If there is a
     * matching target, then set the sample in the output. */
    size_t *geq_target =
        bsearch_ge(&partition_right, targets, num_targets, sizeof(*targets),
                comp_ul);
    size_t geq_target_idx = (size_t) (geq_target - targets);
    bool found_target =
        geq_target_idx < num_targets && *geq_target == partition_right;
    size_t gt_target_idx = geq_target_idx + found_target;

    /* If we found a target, set the sample. */
    if (found_target) {
        size_t i = geq_target - targets;
        samples[i] = pivot;
    }

    /* Recurse. */
    struct quickselect_args left_args = {
        .arr = arr,
        .length = length,
        .targets = targets,
        .samples = samples,
        .num_targets = geq_target_idx,
        .left = left,
        .right = partition_right,
        .num_threads = MAX((num_threads + 1) / 2, 1),
        .ret = 0,
    };
    struct quickselect_args right_args = {
        .arr = arr,
        .length = length,
        .targets = targets + gt_target_idx,
        .samples = samples + gt_target_idx,
        .num_targets = num_targets - gt_target_idx,
        .left = partition_left,
        .right = right,
        .num_threads = MAX(num_threads - left_args.num_threads, 1),
        .ret = 0,
    };
    if (num_threads > 1) {
        struct thread_work right_work = {
            .type = THREAD_WORK_SINGLE,
            .single = {
                .func = quickselect_helper,
                .arg = &right_args,
            },
        };
        thread_work_push(&right_work);

        quickselect_helper(&left_args);
        ret = left_args.ret;
        if (ret) {
            goto exit;
        }

        thread_wait(&right_work);
        ret = right_args.ret;
        if (ret) {
            goto exit;
        }
    } else {
        quickselect_helper(&left_args);
        ret = left_args.ret;
        if (ret) {
            goto exit;
        }
        quickselect_helper(&right_args);
        ret = right_args.ret;
        if (ret) {
            goto exit;
        }
    }

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}

/* Performs a quickselect algorithm to find NUM_TARGETS target element indices
 * (i.e. the i'th smallest element) in TARGETS contained in ARR, which contains
 * LENGTH elements. Resulting samples are stored in SAMPLES. TARGETS must be a
 * sorted array. */
static int quickselect(elem_t *arr, size_t length, size_t *targets,
        struct sample *samples, size_t num_targets, size_t num_threads) {
    int ret;

    struct quickselect_args args = {
        .arr = arr,
        .length = length,
        .targets = targets,
        .samples = samples,
        .num_targets = num_targets,
        .left = 0,
        .right = length,
        .num_threads = num_threads,
        .ret = 0,
    };
    quickselect_helper(&args);
    ret = args.ret;
    if (ret) {
        handle_error_string("Error in distributed quickselect");
        goto exit;
    }

exit:
    return ret;
}

struct quickpartition_args {
    elem_t *arr;
    size_t length;
    const struct sample *pivots;
    size_t *pivot_idxs;
    size_t num_pivots;
    size_t left;
    size_t right;
    size_t num_threads;
    volatile int ret;
};
static void quickpartition_helper(void *args_) {
    struct quickpartition_args *args = args_;
    elem_t *arr = args->arr;
    size_t length = args->length;
    const struct sample *pivots = args->pivots;
    size_t *pivot_idxs = args->pivot_idxs;
    size_t num_pivots = args->num_pivots;
    size_t left = args->left;
    size_t right = args->right;
    size_t num_threads = args->num_threads;
    int ret;

    if (!num_pivots) {
        ret = 0;
        goto exit;
    }

    /* Use the middle sample as pivot. */
    const struct sample *pivot = &pivots[num_pivots / 2];

    /* Partition data based on pivot. */
    // TODO It's possible to do this in-place.
    size_t partition_left = left;
    size_t partition_right = right;
    enum {
        PARTITION_SCAN_LEFT,
        PARTITION_SCAN_RIGHT,
    } partition_state = PARTITION_SCAN_LEFT;
    while (partition_left < partition_right) {
        switch (partition_state) {
        case PARTITION_SCAN_LEFT:
            /* Scan left for elements greater than the pivot. If found, start
             * scanning right. */
            if (elem_sample_comparator(&arr[partition_left], pivot) > 0) {
                partition_state = PARTITION_SCAN_RIGHT;
            } else {
                partition_left++;
            }

            break;

        case PARTITION_SCAN_RIGHT:
            /* Scan right for elements less than the pivot. */

            /* If found, swap and start scanning left. */
            if (elem_sample_comparator(&arr[partition_right - 1], pivot) < 0) {
                elem_t temp;
                memcpy(&temp, &arr[partition_right - 1], sizeof(temp));
                memcpy(&arr[partition_right - 1], &arr[partition_left],
                        sizeof(*arr));
                memcpy(&arr[partition_left], &temp, sizeof(*arr));

                partition_state = PARTITION_SCAN_LEFT;
                partition_left++;
                partition_right--;
            } else {
                partition_right--;
            }

            break;
        }
    }

    /* Set the index of the pivot. */
    pivot_idxs[num_pivots / 2] = partition_right;

    /* Recurse. */
    struct quickpartition_args left_args = {
        .arr = arr,
        .length = length,
        .pivots = pivots,
        .pivot_idxs = pivot_idxs,
        .num_pivots = num_pivots / 2,
        .left = left,
        .right = partition_right,
        .num_threads = MAX((num_threads + 1) / 2, 1),
        .ret = 0,
    };
    struct quickpartition_args right_args = {
        .arr = arr,
        .length = length,
        .pivots = pivots + num_pivots / 2 + 1,
        .pivot_idxs = pivot_idxs + num_pivots / 2 + 1,
        .num_pivots = num_pivots - (num_pivots / 2 + 1),
        .left = partition_left,
        .right = right,
        .num_threads = MAX(num_threads - left_args.num_threads, 1),
        .ret = 0,
    };
    if (num_threads > 1) {
        struct thread_work right_work = {
            .type = THREAD_WORK_SINGLE,
            .single = {
                .func = quickpartition_helper,
                .arg = &right_args,
            },
        };
        thread_work_push(&right_work);

        quickpartition_helper(&left_args);
        ret = left_args.ret;
        if (ret) {
            goto exit;
        }

        thread_wait(&right_work);
        ret = right_args.ret;
        if (ret) {
            goto exit;
        }
    } else {
        quickpartition_helper(&left_args);
        ret = left_args.ret;
        if (ret) {
            goto exit;
        }
        quickpartition_helper(&right_args);
        ret = right_args.ret;
        if (ret) {
            goto exit;
        }
    }

exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}

/* Use a variation of the quickselect algorithm to partition elements according
 * to NUM_PIVOTS pivots in PIVOTS contained in ARR, which contains LENGTH
 * elements. Resulting indices are PIVOT_IDXS. PIVOTS must be a sorted array. */
static int quickpartition(elem_t *arr, size_t length,
        const struct sample *pivots, size_t *pivot_idxs, size_t num_pivots,
        size_t num_threads) {
    int ret;

    struct quickpartition_args args = {
        .arr = arr,
        .length = length,
        .pivots = pivots,
        .pivot_idxs = pivot_idxs,
        .num_pivots = num_pivots,
        .left = 0,
        .right = length,
        .num_threads = num_threads,
        .ret = 0,
    };
    quickpartition_helper(&args);
    ret = args.ret;
    if (ret) {
        handle_error_string("Error in distributed quickselect");
        goto exit;
    }

exit:
    return ret;
}

struct send_and_receive_partitions_args {
    elem_t *arr;
    elem_t *out;
    volatile size_t *send_idxs;
    size_t *send_end_idxs;
    volatile size_t recv_idx;
    volatile size_t recv_num;
    size_t total_num_recvs;
    int ret;
};
static void send_and_receive_partitions(void *args_, size_t thread_idx) {
    struct send_and_receive_partitions_args *args = args_;
    elem_t *arr = args->arr;
    elem_t *out = args->out;
    volatile size_t *send_idxs = args->send_idxs;
    size_t *send_end_idxs = args->send_end_idxs;
    volatile size_t *recv_num = &args->recv_num;
    size_t total_num_recvs = args->total_num_recvs;
    volatile size_t *recv_idx = &args->recv_idx;
    mpi_tls_request_t requests[world_size];
    int ret;

    /* Send elements to their corresponding enclaves. The elements in the array
     * have already been partitioned, so it's just a matter of sending them over
     * in chunks. */

    /* Allocate receive buffer. */
    elem_t *buf = malloc(SAMPLE_PARTITION_BUF_SIZE * sizeof(*buf));
    if (!buf) {
        perror("malloc buf");
        ret = errno;
        goto exit;
    }

    /* Copy own partition's elements to the output. */
    if (thread_idx == 0) {
        size_t elems_to_copy =
            send_end_idxs[world_rank] - send_idxs[world_rank];
        size_t copy_idx =
            __atomic_fetch_add(recv_idx, elems_to_copy, __ATOMIC_RELAXED);
        memcpy(out + copy_idx, arr + send_idxs[world_rank],
                elems_to_copy * sizeof(*out));
    }

    /* Wait so that thread 0 has defeintely updated RECV_IDX. */
    thread_wait_for_all();

    /* Post a receive request. */
    size_t num_requests = 0;
    size_t our_recv_num = __atomic_fetch_add(recv_num, 1, __ATOMIC_RELAXED);
    if (our_recv_num < total_num_recvs) {
        ret =
            mpi_tls_irecv_bytes(buf,
                    SAMPLE_PARTITION_BUF_SIZE * sizeof(*buf),
                    MPI_TLS_ANY_SOURCE,
                    SAMPLE_PARTITION_DISTRIBUTE_MPI_TAG, &requests[world_rank]);
        if (ret) {
            handle_error_string("Error receiving partitioned data");
            goto exit_free_buf;
        }
        num_requests++;
    } else {
        requests[world_rank].type = MPI_TLS_NULL;
    }

    /* Construct initial requests. REQUESTS is used for all send requests except
     * for REQUESTS[WORLD_RANK], which is our receive request. */
    for (int i = 0; i < world_size; i++) {
        if (i == world_rank) {
            continue;
        }

        size_t our_send_idx =
            __atomic_fetch_add(&send_idxs[i], SAMPLE_PARTITION_BUF_SIZE,
                    __ATOMIC_RELAXED);
        our_send_idx = MIN(our_send_idx, send_end_idxs[i]);
        size_t elems_to_send =
            MIN(send_end_idxs[i] - our_send_idx, SAMPLE_PARTITION_BUF_SIZE);
        if (elems_to_send > 0) {
            /* Asynchronously send to enclave. */
            ret =
                mpi_tls_isend_bytes(arr + our_send_idx,
                        elems_to_send * sizeof(*arr), i,
                        SAMPLE_PARTITION_DISTRIBUTE_MPI_TAG, &requests[i]);
            if (ret) {
                handle_error_string("Error sending partitioned data");
                goto exit_free_buf;
            }
            num_requests++;
        } else {
            requests[i].type = MPI_TLS_NULL;
        }
    }

    /* Get completed requests in a loop. */
    while (num_requests) {
        size_t index;
        mpi_tls_status_t status;
        ret = mpi_tls_waitany(world_size, requests, &index, &status);
        if (ret) {
            handle_error_string("Error waiting on partition requests");
            goto exit_free_buf;
        }

        if (index == (size_t) world_rank) {
            /* Receive request completed. */

            /* Copy received elements to buffer. */
            size_t req_num_received = status.count / sizeof(*out);
            size_t copy_idx =
                __atomic_fetch_add(recv_idx, req_num_received,
                        __ATOMIC_RELAXED);
            memcpy(out + copy_idx, buf, req_num_received * sizeof(*out));

            size_t our_recv_num =
                __atomic_fetch_add(recv_num, 1, __ATOMIC_RELAXED);
            if (our_recv_num < total_num_recvs) {
                ret =
                    mpi_tls_irecv_bytes(buf,
                            SAMPLE_PARTITION_BUF_SIZE * sizeof(*buf),
                            MPI_TLS_ANY_SOURCE,
                            SAMPLE_PARTITION_DISTRIBUTE_MPI_TAG,
                            &requests[index]);
                if (ret) {
                    handle_error_string("Error receiving partitioned data");
                    goto exit_free_buf;
                }
            } else {
                requests[index].type = MPI_TLS_NULL;
                num_requests--;
            }
        } else {
            /* Send request completed. */
            size_t our_send_idx =
                __atomic_fetch_add(&send_idxs[index], SAMPLE_PARTITION_BUF_SIZE,
                        __ATOMIC_RELAXED);
            our_send_idx = MIN(our_send_idx, send_end_idxs[index]);
            size_t elems_to_send =
                MIN(send_end_idxs[index] - our_send_idx,
                        SAMPLE_PARTITION_BUF_SIZE);
            if (elems_to_send > 0) {
                /* Asynchronously send to enclave. */
                ret =
                    mpi_tls_isend_bytes(arr + our_send_idx,
                            elems_to_send * sizeof(*arr), index,
                            SAMPLE_PARTITION_DISTRIBUTE_MPI_TAG,
                            &requests[index]);
                if (ret) {
                    handle_error_string("Error sending partitioned data");
                    goto exit_free_buf;
                }
            } else {
                requests[index].type = MPI_TLS_NULL;
                num_requests--;
            }
        }
    }

    ret = 0;

exit_free_buf:
    free(buf);
exit:
    if (ret) {
        int expected = 0;
        __atomic_compare_exchange_n(&args->ret, &expected, ret, false,
                __ATOMIC_RELEASE, __ATOMIC_RELAXED);
    }
}

/* Performs a non-oblivious samplesort across all enclaves. */
static int distributed_sample_partition(elem_t *arr, elem_t *out,
        size_t local_length, size_t *out_length, size_t num_threads) {
    int ret;

    /* This should never be called if this is a single-enclave sort. */
    assert(world_size > 1);

    struct sample samples[world_size - 1];
    size_t send_idxs[world_size];
    size_t send_end_idxs[world_size];
    size_t send_counts[world_size];
    size_t recv_counts[world_size];
    mpi_tls_request_t requests[world_size];

    /* Partition the data. Rank 0 partitions/samples from its own array using
     * quickselect and sends the samples to everyone else. All other ranks then
     * partition using those samples with quickpartition. */
    if (world_rank == 0) {
        /* Construct targets to and pass to quickselect. */
        for (size_t i = 0; i < (size_t) world_size - 1; i++) {
            send_end_idxs[i] = local_length * (i + 1) / world_size;
        }
        ret =
            quickselect(arr, local_length, send_end_idxs, samples,
                    world_size - 1, num_threads);
        if (ret) {
            handle_error_string("Error in quickselect");
            goto exit;
        }
        send_end_idxs[world_size - 1] = local_length;

        /* Send the samples to everyone else. */
        for (int i = 0; i < world_size; i++) {
            if (i == world_rank) {
                continue;
            }
            ret =
                mpi_tls_send_bytes(samples, sizeof(samples),
                        i, QUICKSELECT_MPI_TAG);
            if (ret) {
                handle_error_string("Error sending samples from %d to %d", 0,
                        i);
                goto exit;
            }
        }
    } else {
        /* Receive the samples from rank 0. */
        ret =
            mpi_tls_recv_bytes(samples, sizeof(samples), 0, QUICKSELECT_MPI_TAG,
                    MPI_TLS_STATUS_IGNORE);
        if (ret) {
            handle_error_string("Error receiving samples from %d into %d", 0,
                    world_rank);
            goto exit;
        }

        /* Partition with quickpartition. */
        ret =
            quickpartition(arr, local_length, samples, send_end_idxs,
                    world_size - 1, num_threads);
        if (ret) {
            handle_error_string("Error in quickpartition");
            goto exit;
        }
        send_end_idxs[world_size - 1] = local_length;
    }

    /* Compute send counts. */
    for (int i = 0; i < world_size; i++) {
        send_counts[i] = send_end_idxs[i] - (i > 0 ? send_end_idxs[i - 1] : 0);
    }

    /* Sum the number of elements that the other enclaves have sent to us. */
    /* Send our count to all other enclaves. */
    size_t recv_count;
    for (int i = 0; i < world_size; i++) {
        if (i == world_rank) {
            /* Post receive. */
            ret =
                mpi_tls_irecv_bytes(&recv_count, sizeof(recv_count),
                        MPI_TLS_ANY_SOURCE, SAMPLE_PARTITION_MPI_TAG,
                        &requests[i]);
            if (ret) {
                handle_error_string(
                        "Error posting receive for sample partition count into %d",
                        world_rank);
                goto exit;
            }
        } else {
            /* Post send. */
            ret =
                mpi_tls_isend_bytes(&send_counts[i], sizeof(send_counts[i]), i,
                        SAMPLE_PARTITION_MPI_TAG, &requests[i]);
            if (ret) {
                handle_error_string(
                        "Error posting send for sample partition count from %d to %d",
                        world_rank, i);
                goto exit;
            }
        }
    }

    /* Loop (WORLD_SIZE - 1) * 2 times for WORLD_SIZE - 1 sends and
     * WORLD_SIZE - 1 receives. */
    size_t receives_left = world_size - 1;
    recv_counts[world_rank] = send_counts[world_rank];
    *out_length = recv_counts[world_rank];
    for (int i = 0; i < (world_size - 1) * 2; i++) {
        size_t index;
        mpi_tls_status_t status;
        ret = mpi_tls_waitany(world_size, requests, &index, &status);
        if (ret) {
            handle_error_string(
                    "Error waiting on receives for sample partition count");
            goto exit;
        }

        if (index == (size_t) world_rank) {
            recv_counts[status.source] = recv_count;
            *out_length += recv_count;
            receives_left--;

            if (receives_left > 0) {
                /* Post receive. */
                ret =
                    mpi_tls_irecv_bytes(&recv_count, sizeof(recv_count),
                            MPI_TLS_ANY_SOURCE, SAMPLE_PARTITION_MPI_TAG,
                            &requests[index]);
                if (ret) {
                    handle_error_string(
                            "Error posting receive for sample partition count into %d",
                            world_rank);
                    goto exit;
                }
            } else {
                requests[index].type = MPI_TLS_NULL;
            }
        } else {
            requests[index].type = MPI_TLS_NULL;
        }
    }

    /* Sending starts at the previous sample index (or 0). */
    memcpy(send_idxs + 1, send_end_idxs, (world_size - 1) * sizeof(*send_idxs));
    send_idxs[0] = 0;

    //printf("%d\n", getpid());
    //volatile int loop = 1;
    //while (loop) {}

    /* Compute receive statistics. */
    size_t total_num_recvs = 0;
    for (int i = 0; i < world_size; i++) {
        if (i == world_rank) {
            continue;
        }
        total_num_recvs += CEIL_DIV(recv_counts[i], SAMPLE_PARTITION_BUF_SIZE);
    }

    struct send_and_receive_partitions_args args = {
        .arr = arr,
        .out = out,
        .send_idxs = send_idxs,
        .send_end_idxs = send_end_idxs,
        .recv_idx = 0,
        .recv_num = 0,
        .total_num_recvs = total_num_recvs,
        .ret = 0,
    };
    struct thread_work work = {
        .type = THREAD_WORK_ITER,
        .iter = {
            .func = send_and_receive_partitions,
            .arg = &args,
            .count = num_threads,
        },
    };
    thread_work_push(&work);
    thread_work_until_empty();
    thread_wait(&work);
    ret = args.ret;
    if (ret) {
        handle_error_string("Error sending and receiving partitions");
        goto exit;
    }

exit:
    return ret;
}

/* Balance the elements across enclaves after the unbalanced partitioning step
 * and sorting step. */
static int balance(elem_t *arr, elem_t *out, size_t total_length,
        size_t in_length) {
    mpi_tls_request_t requests[world_size * 2];
    mpi_tls_request_t *send_requests = requests;
    mpi_tls_request_t *recv_requests = requests + world_size;
    int ret;

    /* This should never be called if this is a single-enclave sort. */
    assert(world_size > 1);

    /* Get all cumulative lengths across ranks. RANK_LENGTHS[i] holds the number
     * of elements in ranks 0 to i - 1. */
    size_t rank_cum_idxs[world_size + 1];
    size_t send_idxs[world_size];
    size_t recv_idxs[world_size];
    size_t send_final_idxs[world_size];
    size_t recv_final_idxs[world_size];
    if (world_rank == 0) {
        /* Receive individual lengths from everyone. */
        rank_cum_idxs[0] = in_length;
        for (int i = 0; i < world_size - 1; i++) {
            size_t rank_length;
            mpi_tls_status_t status;
            ret =
                mpi_tls_recv_bytes(&rank_length, sizeof(rank_length),
                        MPI_TLS_ANY_SOURCE, BALANCE_MPI_TAG, &status);
            if (ret) {
                handle_error_string("Error receiving rank length into %d", 0);
                goto exit;
            }
            rank_cum_idxs[status.source] = rank_length;
        }

        /* Compute cumulative lengths. */
        size_t cur_length = 0;
        for (int i = 0; i < world_size; i++) {
            size_t prev_length = cur_length;
            cur_length += rank_cum_idxs[i];
            rank_cum_idxs[i] = prev_length;
        }
        rank_cum_idxs[world_size] = total_length;

        /* Send cumulative lengths to everyone. */
        for (int i = 0; i < world_size; i++) {
            if (i == world_rank) {
                continue;
            }
            ret =
                mpi_tls_send_bytes(rank_cum_idxs, sizeof(rank_cum_idxs), i,
                        BALANCE_MPI_TAG);
            if (ret) {
                handle_error_string(
                        "Error sending cumulative lengths from %d to %d", 0, i);
                goto exit;
            }
        }
    } else {
        /* Send length to rank 0. */
        ret =
            mpi_tls_send_bytes(&in_length, sizeof(in_length), 0,
                    BALANCE_MPI_TAG);
        if (ret) {
            handle_error_string("Error sending rank length from %d to %d", 0,
                    world_rank);
            goto exit;
        }

        /* Receive cumulative lengths from rank 0. */
        ret =
            mpi_tls_recv_bytes(rank_cum_idxs, sizeof(rank_cum_idxs), 0,
                    BALANCE_MPI_TAG, NULL);
        if (ret) {
            handle_error_string(
                    "Error receiving cumulative lengths from %d into %d", 0,
                    world_rank);
            goto exit;
        }
    }

    /* Compute at which indices we need to send the elements we currently have
     * to each rank and at which indices we need to receive elements from other
     * ranks. */
    size_t local_start = world_rank * total_length / world_size;
    size_t local_end = (world_rank + 1) * total_length / world_size;
    size_t local_length = local_end - local_start;
    for (int i = 0; i < world_size; i++) {
        size_t i_local_start = i * total_length / world_size;
        send_idxs[i] =
            MAX(
                    MIN(i_local_start, rank_cum_idxs[world_rank + 1]),
                    rank_cum_idxs[world_rank])
                - rank_cum_idxs[world_rank];
        recv_idxs[i] =
            MAX(MIN(rank_cum_idxs[i], local_end), local_start) - local_start;
    }
    assert(world_size > 1);
    memcpy(send_final_idxs, send_idxs + 1,
            (world_size - 1) * sizeof(*send_final_idxs));
    send_final_idxs[world_size - 1] = in_length;
    memcpy(recv_final_idxs, recv_idxs + 1,
            (world_size - 1) * sizeof(*recv_final_idxs));
    recv_final_idxs[world_size - 1] = local_length;

    /* Construct initial requests. */
    size_t num_requests = 0;
    for (int i = 0; i < world_size; i++) {
        /* Copy our input to our output for ourselves and continue. */
        if (i == world_rank) {
            size_t elems_to_copy = send_final_idxs[i] - send_idxs[i];
            assert(elems_to_copy == recv_final_idxs[i] - recv_idxs[i]);
            if (elems_to_copy) {
                memcpy(out + recv_idxs[i], arr + send_idxs[i],
                        elems_to_copy * sizeof(*out));
                send_idxs[i] += elems_to_copy;
                recv_idxs[i] += elems_to_copy;
            }
            send_requests[i].type = MPI_TLS_NULL;
            recv_requests[i].type = MPI_TLS_NULL;
            continue;
        }

        /* Construct send requests. */
        if (send_idxs[i] < send_final_idxs[i]) {
            size_t elems_to_send =
                MIN(send_final_idxs[i] - send_idxs[i],
                        SAMPLE_PARTITION_BUF_SIZE);
            ret =
                mpi_tls_isend_bytes(arr + send_idxs[i],
                        elems_to_send * sizeof(*arr), i, BALANCE_MPI_TAG,
                        &send_requests[i]);
            if (ret) {
                handle_error_string(
                        "Error sending balance elements from %d to %d",
                        world_rank, i);
                goto exit;
            }
            send_idxs[i] += elems_to_send;
            num_requests++;
        } else {
            send_requests[i].type = MPI_TLS_NULL;
        }

        /* Construct receive requests. */
        if (recv_idxs[i] < recv_final_idxs[i]) {
            size_t elems_to_recv =
                MIN(recv_final_idxs[i] - recv_idxs[i],
                        SAMPLE_PARTITION_BUF_SIZE);
            ret =
                mpi_tls_irecv_bytes(out + recv_idxs[i],
                        elems_to_recv * sizeof(*out), i, BALANCE_MPI_TAG,
                        &recv_requests[i]);
            if (ret) {
                handle_error_string(
                        "Error receiving balance elements from %d into %d",
                        i, world_rank);
                goto exit;
            }
            recv_idxs[i] += elems_to_recv;
            num_requests++;
        } else {
            recv_requests[i].type = MPI_TLS_NULL;
        }
    }

    /* Repeatedly wait and send. */
    while (num_requests) {
        size_t index;
        mpi_tls_status_t status;
        ret = mpi_tls_waitany(world_size * 2, requests, &index, &status);
        if (ret) {
            handle_error_string("Error waiting on balance MPI requests");
            goto exit;
        }

        if (index < (size_t) world_size) {
            /* This was a send request. */
            int rank = index;
            if (send_idxs[rank] < send_final_idxs[rank]) {
                size_t elems_to_send =
                    MIN(send_final_idxs[rank] - send_idxs[rank],
                            SAMPLE_PARTITION_BUF_SIZE);
                ret =
                    mpi_tls_isend_bytes(arr + send_idxs[rank],
                            elems_to_send * sizeof(*out), rank,
                            BALANCE_MPI_TAG, &send_requests[rank]);
                if (ret) {
                    handle_error_string(
                            "Error receiving balance elements from %d into %d",
                            rank, world_rank);
                    goto exit;
                }
                send_idxs[rank] += elems_to_send;
            } else {
                send_requests[rank].type = MPI_TLS_NULL;
                num_requests--;
            }
        } else {
            int rank = index - world_size;
            /* This was a receive request. */
            if (recv_idxs[rank] < recv_final_idxs[rank]) {
                size_t elems_to_recv =
                    MIN(recv_final_idxs[rank] - recv_idxs[rank],
                            SAMPLE_PARTITION_BUF_SIZE);
                ret =
                    mpi_tls_irecv_bytes(out + recv_idxs[rank],
                            elems_to_recv * sizeof(*out), rank,
                            BALANCE_MPI_TAG, &recv_requests[rank]);
                if (ret) {
                    handle_error_string(
                            "Error receiving balance elements from %d into %d",
                            rank, world_rank);
                    goto exit;
                }
                recv_idxs[rank] += elems_to_recv;
            } else {
                recv_requests[rank].type = MPI_TLS_NULL;
                num_requests--;
            }
        }
    }

    ret = 0;

exit:
    return ret;
}

int nonoblivious_sort(elem_t *arr, elem_t *out, size_t length,
        size_t local_length, size_t num_threads) {
    int ret;

    if (world_size == 1) {
        struct timespec time_start;
        if (clock_gettime(CLOCK_REALTIME, &time_start)) {
            handle_error_string("Error getting time");
            ret = errno;
            goto exit;
        }

        /* Sort local partitions. */
        ret = mergesort(arr, out, length, num_threads);
        if (ret) {
            handle_error_string("Error in non-oblivious local sort");
            goto exit;
        }

        /* Copy local sort output to final output. */
        memcpy(arr, out, length * sizeof(*arr));

        struct timespec time_finish;
        if (clock_gettime(CLOCK_REALTIME, &time_finish)) {
            handle_error_string("Error getting time");
            ret = errno;
            goto exit;
        }

        if (world_rank == 0) {
            printf("sample_partition : %f\n", 0.0);
            printf("local_sort       : %f\n",
                    get_time_difference(&time_start, &time_finish));
            printf("balance          : %f\n", 0.0);
        }

        goto exit;
    }

    struct timespec time_start;
    if (clock_gettime(CLOCK_REALTIME, &time_start)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Partition permuted data such that each enclave has its own partition of
     * element, e.g. enclave 0 has the lowest elements, then enclave 1, etc. */
    size_t partition_length;
    ret =
        distributed_sample_partition(arr, out, local_length, &partition_length,
                num_threads);
    if (ret) {
        handle_error_string("Error in distributed sample partitioning");
        goto exit;
    }

    struct timespec time_sample_partition;
    if (clock_gettime(CLOCK_REALTIME, &time_sample_partition)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Sort local partitions. */
    ret = mergesort(out, arr, partition_length, num_threads);
    if (ret) {
        handle_error_string("Error in non-oblivious local sort");
        goto exit;
    }

    struct timespec time_local_sort;
    if (clock_gettime(CLOCK_REALTIME, &time_local_sort)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    /* Balance partitions. */
    ret = balance(arr, out, length, partition_length);
    if (ret) {
        handle_error_string("Error in non-oblivious balancing");
        goto exit;
    }

    struct timespec time_finish;
    if (clock_gettime(CLOCK_REALTIME, &time_finish)) {
        handle_error_string("Error getting time");
        ret = errno;
        goto exit;
    }

    if (world_rank == 0) {
        printf("sample_partition : %f\n",
                get_time_difference(&time_start, &time_sample_partition));
        printf("local_sort       : %f\n",
                get_time_difference(&time_sample_partition, &time_local_sort));
        printf("balance          : %f\n",
                get_time_difference(&time_local_sort, &time_finish));
    }

exit:
    return ret;
}
