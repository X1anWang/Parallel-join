#include "enclave/bitonic.h"
#include <limits.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <threads.h>
#include <liboblivious/algorithms.h>
#include <liboblivious/primitives.h>
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "enclave/mpi_tls.h"
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"

#define SWAP_CHUNK_SIZE 4096

static size_t total_length;

static thread_local elem_t *buffer;

int bitonic_init(void) {
    /* Allocate buffers. */
    buffer = malloc(SWAP_CHUNK_SIZE * sizeof(*buffer));
    if (!buffer) {
        perror("malloc local_buffer");
        goto exit;
    }

    return 0;

exit:
    return -1;
}

void bitonic_free(void) {
    /* Free resources. */
    free(buffer);
}

/* Array index and world rank relationship helpers. */

static int get_index_address(size_t index) {
    return index * world_size / total_length;
}

static size_t get_local_start(int rank) {
    return (rank * total_length + world_size - 1) / world_size;
}

/* Swapping. */

static void swap_local_range(elem_t *arr, size_t a, size_t b, size_t count,
        bool crossover) {
    size_t local_start = get_local_start(world_rank);

    if (crossover) {
        for (size_t i = 0; i < count; i++) {
            bool cond =
                arr[a + i - local_start].key
                    > arr[b + count - 1 - i - local_start].key;
            o_memswap(&arr[a + i - local_start],
                    &arr[b + count - 1 - i - local_start], sizeof(*arr),
                    cond);
        }
    } else {
        for (size_t i = 0; i < count; i++) {
            bool cond =
                arr[a + i - local_start].key > arr[b + i - local_start].key;
            o_memswap(&arr[a + i - local_start], &arr[b + i - local_start],
                    sizeof(*arr), cond);
        }
    }
}

struct swap_remote_range_args {
    elem_t *arr;
    size_t local_idx;
    size_t remote_idx;
    size_t count;
    bool crossover;
    size_t num_threads;
};
static void swap_remote_range(void *args_, size_t thread_idx) {
    struct swap_remote_range_args *args = args_;
    elem_t *arr = args->arr;
    size_t local_idx = args->local_idx;
    size_t remote_idx = args->remote_idx;
    size_t count = args->count;
    bool crossover = args->crossover;
    size_t num_threads = args->num_threads;
    int ret;

    size_t local_start = get_local_start(world_rank);
    int remote_rank = get_index_address(remote_idx);

    /* Swap elems in maximum chunk sizes of SWAP_CHUNK_SIZE and iterate until no
     * count is remaining. */
    size_t start = thread_idx * count / num_threads;
    size_t end = (thread_idx + 1) * count / num_threads;
    size_t our_local_idx =
        crossover && local_idx > remote_idx
            ? local_idx + count - start
            : local_idx + start;
    size_t our_remote_idx =
        crossover && local_idx < remote_idx
            ? remote_idx + count - start
            : remote_idx + start;
    size_t our_count = end - start;
    while (our_count) {
        size_t elems_to_swap = MIN(our_count, SWAP_CHUNK_SIZE);

        /* Post receive for remote elems to buffer. */
        mpi_tls_request_t request;
        ret =
            mpi_tls_irecv_bytes(buffer, elems_to_swap * sizeof(*buffer),
                    remote_rank,
                    crossover && local_idx < remote_idx
                        ? (our_remote_idx - elems_to_swap) / SWAP_CHUNK_SIZE
                        : our_remote_idx / SWAP_CHUNK_SIZE,
                    &request);
        if (ret) {
            handle_error_string("Error receiving elem bytes");
            return;
        }

        /* Send local elems to the remote. */
        ret =
            mpi_tls_send_bytes(
                    crossover && our_local_idx > remote_idx
                        ? arr + our_local_idx - elems_to_swap - local_start
                        : arr + our_local_idx - local_start,
                    elems_to_swap * sizeof(*arr), remote_rank,
                    crossover && local_idx > remote_idx
                        ? (our_local_idx - elems_to_swap) / SWAP_CHUNK_SIZE
                        : our_local_idx / SWAP_CHUNK_SIZE);
        if (ret) {
            handle_error_string("Error sending elem bytes");
            return;
        }

        /* Wait for received elems to come in. */
        ret = mpi_tls_wait(&request, MPI_TLS_STATUS_IGNORE);
        if (ret) {
            handle_error_string("Error waiting on receive for elem bytes");
            return;
        }

        /* Replace the local elements with the received remote elements if
         * necessary. If the local index is lower, then we swap if the local
         * element is lower. Likewise, if the local index is higher, than we
         * swap if the local element is higher. */
        if (crossover) {
            if (our_local_idx < our_remote_idx) {
                for (size_t i = 0; i < elems_to_swap; i++) {
                    bool cond =
                        arr[our_local_idx + i - local_start].key
                            > buffer[elems_to_swap - 1 - i].key;
                    o_memcpy(&arr[our_local_idx + i - local_start],
                            &buffer[elems_to_swap - 1 - i], sizeof(*arr), cond);
                }
            } else {
                for (size_t i = 0; i < elems_to_swap; i++) {
                    bool cond =
                        arr[our_local_idx - elems_to_swap + i - local_start].key
                            < buffer[elems_to_swap - 1 - i].key;
                    o_memcpy(
                            &arr[our_local_idx - elems_to_swap + i - local_start],
                            &buffer[elems_to_swap - 1 - i], sizeof(*arr), cond);
                }
            }
        } else {
            for (size_t i = 0; i < elems_to_swap; i++) {
                bool cond =
                    (our_local_idx < our_remote_idx)
                        == (arr[our_local_idx + i - local_start].key
                                > buffer[i].key);
                o_memcpy(&arr[our_local_idx + i - local_start], &buffer[i],
                        sizeof(*arr), cond);
            }
        }

        /* Bump pointers, decrement count, and continue. */
        if (crossover) {
            if (local_idx < remote_idx) {
                our_local_idx += elems_to_swap;
                our_remote_idx -= elems_to_swap;
            } else {
                our_local_idx -= elems_to_swap;
                our_remote_idx += elems_to_swap;
            }
        } else {
            our_local_idx += elems_to_swap;
            our_remote_idx += elems_to_swap;
        }
        our_count -= elems_to_swap;
    }
}

