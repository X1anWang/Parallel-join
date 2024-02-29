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


static elem_t *arr;


bool compare2Da(int a, int b) {
    bool c;
    c = arr[a].key < arr[b].key;
    return c;
}

bool compare2Db(int a, int b) {
    bool c;
    c = (arr[a].key < arr[b].key) || ((arr[a].key == arr[b].key) && (arr[a].j_order < arr[b].j_order));
    return c;
}



inline int prev_pow_two(int x) {
    int y = 1;
    while (y < x) y <<= 1;
    return y >>= 1;
}

void bitonic_comparea(bool ascend, int i, int j) {
    bool condition = !(compare2Da(i, j) == ascend);
    o_memswap(arr+i, arr+j, sizeof(*arr),condition);
}

void bitonic_compareb(bool ascend, int i, int j) {
    bool condition = !(compare2Db(i, j) == ascend);
    o_memswap(arr+i, arr+j, sizeof(*arr),condition);
}

struct bitonic_merge_args_1 {
    bool ascend;
    int lo;
    int hi;
    int number_threads;
};

struct bitonic_merge_args_2 {
    bool ascend;
    int a;
    int b;
    int c; //mid_len
};

void bitonic_merge_2a(void *voidargs) {
    struct bitonic_merge_args_2 *args = (struct bitonic_merge_args_2*)voidargs;
    bool ascend = args->ascend;
    int a = args->a;
    int b = args->b;
    int c = args->c;

    for(int i = a; i < b; i++) {
        bitonic_comparea(ascend, i, i + c);
    }

    return;
}

void bitonic_merge_2b(void *voidargs) {
    struct bitonic_merge_args_2 *args = (struct bitonic_merge_args_2*)voidargs;
    bool ascend = args->ascend;
    int a = args->a;
    int b = args->b;
    int c = args->c;

    for(int i = a; i < b; i++) {
        bitonic_compareb(ascend, i, i + c);
    }

    return;
}

