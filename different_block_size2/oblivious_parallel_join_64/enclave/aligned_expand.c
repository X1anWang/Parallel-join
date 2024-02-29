#include "enclave/aligned_expand.h"
#include <limits.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdarg.h>
#include <threads.h>
#include <liboblivious/algorithms.h>
#include <liboblivious/primitives.h>
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "common/ocalls.h"
#include "enclave/mpi_tls.h"
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"
#include "enclave/oblivious_compact.h"
#include "enclave/aggregation_tree.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

static ojoin_int_type length_arr;
static ojoin_int_type *index_duplicate_start;
static ojoin_int_type *index_duplicate_end;

static ojoin_int_type *ma;
static ojoin_int_type *m1_a;
static ojoin_int_type *index_duplicate_start_threada;
static bool *control_bits_0a;
static elem_t *result_t1_threada;

static ojoin_int_type *m2a;
static ojoin_int_type *m1_2a;
static elem_t *result_t1_thread2a;

static ojoin_int_type *length_remain_stepa;
static ojoin_int_type *length_remain_step2a;

void aligned_expand_init(ojoin_int_type length, ojoin_int_type nthreads) {
    length_arr = length;
    index_duplicate_start = calloc(length_arr, sizeof(*index_duplicate_start));
    index_duplicate_end = calloc(length_arr, sizeof(*index_duplicate_end));

    ma = calloc(length_arr * nthreads, sizeof(*ma));
    m1_a = calloc(length_arr * nthreads, sizeof(*m1_a));
    index_duplicate_start_threada = calloc(length_arr * nthreads, sizeof(*index_duplicate_start_threada));
    control_bits_0a = calloc(length_arr * nthreads, sizeof(*control_bits_0a));
    result_t1_threada = calloc(length_arr * nthreads, sizeof(*result_t1_threada));

    m2a = calloc(length_arr * nthreads, sizeof(*m2a));
    m1_2a = calloc(length_arr * nthreads, sizeof(*m1_2a));
    result_t1_thread2a = calloc(length_arr * nthreads, sizeof(*result_t1_thread2a));

    length_remain_stepa = calloc(length_arr * nthreads, sizeof(*length_remain_stepa));
    length_remain_step2a = calloc(length_arr * nthreads, sizeof(*length_remain_step2a));
}

void aligned_expand_free() {
    free(index_duplicate_start);
    free(index_duplicate_end);

    free(ma);
    free(m1_a);
    free(index_duplicate_start_threada);
    free(control_bits_0a);
    free(result_t1_threada);
    free(m2a);
    free(m1_2a);
    free(result_t1_thread2a);
    free(length_remain_stepa);
    free(length_remain_step2a);
}

struct aligned_expand_main_args {
    elem_t *arr;
    ojoin_int_type *m0;
    ojoin_int_type *m1;
    ojoin_int_type *index_duplicate_start;
    ojoin_int_type *index_duplicate_end;
    ojoin_int_type idx_start_thread;
    ojoin_int_type idx_end_thread;
    ojoin_int_type thread_order;

    ojoin_int_type *m;
    ojoin_int_type *m1_;
    ojoin_int_type *index_duplicate_start_thread;
    bool *control_bits_0;
    elem_t *result_t1_thread;
    
    ojoin_int_type *m2;
    ojoin_int_type *m1_2;
    elem_t *result_t1_thread2;

    ojoin_int_type *length_remain_step;
    ojoin_int_type *length_remain_step2;
};