static void swap_range(elem_t *arr, size_t a_start, size_t b_start,
        size_t count, bool crossover, size_t num_threads) {
    // TODO Assumption: Only either a subset of range A is local, or a subset of
    // range B is local. For local-remote swaps, the subset of the remote range
    // correspondingw with the local range is entirely contained within a single
    // elem. This requires that both the number of elements and the number of
    // elems is a power of 2.

    size_t local_start = get_local_start(world_rank);
    size_t local_end = get_local_start(world_rank + 1);
    bool a_is_local = a_start < local_end && a_start + count > local_start;
    bool b_is_local = b_start < local_end && b_start + count > local_start;

    if (a_is_local && b_is_local) {
        swap_local_range(arr, a_start, b_start, count, crossover);
    } else if (a_is_local) {
        size_t a_local_start = MAX(a_start, local_start);
        size_t a_local_end = MIN(a_start + count, local_end);
        struct swap_remote_range_args args = {
            .arr = arr,
            .local_idx = a_local_start,
            .remote_idx =
                crossover
                    ? b_start + count - (a_local_start - a_start)
                        - (a_local_end - a_local_start)
                    : b_start + a_local_start - a_start,
            .count = a_local_end - a_local_start,
            .crossover = crossover,
            .num_threads = num_threads,
        };
        struct thread_work work;
        if (num_threads > 1) {
            work.type = THREAD_WORK_ITER;
            work.iter.func = swap_remote_range;
            work.iter.arg = &args;
            work.iter.count = num_threads - 1;
            thread_work_push(&work);
        }
        swap_remote_range(&args, num_threads - 1);
        if (num_threads > 1) {
            thread_wait(&work);
        }
    } else if (b_is_local) {
        size_t b_local_start = MAX(b_start, local_start);
        size_t b_local_end = MIN(b_start + count, local_end);
        struct swap_remote_range_args args = {
            .arr = arr,
            .local_idx = b_local_start,
            .remote_idx =
                crossover
                    ? a_start + count - (b_local_start - b_start)
                        - (b_local_end - b_local_start)
                    : a_start + b_local_start - b_start,
            .count = b_local_end - b_local_start,
            .crossover = crossover,
            .num_threads = num_threads,
        };
        struct thread_work work;
        if (num_threads > 1) {
            work.type = THREAD_WORK_ITER;
            work.iter.func = swap_remote_range;
            work.iter.arg = &args;
            work.iter.count = num_threads - 1;
            thread_work_push(&work);
        }
        swap_remote_range(&args, num_threads - 1);
        if (num_threads > 1) {
            thread_wait(&work);
        }
    }
}

/* Bitonic sort. */

