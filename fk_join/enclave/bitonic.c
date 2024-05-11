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
#include "enclave/scalable_oblivious_join.h"

#define SWAP_CHUNK_SIZE 4096

static bool dimension2D;
static elem_t *arr;

bool compare2D(elem_t* a, elem_t* b) {
    bool c;
    c = (a->key < b->key) || (dimension2D && (a->key == b->key) && (a->table_0 > b->table_0));
    return c;
}

bool compare2D_(long long a, long long b) {
    bool c;
    c = (arr[a].key < arr[b].key) || (dimension2D && (arr[a].key == arr[b].key) && (arr[a].table_0 > arr[b].table_0));
    return c;
}

inline long long prev_pow_two(long long x) {
    long long y = 1;
    while (y < x) y <<= 1;
    return y >>= 1;
}

void bitonic_compare(bool ascend, long long i, long long j) {
    bool condition = !(compare2D_(i, j) == ascend);
    o_memswap(arr+i, arr+j, sizeof(*arr),condition);
}

void bitonic_merge_2(void *voidargs) {
    struct bitonic_merge_args_2 *args = (struct bitonic_merge_args_2*)voidargs;
    bool ascend = args->ascend;
    long long a = args->a;
    long long b = args->b;
    long long c = args->c;

    for(long long i = a; i < b; i++) {
        bitonic_compare(ascend, i, i + c);
    }

    return;
}

void bitonic_merge(void *voidargs) {
    struct bitonic_merge_args_1 *args = (struct bitonic_merge_args_1*)voidargs;
    bool ascend = args->ascend;
    long long lo = args->lo;
    long long hi = args->hi;
    int number_threads = args->number_threads;

    if (hi <= lo + 1) return;

    long long mid_len = prev_pow_two(hi - lo);

    if (number_threads <= 1) {
        for (long long i = lo; i < hi - mid_len; i++) {
            bitonic_compare(ascend, i, i + mid_len);
        }
    } else {
        struct bitonic_merge_args_2 args2[number_threads];
        long long index_start[number_threads + 1];
        index_start[0] = lo;
        long long length_thread = (hi - mid_len - lo) / number_threads;
        long long length_extra = (hi - mid_len - lo) % number_threads;
        struct thread_work work[number_threads - 1];
        
        for (long long i = 0; i < number_threads; i++) {
            index_start[i + 1] = index_start[i] + length_thread + (i < length_extra);
            
            args2[i].ascend = ascend;
            args2[i].a = index_start[i];
            args2[i].b = index_start[i + 1];
            args2[i].c = mid_len;

            if (i < number_threads - 1) {
                work[i].type = THREAD_WORK_SINGLE;
                work[i].single.func = bitonic_merge_2;
                work[i].single.arg = args2 + i;
                thread_work_push(&work[i]);
            }
        }
        bitonic_merge_2(&args2[number_threads - 1]);
        for (long long i = 0; i < number_threads - 1; i++) {
            thread_wait(&work[i]);
        }
    }


    if (1 < number_threads) {
        int number_threads_left = number_threads / 2;
        int number_threads_right = number_threads - number_threads_left;
        struct bitonic_merge_args_1 args1 = {
            .ascend = ascend,
            .lo = lo,
            .hi = lo + mid_len,
            .number_threads = number_threads_left,
        };
        struct bitonic_merge_args_1 args2 = {
            .ascend = ascend,
            .lo = lo + mid_len,
            .hi = hi,
            .number_threads = number_threads_right,
        };
        struct thread_work work_;
        work_.type = THREAD_WORK_SINGLE;
        work_.single.func = bitonic_merge;
        work_.single.arg = &args1;
        thread_work_push(&work_);

        bitonic_merge(&args2);

        thread_wait(&work_);
    } else {
        struct bitonic_merge_args_1 args1 = {
            .ascend = ascend,
            .lo = lo,
            .hi = lo + mid_len,
            .number_threads = 1,
        };
        struct bitonic_merge_args_1 args2 = {
            .ascend = ascend,
            .lo = lo + mid_len,
            .hi = hi,
            .number_threads = 1,
        };

        bitonic_merge(&args1);
        bitonic_merge(&args2);
    }

    return;
}

struct bitonic_sort_new_args {
    bool ascend;
    long long lo;
    long long hi;
    int number_threads;
};

void bitonic_sort_new(void *voidargs) {
    struct bitonic_sort_new_args *args = (struct bitonic_sort_new_args*)voidargs;
    bool ascend = args->ascend;
    long long lo = args->lo;
    long long hi = args->hi;
    int number_threads = args->number_threads;

    if (hi == -1) {
        printf("\nWrong parameter for bitonic sort, exit!");
        return;
    };

    long long mid = lo + (hi - lo) / 2;

    if (mid == lo) return;
    
    if (number_threads <= 1) {
        struct bitonic_sort_new_args args1 = {
                .ascend = !ascend,
                .lo = lo,
                .hi = mid,
                .number_threads = 1,
        };
        struct bitonic_sort_new_args args2 = {
                .ascend = ascend,
                .lo = mid,
                .hi = hi,
                .number_threads = 1,
        };

        bitonic_sort_new(&args1);
        bitonic_sort_new(&args2);
    } else {
        int number_threads_left = number_threads / 2;
        int number_threads_right = number_threads - number_threads_left;
        struct bitonic_sort_new_args args1 = {
                .ascend = !ascend,
                .lo = lo,
                .hi = mid,
                .number_threads = number_threads_left,
        };
        struct bitonic_sort_new_args args2 = {
                .ascend = ascend,
                .lo = mid,
                .hi = hi,
                .number_threads = number_threads_right,
        };

        struct thread_work work;
        work.type = THREAD_WORK_SINGLE;
        work.single.func = bitonic_sort_new;
        work.single.arg = &args1;
        thread_work_push(&work);

        bitonic_sort_new(&args2);

        thread_wait(&work);
    };

    struct bitonic_merge_args_1 args_merge = {
        .ascend = ascend,
        .lo = lo,
        .hi = hi,
        .number_threads = number_threads,
    };
    bitonic_merge(&args_merge);
}

void bitonic_sort(elem_t *arr_, bool ascend, long long lo, long long hi, long long number_threads, bool D2enable) {
    arr = arr_;
    dimension2D = D2enable;
    struct bitonic_merge_args_1 args = {
        .ascend = ascend,
        .lo = lo,
        .hi = hi,
        .number_threads = (int)number_threads,
    };
    bitonic_sort_new(&args);

    return;
}