void aligned_expand_main(void *voidargs) {
    struct aligned_expand_main_args *args = (struct aligned_expand_main_args*)voidargs;
    elem_t *arr = args->arr;
    ojoin_int_type *m0 = args->m0;
    ojoin_int_type *m1 = args->m1;
    ojoin_int_type *index_duplicate_start = args->index_duplicate_start;
    ojoin_int_type *index_duplicate_end = args->index_duplicate_end;
    ojoin_int_type idx_start_thread = args->idx_start_thread;
    ojoin_int_type idx_end_thread = args->idx_end_thread;
    //ojoin_int_type thread_order = args->thread_order;
    ojoin_int_type length_thread = idx_end_thread - idx_start_thread;

    ojoin_int_type *m = args->m;
    ojoin_int_type *m1_ = args->m1_;
    ojoin_int_type *index_duplicate_start_thread = args->index_duplicate_start_thread;
    bool *control_bits_0 = args->control_bits_0;
    elem_t *result_t1_thread = args->result_t1_thread;

    ojoin_int_type *m2 = args->m2;
    ojoin_int_type *m1_2 = args->m1_2;
    //ojoin_int_type *index_duplicate_start_thread2 = args->index_duplicate_start_thread2;
    elem_t *result_t1_thread2 = args->result_t1_thread2;
    ojoin_int_type *length_remain_step = args->length_remain_step;
    ojoin_int_type *length_remain_step2 = args->length_remain_step2;

    //elem_t *result_t1_thread;
    //ojoin_int_type length_max = MAX(length_arr, length_thread);
    //result_t1_thread = calloc(length_max, sizeof(result_t1_thread));

    //printf("\nEnter %ld th thread", thread_order);
    bool condition_0;
    bool condition_1;
    bool condition_2;
    bool condition_3;
    bool condition_4;
    /*
    bool *control_bits_0;
    ojoin_int_type *m;
    ojoin_int_type *m1_;
    ojoin_int_type *index_duplicate_start_thread;
    */
    /*
    m = calloc(length_max, sizeof(*m));
    m1_ = calloc(length_max, sizeof(*m1_));
    index_duplicate_start_thread = calloc(length_max, sizeof(*index_duplicate_start_thread));
    control_bits_0 = calloc(length_max, sizeof(*control_bits_0));
    */
    for(ojoin_int_type i = 0; i < length_arr; i++) {
        //printf("\na");
        condition_0 = (0 < m0[i]);
        condition_1 = (idx_start_thread <= index_duplicate_start[i]) && (index_duplicate_start[i] < idx_end_thread);
        condition_2 = (idx_start_thread <= index_duplicate_end[i]) && (index_duplicate_end[i] < idx_end_thread);
        condition_3 = (index_duplicate_start[i] < idx_start_thread) && (idx_end_thread <= index_duplicate_end[i]);
        control_bits_0[i] = condition_0 && (condition_1 + condition_2 + condition_3);
        //printf("\nb");
        m[i] = condition_0 * ((condition_1 && condition_2) * (m0[i])
            + (!condition_1 && condition_2) * CEIL_DIV((index_duplicate_end[i] + 1 - idx_start_thread), m1[i])
            + (condition_1 && !condition_2) * CEIL_DIV((idx_end_thread - index_duplicate_start[i]), m1[i])
            + (condition_3) * (CEIL_DIV(idx_end_thread - idx_start_thread, m1[i]))
            - 1);
        //printf("\nc");
        m1_[i] = m1[i];
        //printf("\nd");
        index_duplicate_start_thread[i] = index_duplicate_start[i] + condition_0 * ((!condition_1) && condition_2 + condition_3) * CEIL_DIV((idx_start_thread - index_duplicate_start[i]), m1[i]) * m1[i] - idx_start_thread;
        //printf("\ne");
        o_memcpy(result_t1_thread + i, arr + i, sizeof(*arr), control_bits_0[i]);
        //printf("\nf");
        result_t1_thread[i].has_value = control_bits_0[i];
        //printf("\ng");
        /*
        if (thread_order == 1) {
            printf("\n%ld th key:%ld condition_0:%d condition_1:%d condition_2:%d condition_3:%d controlbits_0:%d m:%ld m1:%ld idx_start:%ld idx_end:%ld idx_start_thread:%ld", i, arr[i].key, condition_0, condition_1, condition_2, condition_3, control_bits_0[i], m[i], m1_[i], index_duplicate_start[i], index_duplicate_end[i], index_duplicate_start_thread[i]);
        }
        */
        length_remain_step[i] = 0;
        length_remain_step2[i] = 0;
        m2[i] = 0;
        m1_2[i] = 0;
        //result_t1_thread2[i].key = 1111;
        result_t1_thread2[i].has_value = false;
    }
    //printf("\n%ld th thread exit first loop", thread_order);
    for(ojoin_int_type i = length_arr; i < length_thread; i++) {
        control_bits_0[i] = false;
        result_t1_thread[i].has_value = false;
        length_remain_step[i] = 0;
        length_remain_step2[i] = 0;
        m2[i] = 0;
        m1_2[i] = 0;
        //result_t1_thread2[i].key = 1111;
        result_t1_thread2[i].has_value = false;
    }
    //printf("\n%ld th thread exit second loop", thread_order);

    oblivious_compact_elem(result_t1_thread, control_bits_0, length_thread, 1, 1);
    oblivious_compact(index_duplicate_start_thread, control_bits_0, length_thread, 1, 1);
    oblivious_compact(m, control_bits_0, length_thread, 1, 1);
    oblivious_compact(m1_, control_bits_0, length_thread, 1, 1);
    
    //printf("\n%ld th thread exit ocompaction", thread_order);
    /*
    if (thread_order == 1) {
        printf("\n%ld th thread starting from index %ld to %ld", thread_order, idx_start_thread, idx_end_thread);
        for (ojoin_int_type i = 0; i < length_thread; i++) {
            printf("\n(1) %ld th ", i);
            if (result_t1_thread[i].has_value) {
                printf("key: %ld m:%ld m1:%ld start idx:%ld", result_t1_thread[i].key, m[i], m1_[i], index_duplicate_start_thread[i]);
            }
        }
    }
    */
    
    ojoin_int_type length_step = pow2_lt(length_thread);
    while (0 < length_step) {
        for (long long i = length_thread - 1; 0 <= i; i--) {
            if (i + length_step <= index_duplicate_start_thread[i]) {
                o_memswap(index_duplicate_start_thread + i, index_duplicate_start_thread + i + length_step, sizeof(*index_duplicate_start_thread), result_t1_thread[i].has_value);
                o_memswap(m + i, m + i + length_step, sizeof(*m), result_t1_thread[i].has_value);
                o_memswap(m1_ + i, m1_ + i + length_step, sizeof(*m1_), result_t1_thread[i].has_value);
                o_memswap(result_t1_thread + i, result_t1_thread + i + length_step, sizeof(*result_t1_thread), result_t1_thread[i].has_value);
            }
        }
        length_step /= 2;
    }
    //printf("\n%ld th thread exit distribute", thread_order);
    /*
    if (thread_order == 1) {
        printf("\n%ld th thread starting from index %ld to %ld", thread_order, idx_start_thread, idx_end_thread);
        for (ojoin_int_type i = 0; i < length_thread; i++) {
            printf("\n(1.5) %ld th ", i);
            if (result_t1_thread[i].has_value) {
                printf("key: %ld m:%ld m1:%ld start idx:%ld", result_t1_thread[i].key, m[i], m1_[i], index_duplicate_start_thread[i]);
            }
        }
    }
    */

    length_step = pow2_lt(length_thread);
    while (0 < length_step) {
        for (long long i = length_thread - 1; 0 <= i; i--) {
            if(length_thread <= i + length_step) {
                continue;
            }

            // First, process result_t1_thread
            condition_0 = result_t1_thread[i].has_value;
            //printf("\n%ld th correct %lld th a", thread_order, i);
            condition_1 = length_step <= length_remain_step[i];
            //printf("\n%ld th correct %lld th b", thread_order, i);
            condition_2 = !result_t1_thread[i + length_step].has_value;
            //printf("\n%ld th correct %lld th c", thread_order, i);
            condition_3 = !result_t1_thread2[i + length_step].has_value;
            //printf("\n%ld th correct %lld th d", thread_order, i);
            condition_4 = length_step <= (m[i] * m1_[i] + length_remain_step[i]);
            //printf("\n%ld th correct %lld th e", thread_order, i);
            o_memswap(result_t1_thread + i + length_step, result_t1_thread + i, sizeof(*result_t1_thread), condition_0 & condition_1 & condition_2);
            //printf("\n%ld th correct %lld th f", thread_order, i);
            o_memswap(result_t1_thread2 + i + length_step, result_t1_thread + i, sizeof(*result_t1_thread), condition_0 & condition_1 & !condition_2 & condition_3);
            //printf("\n%ld th correct %lld th g", thread_order, i);
            o_memcpy(result_t1_thread + i + length_step, result_t1_thread + i, sizeof(*result_t1_thread), condition_0 & !condition_1 & condition_4 & condition_2);
            //printf("\n%ld th correct %lld th h", thread_order, i);
            o_memcpy(result_t1_thread2 + i + length_step, result_t1_thread + i, sizeof(*result_t1_thread), condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3);
            /*
            //printf("\n%ld th correct %lld th i", thread_order, i);
            length_remain_step[i + length_step] = (condition_0 & condition_1 & condition_2) * (length_remain_step[i] - length_step) + (condition_0 & !condition_1 & condition_4 & condition_2) * ((m[i] * m1_[i] - length_step) % MAX(1, m1_[i])) + !(condition_0 & (condition_1 | condition_4) & condition_2) * length_remain_step[i + length_step];
            //printf("\n%ld th correct %lld th j", thread_order, i);
            length_remain_step2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * (length_remain_step[i] - length_step) + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * ((m[i] * m1_[i] - length_step) % MAX(1, m1_[i])) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * length_remain_step2[i + length_step];
            //printf("\n%ld th correct %lld th k", thread_order, i);
            length_remain_step[i] = !(condition_0 & condition_1) * length_remain_step[i];
            //printf("\n%ld th correct %lld th l", thread_order, i);
            //printf("\n L %ld, %ld, %ld, %ld",m2[i], length_step, m1_2[i], m2[i + length_step]);
            m[i + length_step] = (condition_0 & condition_1 & condition_2) * m[i] + (condition_0 & !condition_1 & condition_4 & condition_2) * (m[i] - ((length_step - 1) / MAX(1, m1_[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & condition_2) * m[i + length_step];// - (condition_0 & (condition_1 | condition_4) & condition_2) * (length_remain_step[i + length_step] == 0);
            //printf("\n%ld th correct %lld th m", thread_order, i);
            m2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * m[i] + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (m[i] - ((length_step - 1) / MAX(1, m1_[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m2[i + length_step];// - (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * (length_remain_step2[i + length_step] == 0);
            //printf("\n%ld th correct %lld th n", thread_order, i);
            m[i] = !(condition_0 & condition_1) * (!(condition_0 & !condition_1 & condition_4) * m[i] + (condition_0 & !condition_1 & condition_4) * ((length_step - 1) / MAX(1, m1_[i])));
            //printf("\n%ld th correct %lld th o", thread_order, i);
            m1_[i + length_step] = (condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i] + !(condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i + length_step];
            //printf("\n%ld th correct %lld th p", thread_order, i);
            m1_2[i + length_step] = (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_[i] + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i + length_step];
            //printf("\n%ld th correct %lld th q", thread_order, i);
            m1_[i] = !(condition_0 & condition_1) * m1_[i];
            //printf("\n%ld th correct %lld th r", thread_order, i);
            */
            m[i + length_step] = (condition_0 & condition_1 & condition_2) * m[i] + (condition_0 & !condition_1 & condition_4 & condition_2) * (m[i] - ((length_step - length_remain_step[i] - 1) / MAX(1, m1_[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & condition_2) * m[i + length_step];// - (condition_0 & (condition_1 | condition_4) & condition_2) * (length_remain_step[i + length_step] == 0);
            m2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * m[i] + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (m[i] - ((length_step - length_remain_step[i] - 1) / MAX(1, m1_[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m2[i + length_step];// - (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * (length_remain_step2[i + length_step] == 0);
            m[i] = !(condition_0 & condition_1) * (!(condition_0 & !condition_1 & condition_4) * m[i] + (condition_0 & !condition_1 & condition_4) * ((length_step - length_remain_step[i] - 1) / MAX(1, m1_[i])));
            length_remain_step[i + length_step] = (condition_0 & condition_1 & condition_2) * (length_remain_step[i] - length_step) + (condition_0 & !condition_1 & condition_4 & condition_2) * (length_remain_step[i] + (m[i] + 1) * m1_[i] - length_step) + !(condition_0 & (condition_1 | condition_4) & condition_2) * length_remain_step[i + length_step];
            length_remain_step2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * (length_remain_step[i] - length_step) + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (length_remain_step[i] + (m[i] + 1) * m1_[i] - length_step) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * length_remain_step2[i + length_step];
            length_remain_step[i] = !(condition_0 & condition_1) * length_remain_step[i];
            m1_[i + length_step] = (condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i] + !(condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i + length_step];
            m1_2[i + length_step] = (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_[i] + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i + length_step];
            m1_[i] = !(condition_0 & condition_1) * m1_[i];









            // Second, process result_t1_thread2
            condition_0 = result_t1_thread2[i].has_value;
            //printf("\n%ld th correct %lld th A, II", thread_order, i);
            condition_1 = length_step <= length_remain_step2[i];
            //printf("\n%ld th correct %lld th B, II", thread_order, i);
            condition_2 = !result_t1_thread[i + length_step].has_value;
            //printf("\n%ld th correct %lld th C, II", thread_order, i);
            condition_3 = !result_t1_thread2[i + length_step].has_value;
            //printf("\n%ld th correct %lld th D, II", thread_order, i);
            condition_4 = (length_step <= m2[i] * m1_2[i] + length_remain_step2[i]);
            //printf("\n%ld th correct %lld th E, II", thread_order, i);
            o_memswap(result_t1_thread + i + length_step, result_t1_thread2 + i, sizeof(*result_t1_thread2), condition_0 & condition_1 & condition_2);
            //printf("\n%ld th correct %lld th F, II", thread_order, i);
            o_memswap(result_t1_thread2 + i + length_step, result_t1_thread2 + i, sizeof(*result_t1_thread2), condition_0 & condition_1 & !condition_2 & condition_3);
            //printf("\n%ld th correct %lld th G, II", thread_order, i);
            o_memcpy(result_t1_thread + i + length_step, result_t1_thread2 + i, sizeof(*result_t1_thread2), condition_0 & !condition_1 & condition_4 & condition_2);
            //printf("\n%ld th correct %lld th H, II", thread_order, i);
            o_memcpy(result_t1_thread2 + i + length_step, result_t1_thread2 + i, sizeof(*result_t1_thread2), condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3);
            /*
            //printf("\n%ld th correct %lld th I, II", thread_order, i);
            length_remain_step2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * (length_remain_step2[i] - length_step) + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * ((m2[i] * m1_2[i] - length_step) % MAX(1, m1_2[i])) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * length_remain_step2[i + length_step];
            //printf("\n%ld th correct %lld th J, II", thread_order, i);
            length_remain_step[i + length_step] = (condition_0 & condition_1 & condition_2) * (length_remain_step2[i] - length_step) + (condition_0 & !condition_1 & condition_4 & condition_2) * ((m2[i] * m1_2[i] - length_step) % MAX(1, m1_2[i])) + !(condition_0 & (condition_1 | condition_4) & condition_2) * length_remain_step[i + length_step];
            //printf("\n%ld th correct %lld th K, II", thread_order, i);
            length_remain_step2[i] = !(condition_0 & condition_1) * length_remain_step2[i];
            //printf("\n%ld th correct %lld th L, II", thread_order, i);
            //printf("\n L %ld, %ld, %ld, %ld",m2[i], length_step, m1_2[i], m2[i + length_step]);
            m2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * m2[i] + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (m2[i] - ((length_step - 1) / MAX(1, m1_2[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m2[i + length_step];// - (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * (length_remain_step2[i + length_step] == 0);
            //printf("\n%ld th correct %lld th M, II", thread_order, i);
            m[i + length_step] = (condition_0 & condition_1 & condition_2) * m2[i] + (condition_0 & !condition_1 & condition_4 & condition_2) * (m2[i] - ((length_step - 1) / MAX(1, m1_2[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & condition_2) * m[i + length_step];// - (condition_0 & (condition_1 | condition_4) & condition_2) * (length_remain_step[i + length_step] == 0);
            //printf("\n%ld th correct %lld th N, II", thread_order, i);
            m2[i] = !(condition_0 & condition_1) * (!(condition_0 & !condition_1 & condition_4) * m2[i] + (condition_0 & !condition_1 & condition_4) * ((length_step - 1) / MAX(1, m1_2[i])));
            //printf("\n%ld th correct %lld th O, II", thread_order, i);
            m1_2[i + length_step] = (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i] + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i + length_step];
            //printf("\n%ld th correct %lld th P, II", thread_order, i);
            m1_[i + length_step] = (condition_0 & (condition_1 | condition_4) & condition_2) * m1_2[i] + !(condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i + length_step];
            //printf("\n%ld th correct %lld th Q, II", thread_order, i);
            m1_2[i] = !(condition_0 & condition_1) * m1_2[i];
            //printf("\n%ld th correct %lld th R, II", thread_order, i);
            */
            m[i + length_step] = (condition_0 & condition_1 & condition_2) * m2[i] + (condition_0 & !condition_1 & condition_4 & condition_2) * (m2[i] - ((length_step - length_remain_step2[i] - 1) / MAX(1, m1_2[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & condition_2) * m[i + length_step];// - (condition_0 & (condition_1 | condition_4) & condition_2) * (length_remain_step[i + length_step] == 0);
            m2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * m2[i] + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (m2[i] - ((length_step - length_remain_step2[i] - 1) / MAX(1, m1_2[i])) - 1) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m2[i + length_step];// - (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * (length_remain_step2[i + length_step] == 0);
            m2[i] = !(condition_0 & condition_1) * (!(condition_0 & !condition_1 & condition_4) * m2[i] + (condition_0 & !condition_1 & condition_4) * ((length_step - length_remain_step2[i] - 1) / MAX(1, m1_2[i])));
            length_remain_step[i + length_step] = (condition_0 & condition_1 & condition_2) * (length_remain_step2[i] - length_step) + (condition_0 & !condition_1 & condition_4 & condition_2) * (length_remain_step2[i] + (m2[i] + 1) * m1_2[i] - length_step) + !(condition_0 & (condition_1 | condition_4) & condition_2) * length_remain_step[i + length_step];
            length_remain_step2[i + length_step] = (condition_0 & condition_1 & !condition_2 & condition_3) * (length_remain_step2[i] - length_step) + (condition_0 & !condition_1 & condition_4 & !condition_2 & condition_3) * (length_remain_step2[i] + (m2[i] + 1) * m1_2[i] - length_step) + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * length_remain_step2[i + length_step];
            length_remain_step2[i] = !(condition_0 & condition_1) * length_remain_step2[i];
            m1_[i + length_step] = (condition_0 & (condition_1 | condition_4) & condition_2) * m1_2[i] + !(condition_0 & (condition_1 | condition_4) & condition_2) * m1_[i + length_step];
            m1_2[i + length_step] = (condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i] + !(condition_0 & (condition_1 | condition_4) & !condition_2 & condition_3) * m1_2[i + length_step];
            m1_2[i] = !(condition_0 & condition_1) * m1_2[i];
        }
        length_step /= 2;
    }

    /*
    if (thread_order == 1) {
        printf("\n%ld th thread starting from index %ld to %ld", thread_order, idx_start_thread, idx_end_thread);
        for (ojoin_int_type i = 0; i < length_thread; i++) {
            printf("\n(2) %ld th ", i);
            if (result_t1_thread[i].has_value) {
                printf("III1 key: %ld m:%ld m1:%ld left step:%ld", result_t1_thread[i].key, m[i], m1_[i], length_remain_step[i]);
            };
            if (result_t1_thread2[i].has_value) {
                printf(" III2 key: %ld m:%ld m1:%ld left step:%ld", result_t1_thread2[i].key, m2[i], m1_2[i], length_remain_step2[i]);
            };
        }
    }
    */
    

    //free(m);
    //free(m1_);
    //free(result_t1_thread);
    //free(index_duplicate_start_thread);
    //printf("\nThread %ld completed...", thread_order);
}

void aligned_expand(elem_t *arr, ojoin_int_type *m0, ojoin_int_type *m1, ojoin_int_type length_result, ojoin_int_type number_threads) {
    
    index_duplicate_start[0] = 0;
    index_duplicate_end[0] = (0 < m0[0]) * (m0[0] - 1) * m1[0];
    ojoin_int_type accumulate_m0 = 0;
    bool condition;

    for (ojoin_int_type i = 1; i < length_arr; i++) {
        condition = (arr[i - 1].key == arr[i].key);
        accumulate_m0 += m0[i-1];
        index_duplicate_start[i] = condition * (index_duplicate_start[i-1] + 1) + !condition * accumulate_m0;
        index_duplicate_end[i] = index_duplicate_start[i] + (0 < m0[i]) * (m0[i] - 1) * m1[i];
    }
    
    ojoin_int_type length_result_thread = length_result / number_threads;
    ojoin_int_type length_result_thread_extra = length_result % number_threads;
    //ojoin_int_type length_max_thread_temp = MAX(length_arr, (length_result_thread + 1));

    ojoin_int_type idx_start_thread = 0;
    ojoin_int_type idx_end_thread = 0;
    struct thread_work multi_aligned_expand_main[number_threads - 1];
    struct aligned_expand_main_args aligned_expand_main_args[number_threads];    
    //ojoin_int_type length_alloc = number_threads * length_max_thread_temp;

    //get_time(false);
    for (ojoin_int_type i = 0; i < number_threads; i++) {
        idx_end_thread = idx_start_thread + length_result_thread + (i < length_result_thread_extra);

        aligned_expand_main_args[i].arr = arr;
        aligned_expand_main_args[i].m0 = m0;
        aligned_expand_main_args[i].m1 = m1;
        aligned_expand_main_args[i].index_duplicate_start = index_duplicate_start;
        aligned_expand_main_args[i].index_duplicate_end = index_duplicate_end;
        aligned_expand_main_args[i].idx_start_thread = idx_start_thread;
        aligned_expand_main_args[i].idx_end_thread = idx_end_thread;
        aligned_expand_main_args[i].thread_order = i;
        aligned_expand_main_args[i].m = ma + idx_start_thread;
        aligned_expand_main_args[i].m1_ = m1_a + idx_start_thread;
        aligned_expand_main_args[i].index_duplicate_start_thread = index_duplicate_start_threada + idx_start_thread;
        aligned_expand_main_args[i].control_bits_0 = control_bits_0a + idx_start_thread;
        aligned_expand_main_args[i].result_t1_thread = result_t1_threada + idx_start_thread;
        aligned_expand_main_args[i].m2 = m2a + idx_start_thread;
        aligned_expand_main_args[i].m1_2 = m1_2a + idx_start_thread;
        aligned_expand_main_args[i].result_t1_thread2 = result_t1_thread2a + idx_start_thread;
        aligned_expand_main_args[i].length_remain_step = length_remain_stepa + idx_start_thread;
        aligned_expand_main_args[i].length_remain_step2 = length_remain_step2a + idx_start_thread;
        
        if(i < number_threads - 1) {
            multi_aligned_expand_main[i].type = THREAD_WORK_SINGLE;
            multi_aligned_expand_main[i].single.func = aligned_expand_main;
            multi_aligned_expand_main[i].single.arg = &aligned_expand_main_args[i];
            thread_work_push(&multi_aligned_expand_main[i]);
        }
        idx_start_thread = idx_end_thread;
    }
    aligned_expand_main(&aligned_expand_main_args[number_threads - 1]);
    for (ojoin_int_type i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_aligned_expand_main[i]);
    }

    return ;
    
}