struct merge_args {
    elem_t *arr;
    size_t start;
    size_t length;
    bool crossover;
    size_t num_threads;
};
static void merge(void *args_) {
    struct merge_args *args = args_;
    elem_t *arr = args->arr;
    size_t start = args->start;
    size_t length = args->length;
    bool crossover = args->crossover;
    size_t num_threads = args->num_threads;

    switch (length) {
        case 0:
        case 1:
            /* Do nothing. */
            break;
        case 2: {
            swap_range(arr, start, start + 1, 1, false, 1);
            break;
        }
        default: {
            /* If the length is odd, bubble sort an element to the end of the
             * array and leave it there. */
            size_t left_length = length / 2;
            size_t right_length = length - left_length;
            size_t right_start = start + left_length;
            swap_range(arr, start, right_start, left_length, crossover,
                    num_threads);

            /* Recursively merge. */
            struct merge_args left_args = {
                .arr = arr,
                .start = start,
                .length = left_length,
                .crossover = false,
            };
            struct merge_args right_args = {
                .arr = arr,
                .start = right_start,
                .length = right_length,
                .crossover = false,
            };
            if (right_start >= get_local_start(world_rank + 1)) {
                /* Only merge the left. The right is completely remote. */
                left_args.num_threads = num_threads;
                merge(&left_args);
            } else if (right_start <= get_local_start(world_rank)) {
                /* Only merge the right. The left is completely remote. */
                right_args.num_threads = num_threads;
                merge(&right_args);
            } else if (num_threads > 1) {
                /* Merge both with separate threads. */
                size_t right_threads = num_threads / 2;
                left_args.num_threads = num_threads - right_threads;
                right_args.num_threads = right_threads;
                struct thread_work right_work = {
                    .type = THREAD_WORK_SINGLE,
                    .single = {
                        .func = merge,
                        .arg = &right_args,
                    },
                };
                thread_work_push(&right_work);
                merge(&left_args);
                thread_wait(&right_work);
            } else {
                /* Merge both in our own thread. */
                left_args.num_threads = 1;
                right_args.num_threads = 1;
                merge(&left_args);
                merge(&right_args);
            }
            break;
         }
    }
}

struct sort_args {
    elem_t *arr;
    size_t start;
    size_t length;
    size_t num_threads;
};
static void sort(void *args_) {
    struct sort_args *args = args_;
    elem_t *arr = args->arr;
    size_t start = args->start;
    size_t length = args->length;
    size_t num_threads = args->num_threads;

    switch (length) {
        case 0:
        case 1:
            /* Do nothing. */
            break;
        case 2: {
            swap_range(arr, start, start + 1, 1, false, 1);
            break;
        }
        default: {
            /* Recursively sort left half forwards and right half in reverse to
             * create a bitonic sequence. */
            size_t left_length = length / 2;
            size_t right_length = length - left_length;
            size_t right_start = start + left_length;
            struct sort_args left_args = {
                .arr = arr,
                .start = start,
                .length = left_length,
            };
            struct sort_args right_args = {
                .arr = arr,
                .start = right_start,
                .length = right_length,
            };
            if (right_start >= get_local_start(world_rank + 1)) {
                /* Only sort the left. The right is completely remote. */
                left_args.num_threads = num_threads;
                sort(&left_args);
            } else if (right_start <= get_local_start(world_rank)) {
                /* Only sort the right. The left is completely remote. */
                right_args.num_threads = num_threads;
                sort(&right_args);
            } else if (num_threads > 1) {
                /* Sort both with separate threads. */
                size_t right_threads = num_threads / 2;
                left_args.num_threads = num_threads - right_threads;
                right_args.num_threads = right_threads;
                struct thread_work right_work = {
                    .type = THREAD_WORK_SINGLE,
                    .single = {
                        .func = sort,
                        .arg = &right_args,
                    },
                };
                thread_work_push(&right_work);
                sort(&left_args);
                thread_wait(&right_work);
            } else {
                /* Sort both in our own thread. */
                left_args.num_threads = 1;
                right_args.num_threads = 1;
                sort(&left_args);
                sort(&right_args);
            }

            /* Bitonic merge. */
            struct merge_args merge_args = {
                .arr = arr,
                .start = start,
                .length = length,
                .crossover = true,
                .num_threads = num_threads,
            };
            merge(&merge_args);
            break;
        }
    }
}

/* Entry. */

void bitonic_sort(elem_t *arr, size_t length, size_t num_threads) {
    total_length = length;

    if (1lu << log2ll(length) != length) {
        fprintf(stderr, "Length must be a multiple of 2\n");
        goto exit;
    }

    /* Start work for this thread. */
    struct sort_args args = {
        .arr = arr,
        .start = 0,
        .length = total_length,
        .num_threads = num_threads,
    };
    sort(&args);

exit:
    ;
}