void bitonic_mergea(void *voidargs) {
    struct bitonic_merge_args_1 *args = (struct bitonic_merge_args_1*)voidargs;
    bool ascend = args->ascend;
    int lo = args->lo;
    int hi = args->hi;
    int number_threads = args->number_threads;

    if (hi <= lo + 1) return;

    int mid_len = prev_pow_two(hi - lo);

    if (number_threads <= 1) {
        for (int i = lo; i < hi - mid_len; i++) {
            bitonic_comparea(ascend, i, i + mid_len);
        }
    } else {
        struct bitonic_merge_args_2 args2[number_threads];
        int index_start[number_threads + 1];
        index_start[0] = lo;
        int length_thread = (hi - mid_len - lo) / number_threads;
        int length_extra = (hi - mid_len - lo) % number_threads;
        struct thread_work work[number_threads - 1];
        
        for (int i = 0; i < number_threads; i++) {
            index_start[i + 1] = index_start[i] + length_thread + (i < length_extra);
            
            args2[i].ascend = ascend;
            args2[i].a = index_start[i];
            args2[i].b = index_start[i + 1];
            args2[i].c = mid_len;

            if (i < number_threads - 1) {
                work[i].type = THREAD_WORK_SINGLE;
                work[i].single.func = bitonic_merge_2a;
                work[i].single.arg = args2 + i;
                thread_work_push(&work[i]);
            }
        }
        bitonic_merge_2a(&args2[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
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
        work_.single.func = bitonic_mergea;
        work_.single.arg = &args1;
        thread_work_push(&work_);

        bitonic_mergea(&args2);

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

        bitonic_mergea(&args1);
        bitonic_mergea(&args2);
    }

    return;
}

void bitonic_mergeb(void *voidargs) {
    struct bitonic_merge_args_1 *args = (struct bitonic_merge_args_1*)voidargs;
    bool ascend = args->ascend;
    int lo = args->lo;
    int hi = args->hi;
    int number_threads = args->number_threads;

    if (hi <= lo + 1) return;

    int mid_len = prev_pow_two(hi - lo);

    if (number_threads <= 1) {
        for (int i = lo; i < hi - mid_len; i++) {
            bitonic_compareb(ascend, i, i + mid_len);
        }
    } else {
        struct bitonic_merge_args_2 args2[number_threads];
        int index_start[number_threads + 1];
        index_start[0] = lo;
        int length_thread = (hi - mid_len - lo) / number_threads;
        int length_extra = (hi - mid_len - lo) % number_threads;
        struct thread_work work[number_threads - 1];
        
        for (int i = 0; i < number_threads; i++) {
            index_start[i + 1] = index_start[i] + length_thread + (i < length_extra);
            
            args2[i].ascend = ascend;
            args2[i].a = index_start[i];
            args2[i].b = index_start[i + 1];
            args2[i].c = mid_len;

            if (i < number_threads - 1) {
                work[i].type = THREAD_WORK_SINGLE;
                work[i].single.func = bitonic_merge_2b;
                work[i].single.arg = args2 + i;
                thread_work_push(&work[i]);
            }
        }
        bitonic_merge_2b(&args2[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
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
        work_.single.func = bitonic_mergeb;
        work_.single.arg = &args1;
        thread_work_push(&work_);

        bitonic_mergeb(&args2);

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

        bitonic_mergeb(&args1);
        bitonic_mergeb(&args2);
    }

    return;
}

struct bitonic_sort_new_args {
    bool ascend;
    int lo;
    int hi;
    int number_threads;
};

void bitonic_sort_newa(void *voidargs) {
    struct bitonic_sort_new_args *args = (struct bitonic_sort_new_args*)voidargs;
    bool ascend = args->ascend;
    int lo = args->lo;
    int hi = args->hi;
    int number_threads = args->number_threads;

    if (hi == -1) {
        printf("\nWrong parameter for bitonic sort, exit!");
        return;
    };

    int mid = lo + (hi - lo) / 2;

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

        bitonic_sort_newa(&args1);
        bitonic_sort_newa(&args2);
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
        work.single.func = bitonic_sort_newa;
        work.single.arg = &args1;
        thread_work_push(&work);

        bitonic_sort_newa(&args2);

        thread_wait(&work);
    };

    struct bitonic_merge_args_1 args_merge = {
        .ascend = ascend,
        .lo = lo,
        .hi = hi,
        .number_threads = number_threads,
    };
    bitonic_mergea(&args_merge);
}

void bitonic_sort_newb(void *voidargs) {
    struct bitonic_sort_new_args *args = (struct bitonic_sort_new_args*)voidargs;
    bool ascend = args->ascend;
    int lo = args->lo;
    int hi = args->hi;
    int number_threads = args->number_threads;

    if (hi == -1) {
        printf("\nWrong parameter for bitonic sort, exit!");
        return;
    };

    int mid = lo + (hi - lo) / 2;

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

        bitonic_sort_newb(&args1);
        bitonic_sort_newb(&args2);
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
        work.single.func = bitonic_sort_newb;
        work.single.arg = &args1;
        thread_work_push(&work);

        bitonic_sort_newb(&args2);

        thread_wait(&work);
    };

    struct bitonic_merge_args_1 args_merge = {
        .ascend = ascend,
        .lo = lo,
        .hi = hi,
        .number_threads = number_threads,
    };
    bitonic_mergeb(&args_merge);
}

void bitonic_sorta(elem_t *arr_, int hi, int number_threads) {
    arr = arr_;
    struct bitonic_merge_args_1 args = {
        .ascend = true,
        .lo = 0,
        .hi = hi,
        .number_threads = number_threads,
    };
    bitonic_sort_newa(&args);

    return;
}

void bitonic_sortb(elem_t *arr_, int hi, int number_threads) {
    arr = arr_;
    struct bitonic_merge_args_1 args = {
        .ascend = true,
        .lo = 0,
        .hi = hi,
        .number_threads = number_threads,
    };
    bitonic_sort_newb(&args);

    return;
}