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

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

static uint64_t length_total;

/*
aligned_expand_init() {

}
*/

struct parallel_execute_0_args {
    elem_t *arr;
    uint64_t *index_duplicate_start;
    bool *control_bits_0;
    //uint64_t index_start;
    uint64_t length;
    uint64_t idx_start;
    uint64_t number_threads;
    uint64_t *m0;
};

struct parallel_execute_1_args {
    elem_t *arr;
    uint64_t *index_duplicate_start;
    uint64_t *index_duplicate_end;
    uint64_t *m0;
    uint64_t *m1;
    //uint64_t index_start;
    uint64_t length;
    uint64_t number_threads;
};

struct aligned_expand_core_args {
    elem_t *arr;
    uint64_t *index_duplicate_start;
    uint64_t *index_duplicate_end;
    uint64_t *m0;
    uint64_t *m1;
    uint64_t length_total;
    uint64_t length_thread;
    uint64_t order_thread;
    //uint64_t number_threads;
};

struct aligned_expand_args {
    elem_t *arr;
    uint64_t *index_duplicate_start;
    bool *control_bits_0;
    uint64_t length;
    uint64_t number_threads;
    //
    uint64_t *m0;
    uint64_t *m1;
};


void parallel_execute_0(void *args_) {
    printf("[INFO] enter parallel_execute_0...\n");
    struct parallel_execute_0_args *args = (struct parallel_execute_0_args*)args_;
    elem_t *arr = args->arr;
    uint64_t *index_duplicate_start = args->index_duplicate_start;
    bool *control_bits_0 = args->control_bits_0;
    //uint64_t index_start = args->index_start;
    uint64_t length = args->length;
    uint64_t number_threads = args->number_threads;
    uint64_t idx_start = args->idx_start;
    uint64_t *m0 = args->m0;

    if (length <= 0) {
        ;
    }
    else if ((0 < length && length < 16) || number_threads <= 1) {
        bool condition_0;
        //control_bits_0[0] = 0;
        //index_duplicate_start[0] = 0;
        for (uint64_t i = idx_start; i <idx_start + length; i++) {
            /*
            if (i == 0) {
                control_bits_0[i] = 0;
                index_duplicate_start[i] = 0;
            }
            else {
            */
            condition_0 = (arr[i - 1].key == arr[i].key);
            index_duplicate_start[i] = condition_0 && (0 < m0[i]) && (!arr[i].table_0) + (1 - condition_0) * index_duplicate_start[i];
            control_bits_0[i] = condition_0;
            
        }
    }
    else if (16 <= length) {
        //uint64_t index_start_left = index_start;
        uint64_t length_left = length / 2;
        uint64_t number_threads_left = number_threads / 2;

        //uint64_t index_start_right = index_start_left + length_left;
        uint64_t length_right = length - length_left;
        uint64_t number_threads_right = number_threads - number_threads_left;

        struct parallel_execute_0_args left_args = {
            .arr = arr,
            .index_duplicate_start = index_duplicate_start,
            .control_bits_0 = control_bits_0,
            .idx_start = idx_start,
            .length = length_left,
            .number_threads = number_threads_left,
        };

        struct parallel_execute_0_args right_args = {
            .arr = arr,
            .index_duplicate_start = index_duplicate_start,
            .control_bits_0 = control_bits_0,
            .idx_start = idx_start + length_left,
            //.index_start = index_start_right,
            .length = length_right,
            .number_threads = number_threads_right,
        };

        struct thread_work right_work = {
            .type = THREAD_WORK_SINGLE,
            .single = {
                .func = parallel_execute_0,
                .arg = &right_args,
            },
        };
        //printf("[INFO] start parallel_execute_0 right work in another thread...\n");
        thread_work_push(&right_work);
        //printf("[INFO] start parallel_execute_0 left work in current thread...\n");
        parallel_execute_0(&left_args);
        //printf("[INFO] complete current left parallel_execute_0 and wait for right work...\n");
        thread_wait(&right_work);
    }
    printf("[INFO] complete parallel_execute_0...\n");
}

void parallel_execute_1(void *args_) {
    printf("[INFO] enter parallel_execute_1...\n");
    struct parallel_execute_1_args *args = args_;
    
    elem_t *arr = args->arr;
    uint64_t *index_duplicate_start = args->index_duplicate_start;
    uint64_t *index_duplicate_end = args->index_duplicate_end;
    uint64_t *m0 = args->m0;
    uint64_t *m1 = args->m1;
    //uint64_t index_start = args->index_start;
    uint64_t length = args->length;
    uint64_t number_threads = args-> number_threads;

    if (length <= 0) {
        return;
    }
    else if ((0 < length && length < 16) || number_threads == 1) {
        //bool condition_0;
        for (uint64_t i = 0; i < length; i++) {
            index_duplicate_end[i] = index_duplicate_start[i] + (m0[i] - 1) * m1[i];
            //printf("%ld th start:%ld\t", i, index_duplicate_start[i]);
            //printf("end:%ld\t", index_duplicate_end[i]);
            //printf("m0:%ld\t", m0[i]);
            //printf("m1:%ld\n", m1[i]);
        }
    }
    else if (16 <= length) {
        //uint64_t index_start_left = index_start;
        uint64_t length_left = length / 2;
        uint64_t number_threads_left = number_threads / 2;

        //uint64_t index_start_right = index_start_left + length_left;
        uint64_t length_right = length - length_left;
        uint64_t number_threads_right = number_threads - number_threads_left;

        struct parallel_execute_1_args left_args = {
            .arr = arr,
            .index_duplicate_start = index_duplicate_start,
            .index_duplicate_end = index_duplicate_end,
            //.index_start = index_start_left,
            .length = length_left,
            .number_threads = number_threads_left,
            .m0 = m0,
            .m1 = m1,
        };

        struct parallel_execute_1_args right_args = {
            .arr = &arr[length_left],
            .index_duplicate_start = &index_duplicate_start[length_left],
            .index_duplicate_end = &index_duplicate_end[length_left],
            //.index_start = index_start_right,
            .length = length_right,
            .number_threads = number_threads_right,
            .m0 = &m0[length_left],
            .m1 = &m1[length_left],
        };

        struct thread_work right_work = {
            .type = THREAD_WORK_SINGLE,
            .single = {
                .func = parallel_execute_1,
                .arg = &right_args,
            },
        };
        printf("[INFO] start parallel_execute_1 right work in another thread...\n");
        thread_work_push(&right_work);
        printf("[INFO] start parallel_execute_1 left work in current thread...\n");
        parallel_execute_1(&left_args);
        printf("[INFO] complete current left parallel_execute_1 and wait for right work...\n");
        thread_wait(&right_work);
    }
    printf("[INFO] complete parallel_execute_1...\n");
}

//
void aligned_expand_core(void *args_) {
    printf("[INFO] start aligned_expand_core...\n");
    struct aligned_expand_core_args *args = (struct aligned_expand_core_args*)args_;
    elem_t *arr = args->arr;
    uint64_t *index_duplicate_start = args->index_duplicate_start;
    uint64_t *index_duplicate_end = args->index_duplicate_end;
    uint64_t *m0 = args->m0;
    uint64_t *m1 = args->m1;
    uint64_t *multiplicity_1;
    uint64_t length_total = args->length_total;
    uint64_t length_thread = args->length_thread;
    uint64_t order_thread = args->order_thread;

    printf("[INFO] aligned_expand_core - 1...\n");
    bool condition_0;
    bool condition_1;
    bool condition_2;
    bool condition_3;
    bool condition_4;
    bool condition_5;
    bool condition_6;
    bool condition_7;
    bool condition_8;
    bool condition_9;
    bool condition_10;
    bool condition_11;
    elem_t *arr_new_assist;
    bool *control_bits_1;
    bool *control_bits_1_assist;
    uint64_t elem_sum = 0;
    uint64_t *multiplicity_new;
    uint64_t *multiplicity_new_assist;
    uint64_t *multiplicity_1_assist;
    uint64_t *length_remain_step;
    uint64_t *length_remain_step_assist;
    uint64_t multiplicity_new_temp;
    printf("[INFO] aligned_expand_core - 2...\n");
    elem_t *arr_new;

    uint64_t length_total2 = MAX(length_total, length_thread);
    multiplicity_new = calloc(length_total2, sizeof(*multiplicity_new));
    multiplicity_new_assist = calloc(length_thread, sizeof(*multiplicity_new_assist));
    multiplicity_1 = calloc(length_total2, sizeof(*multiplicity_new));
    multiplicity_1_assist = calloc(length_thread, sizeof(*multiplicity_1_assist));
    control_bits_1 = calloc(length_total2, sizeof(*control_bits_1));
    control_bits_1_assist = calloc(length_thread, sizeof(*control_bits_1_assist));
    length_remain_step = calloc(length_thread, sizeof(*length_remain_step)); // initialize with -1 or 0
    length_remain_step_assist = calloc(length_thread, sizeof(*length_remain_step_assist));
    arr_new_assist = calloc(length_thread, sizeof(*arr_new_assist));
    arr_new = calloc(length_total2, sizeof(*arr_new));
    printf("[INFO] aligned_expand_core - 2.5...\n");
    for (uint64_t i = 0; i < length_total; i++) {
        o_memcpy(&arr_new[i], &arr[i], sizeof(*arr_new), true);
        o_memcpy(&multiplicity_1[i], &m1[i], sizeof(*multiplicity_1), true);
        length_remain_step[i] = -1;
        length_remain_step_assist[i] = -1;
    }
    
    printf("[INFO] aligned_expand_core - 3...\n");
    uint64_t index_start_thread = order_thread * length_thread;
    uint64_t index_end_thread = (order_thread + 1) * length_thread;
    printf("index_start_thread:%ld index_end_thread:%ld\n", index_start_thread, index_end_thread);

    for (uint64_t i = 0; i < length_total; i++) {
        printf("\n[INFO] aligned_expand_core - %ld th ...", i);
        printf("original index start:%ld\t index end:%ld key:%ld m0:%ld m1:%ld\n", index_duplicate_start[i], index_duplicate_end[i], arr_new[i].key, m0[i], multiplicity_1[i]);
        //printf("\n\n[INFO] aligned_expand_core - 3.1 ...\n");
        condition_0 = (index_duplicate_start[i] <= index_duplicate_end[i]);
        printf("%ld th condition_0:%d ", i, condition_0);
        condition_1 = (index_start_thread <= index_duplicate_start[i]) && (index_duplicate_start[i] < index_end_thread);
        printf("condition_1:%d ", condition_1);
        //printf("\n\n[INFO] aligned_expand_core - 3.2 ...\n");
        condition_2 = (index_start_thread <= index_duplicate_end[i]) && (index_duplicate_end[i] < index_end_thread);
        printf("condition_2:%d ", condition_2);
        //printf("\n\n[INFO] aligned_expand_core - 3.3 ...\n");
        condition_3 = (index_duplicate_start[i] < index_start_thread) && (index_end_thread <= index_duplicate_end[i]);
        printf("condition_3:%d ", condition_3);
        //printf("\n\n[INFO] aligned_expand_core - 3.4 ...\n");
        multiplicity_new[i] = (condition_0 && condition_1 && condition_2) * (m0[i])
            + (condition_0 && !condition_1 && condition_2) * CEIL_DIV((index_duplicate_end[i] + 1 - index_start_thread), multiplicity_1[i])
            + (condition_0 && condition_1 && !condition_2) * CEIL_DIV((index_end_thread - index_duplicate_start[i]), multiplicity_1[i])
            + (condition_0 && condition_3) * (CEIL_DIV(index_end_thread - index_duplicate_start[i], multiplicity_1[i])
            - CEIL_DIV(index_start_thread + 1 - index_duplicate_start[i], multiplicity_1[i]))
            - 1;
        //printf("\n\n[INFO] aligned_expand_core - 3.5 ...\n");
        printf("multiplicity new:%ld ", multiplicity_new[i]);
        control_bits_1[i] = condition_0 && (condition_1 + condition_2 + condition_3);
        elem_sum += control_bits_1[i];
        printf("control bit:%d ", control_bits_1[i]);
        //printf("\n\n[INFO] aligned_expand_core - 3.6 ...\n");
        // index_duplicate_start + round up
        index_duplicate_start[i] = index_duplicate_start[i] + condition_0 * ((!condition_1) && condition_2 + condition_3) * CEIL_DIV((index_start_thread + 1 - index_duplicate_start[i]), multiplicity_1[i]) * multiplicity_1[i];
        //printf("\n\n[INFO] aligned_expand_core - 3.7 ...\n");
        printf("index start new:%ld\n", index_duplicate_start[i]);
    }

    printf("[INFO] aligned_expand_core - 4...\n");
    // variable to compact, result variable, control bit, number of available threads, compact offset
    // only left one inplace oblivious_compaction call!



    oblivious_compact_elem(arr_new, control_bits_1, length_total, 1, 0);
    oblivious_compact(multiplicity_new, control_bits_1, length_total, 1, 0);
    oblivious_compact(multiplicity_1, control_bits_1, length_total, 1, 0);
    oblivious_compact(index_duplicate_start, control_bits_1, length_total, 1, 0);


    for (uint64_t i = 0; i < length_thread; i++) {
        printf("\n[INF!] aligned_expand_core - %ld th ...", i);
        printf("index start:%ld\t key:%ld m new:%ld m1:%ld\n", index_duplicate_start[i], arr_new[i].key, multiplicity_new[i], multiplicity_1[i]);
    }

    // do oblivious compaction again
    printf("[INFO] aligned_expand_core - 5...\n");
    for (uint64_t i = 0; i < length_thread; i++) {
        arr_new[i].has_value = (i < elem_sum);
        arr_new_assist[i].has_value = false;
        control_bits_1[i] = (index_duplicate_start[i] < index_duplicate_start[0]) && control_bits_1[i];
    }
    printf("[INFO] aligned_expand_core - 5.1...\n");
    oblivious_compact_elem(arr_new, control_bits_1, length_thread, 1, 0);
    printf("[INFO] aligned_expand_core - 5.2...\n");
    oblivious_compact(multiplicity_new, control_bits_1, length_thread, 1, 0);
    printf("[INFO] aligned_expand_core - 5.3...\n");
    oblivious_compact(multiplicity_1, control_bits_1, length_thread, 1, 0);
    printf("[INFO] aligned_expand_core - 5.4...\n");
    oblivious_compact(index_duplicate_start, control_bits_1, length_thread, 1, 0);
    
    printf("[INFO] aligned_expand_core - 5.5...\n");
    
    /* Aligned Expansion - Core */
    //length_step = power2(int(log2(length_thread)));
    uint64_t length_step = pow2_lt(length_thread);
    while (0 < length_step) {
        printf("[INFO] aligned_expand_core - step is:%ld\n", length_step);
        uint64_t i;
        for (uint64_t o = length_thread; 0 < o; o--) {
            i = o - 1;
            condition_1 = ((i + length_step) <= (index_duplicate_start[i] - index_start_thread));
            o_memswap(&arr_new[i], &arr_new[i + length_step], sizeof(*arr_new), condition_1); // you need to add sizeof()
            o_memswap(&multiplicity_new[i], &multiplicity_new[i + length_step], sizeof(*multiplicity_new), condition_1);
            o_memswap(&multiplicity_1[i], &multiplicity_1[i + length_step], sizeof(*multiplicity_1), condition_1);
            o_memswap(&control_bits_1[i], &control_bits_1[i + length_step], sizeof(*control_bits_1), condition_1);
        }
        length_step /= 2;
    }

    printf("[INFO] aligned_expand_core - 6...\n");
    printf("[INFO length_thread %ld", length_thread);
    length_step = pow2_lt(length_thread);
    while (0 < length_step) {
        uint64_t i;
        printf("[INFO] aligned_expand_core - 7 step length - %ld...\n", length_step);
        for (uint64_t o = length_thread; 0 < o; o--) {
            i = o - 1;
            printf("\n%ld th ", i);
            if (length_thread <= i + length_step) {// loop number decided by output length, no need to be oblivious
                continue;
            }
            /*
            // arr
            if (arr_new[i].has_value) {
                if (length_step <= length_remain_step[i]) { // change some o_memswap to o_memcopy /// control bit seems useless
                    if !(arr_new[i + length_step].has_value) {
                        o_memswap(arr_new[i+length_step], arr_new[i], true);
                        length_remain_step[i] = 0;
                        length_remain_step[i + length_step] = length_remain_step[i] - length_step;
                        multiplicity_1[i + length_step] = multiplicity_1[i];
                        multiplicity_1[i] = 0;
                        multiplicity_new[i + length_step] = multiplicity_new[i];
                        multiplicity_new[i] = 0;
                        if (length_remain_step[i + length_step] == 0) {
                            //control_bits_1[i + length_step] = 1;
                            multiplicity_new[i + length_step] -= 1;
                        }
                    }
                    else if !(arr_new_assist[i + length_step].has_value) {
                        o_memswap(arr_new_assist[i+length_step], arr_new[i], true);
                        length_remain_step[i] = 0;
                        length_remain_step_assist[i + length_step] = length_remain_step[i] - length_step;
                        multiplicity_1_assist[i + length_step] = multiplicity_1[i];
                        multiplicity_1[i] = 0;
                        multiplicity_new_assist[i + length_step] = multiplicity_new[i];
                        multiplicity_new[i] = 0;
                        if (length_remain_step_assist[i + length_step] == 0) {
                            //control_bits_1[i + length_step] = 1;
                            multiplicity_new_assist[i + length_step] -= 1;
                        }
                    }
                    else {
                        handle_error_string("Error in aligned_expand_core(): no available position");
                        goto exit;
                    }
                }
                else if (length_step <= multiplicity_new[i] * multiplicity_1[i]) {
                    if !(arr_new[i + length_step].has_value) {
                        o_memcpy(&arr_new[i+length_step], &arr_new[i], sizeof(*arr_new), true);
                        length_remain_step[i + length_step] = uint64_t((length_step + multiplicity_1[i] - 1) / multiplicity_1[i]) * multiplicity_1[i] - length_step;
                        o_memcpy(&multiplicity_1[i + length_step], &multiplicity_1[i], sizeof(*multiplicity_1), true);
                        multiplicity_new_temp = uint64_t(length_step / multiplicity_1[i]);
                        multiplicity_new[i + length_step] = multiplicity_new[i] - multiplicity_new_temp;
                        multiplicity_new[i] = multiplicity_new_temp;
                        if (length_remain_step[i + length_step] == 0) {
                            multiplicity_new[i + length_step] -= 1;
                        }
                    }
                    else if !(arr_new_assist[i + length_step].has_value) {
                        o_memcpy(arr_new[i], arr_new_assist[i+length_step], true);
                        length_remain_step_assist[i + length_step] = int((length_step + multiplicity_1[i] - 1) / multiplicity_1[i]) * multiplicity_1[i] - length_step;
                        o_memcpy(multiplicity_1[i], multiplicity_1_assist[i + length_step], true);
                        multiplicity_new_temp = int(length_step / multiplicity_1[i]);
                        multiplicity_new_assist[i + length_step] = multiplicity_new[i] - multiplicity_new_temp;
                        multiplicity_new[i] = multiplicity_new_temp;
                        if (length_remain_step_assist[i + length_step] == 0) {
                            multiplicity_new_assist[i + length_step] -= 1;
                        }
                    }
                    else {
                        handle_error_string("Error in aligned_expand_core(): no available position");
                        goto exit;
                    }
                }
            }
            */
            printf("\n core info -3");
            if (arr_new[i].has_value) {
                printf("%ld th arr new i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i].key, multiplicity_new[i], multiplicity_1[i], length_remain_step[i]);
            }
            printf("\n core info -2");
            if (arr_new[i+length_step].has_value) {
                printf("%ld th arr new i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i+length_step].key, multiplicity_new[i+length_step], multiplicity_1[i+length_step], length_remain_step[i+length_step]);
            }
            printf("\n core info -1");
            if (arr_new_assist[i].has_value) {
                printf("%ld th arr new assist i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i].key, multiplicity_new_assist[i], multiplicity_1_assist[i], length_remain_step_assist[i]);
            }
            printf("\n core info 0");
            if (arr_new_assist[i+length_step].has_value) {
                printf("%ld th arr new assist i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i+length_step].key, multiplicity_new_assist[i+length_step], multiplicity_1_assist[i+length_step], length_remain_step_assist[i+length_step]);
            }


            // oblivious version
            printf("\n core info 1");
            condition_1 = arr_new[i].has_value;
            printf("\n core info 2");
            condition_2 = length_step <= length_remain_step[i];
            printf("\n core info 3");
            condition_3 = !(arr_new[i + length_step].has_value);
            printf("\n core info 4");
            condition_4 = !(arr_new_assist[i + length_step].has_value);
            printf("\n core info 5");
            

            condition_7 = length_step <= multiplicity_new[i] * multiplicity_1[i];
            printf("\n core info 6");
            condition_8 = !(arr_new[i + length_step].has_value);
            printf("\n core info 7");
            condition_9 = !(arr_new_assist[i + length_step].has_value);
            printf("\n core info 8");

            if (condition_1 && !condition_3 && !condition_4) {
                handle_error_string("Error in aligned_expand_core(): no available position - 1");
                return ;
            }
            o_memswap(&arr_new[i+length_step], &arr_new[i], sizeof(*arr_new), condition_1 && condition_2 && condition_3);
            printf("\n core info 9");
            o_memswap(&arr_new_assist[i+length_step], &arr_new[i], sizeof(*arr_new_assist), condition_1 && condition_2 && !condition_3 && condition_4);
            printf("\n core info 10");
            length_remain_step[i] = !(condition_1 && condition_2) * length_remain_step[i];
            length_remain_step[i + length_step] = (condition_1 && condition_2 && condition_3) * (length_remain_step[i] - length_step) + !(condition_1 && condition_2 && condition_3) * length_remain_step[i + length_step];
            length_remain_step_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * (length_remain_step[i] - length_step) + !(condition_1 && condition_2 && !condition_3 && condition_4) * length_remain_step_assist[i + length_step];
            multiplicity_1[i + length_step] = (condition_1 && condition_2 && condition_3) * multiplicity_1[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_1[i + length_step];
            multiplicity_1_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_1[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_1_assist[i + length_step];
            multiplicity_1[i] = !(condition_1 && condition_2) * multiplicity_1[i];
            multiplicity_new[i + length_step] = (condition_1 && condition_2 && condition_3) * multiplicity_new[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_new[i + length_step];
            multiplicity_new_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_new[i] + !(condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_new_assist[i + length_step];
            multiplicity_new[i] = !(condition_1 && condition_2) * multiplicity_new[i];
            printf("\n core info 11");
            
            condition_5 = length_remain_step[i + length_step] == 0;
            condition_6 = length_remain_step_assist[i + length_step] == 0;
            printf("\n core info 12");
            
            multiplicity_new[i + length_step] = multiplicity_new[i + length_step] - (condition_1 && condition_2 && condition_3 && condition_5) * 1;
            multiplicity_new_assist[i + length_step] = multiplicity_new_assist[i + length_step] - (condition_1 && condition_2 && !condition_3 && condition_4 && condition_6) * 1;
            printf("\n core info 13");
            
            if (condition_1 && !condition_2 && condition_7 && !condition_8 && !condition_9) {
                handle_error_string("Error in aligned_expand_core(): no available position - 2");
                return ;
            }
            o_memcpy(&arr_new[i+length_step], &arr_new[i], sizeof(*arr_new), (condition_1 && !condition_2 && condition_7 && condition_8));
            printf("\n core info 13.1");
            o_memcpy(&arr_new_assist[i+length_step], &arr_new[i], sizeof(*arr_new), (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9));
            printf("\n core info 13.2");
            printf("13.2 ??? remain %ld step %ld m1 %ld", length_remain_step[i + length_step], length_step, multiplicity_1[i]);
            length_remain_step[i + length_step] = (condition_1 && !condition_2 && condition_7 && condition_8) * (CEIL_DIV(length_step, MAX(1, multiplicity_1[i])) * multiplicity_1[i] - length_step) + !(condition_1 && !condition_2 && condition_7 && condition_8) * length_remain_step[i + length_step];
            printf("\n core info 13.3");
            length_remain_step_assist[i + length_step] = (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * (CEIL_DIV(length_step, MAX(multiplicity_1[i], 1)) * multiplicity_1[i] - length_step) + !(condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * length_remain_step_assist[i + length_step];
            printf("\n core info 13.4");
            o_memcpy(&multiplicity_1[i + length_step], &multiplicity_1[i], sizeof(*multiplicity_1), (condition_1 && !condition_2 && condition_7 && condition_8));
            printf("\n core info 13.5");
            o_memcpy(&multiplicity_1_assist[i + length_step], &multiplicity_1[i], sizeof(*multiplicity_1), (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9));
            printf("\n core info 13.6");
            multiplicity_new_temp = (condition_1 && !condition_2 && condition_7) * (length_step / MAX(1, multiplicity_1[i]));
            printf("\n core info 13.7");
            multiplicity_new[i + length_step] = (condition_1 && !condition_2 && condition_7 && condition_8) * (multiplicity_new[i] - multiplicity_new_temp) + !(condition_1 && !condition_2 && condition_7 && condition_8) * multiplicity_new[i + length_step];
            printf("\n core info 13.8");
            multiplicity_new_assist[i + length_step] = (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * (multiplicity_new[i] - multiplicity_new_temp) + !(condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * multiplicity_new_assist[i + length_step];
            printf("\n core info 13.9");
            multiplicity_new[i] = (condition_1 && !condition_2 && condition_7) * multiplicity_new_temp;
            printf("\n core info 14");
            
            condition_10 = length_remain_step[i + length_step] == 0;
            condition_11 = length_remain_step_assist[i + length_step] == 0;
            printf("\n core info 15");
            
            multiplicity_new[i + length_step] = multiplicity_new[i + length_step] - (condition_1 && !condition_2 && condition_7 && condition_8 && condition_10);
            multiplicity_new_assist[i + length_step] = multiplicity_new_assist[i + length_step] - (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9 && condition_11);
            printf("\n core info 16");
            
            printf("condition 1:%d 2:%d 3:%d 4:%d 5:%d 6:%d 7:%d 8:%d 9:%d 10:%d 11:%d\n", condition_1, condition_2, condition_3, condition_4, condition_5, condition_6, condition_7, condition_8, condition_9, condition_10, condition_11);
            if (arr_new[i].has_value) {
                printf("%ld th arr new i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i].key, multiplicity_new[i], multiplicity_1[i], length_remain_step[i]);
            }
            if (arr_new[i+length_step].has_value) {
                printf("%ld th arr new i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i+length_step].key, multiplicity_new[i+length_step], multiplicity_1[i+length_step], length_remain_step[i+length_step]);
            }
            if (arr_new_assist[i].has_value) {
                printf("%ld th arr new assist i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i].key, multiplicity_new_assist[i], multiplicity_1_assist[i], length_remain_step_assist[i]);
            }
            if (arr_new_assist[i+length_step].has_value) {
                printf("%ld th arr new assist i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i+length_step].key, multiplicity_new_assist[i+length_step], multiplicity_1_assist[i+length_step], length_remain_step_assist[i+length_step]);
            }

            printf("\n core info 17");
            // arr_new_assist
            condition_1 = arr_new_assist[i].has_value;
            condition_2 = length_step <= length_remain_step_assist[i];
            condition_3 = !(arr_new[i + length_step].has_value);
            condition_4 = !(arr_new_assist[i + length_step].has_value);

            condition_7 = length_step <= multiplicity_new_assist[i] * multiplicity_1_assist[i];
            condition_8 = !(arr_new[i + length_step].has_value);
            condition_9 = !(arr_new_assist[i + length_step].has_value);

            if (condition_1 && !condition_3 && !condition_4) {
                handle_error_string("Error in aligned_expand_core(): no available position - 3");
                return ;
            }
            o_memswap(&arr_new[i+length_step], &arr_new_assist[i], sizeof(*arr_new), condition_1 && condition_2 && condition_3);
            o_memswap(&arr_new_assist[i+length_step], &arr_new_assist[i], sizeof(*arr_new_assist), condition_1 && condition_2 && !condition_3 && condition_4);
            length_remain_step_assist[i] = !(condition_1 && condition_2) * length_remain_step_assist[i];
            length_remain_step[i + length_step] = (condition_1 && condition_2 && condition_3) * (length_remain_step_assist[i] - length_step) + !(condition_1 && condition_2 && condition_3) * length_remain_step[i + length_step];
            length_remain_step_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * (length_remain_step_assist[i] - length_step) + !(condition_1 && condition_2 && !condition_3 && condition_4) * length_remain_step_assist[i + length_step];
            multiplicity_1[i + length_step] = (condition_1 && condition_2 && condition_3) * multiplicity_1_assist[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_1[i + length_step];
            multiplicity_1_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_1_assist[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_1_assist[i + length_step];
            multiplicity_1_assist[i] = !(condition_1 && condition_2) * multiplicity_1_assist[i];
            multiplicity_new[i + length_step] = (condition_1 && condition_2 && condition_3) * multiplicity_new_assist[i] + !(condition_1 && condition_2 && condition_3) * multiplicity_new[i + length_step];
            multiplicity_new_assist[i + length_step] = (condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_new_assist[i] + !(condition_1 && condition_2 && !condition_3 && condition_4) * multiplicity_new_assist[i + length_step];
            multiplicity_new_assist[i] = !(condition_1 && condition_2) * multiplicity_new_assist[i];
            
            condition_5 = length_remain_step[i + length_step] == 0;
            condition_6 = length_remain_step_assist[i + length_step] == 0;

            multiplicity_new[i + length_step] = multiplicity_new[i + length_step] - (condition_1 && condition_2 && condition_3 && condition_5) * 1;
            multiplicity_new_assist[i + length_step] = multiplicity_new_assist[i + length_step] - (condition_1 && condition_2 && !condition_3 && condition_4 && condition_6) * 1;

            if (condition_1 && !condition_2 && condition_7 && !condition_8 && !condition_9) {
                handle_error_string("Error in aligned_expand_core(): no available position - 4");
                return ;
            }
            o_memcpy(&arr_new[i+length_step], &arr_new_assist[i], sizeof(*arr_new_assist), (condition_1 && !condition_2 && condition_7 && condition_8));
            o_memcpy(&arr_new_assist[i+length_step], &arr_new_assist[i], sizeof(*arr_new_assist), (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9));
            length_remain_step[i + length_step] = (condition_1 && !condition_2 && condition_7 && condition_8) * (CEIL_DIV(length_step, MAX(1, multiplicity_1_assist[i])) * multiplicity_1_assist[i] - length_step) + !(condition_1 && !condition_2 && condition_7 && condition_8) * length_remain_step[i + length_step];
            length_remain_step_assist[i + length_step] = (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * (CEIL_DIV(length_step, MAX(1, multiplicity_1_assist[i])) * multiplicity_1_assist[i] - length_step) + !(condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * length_remain_step_assist[i + length_step];
            o_memcpy(&multiplicity_1[i + length_step], &multiplicity_1_assist[i], sizeof(*multiplicity_1_assist), (condition_1 && !condition_2 && condition_7 && condition_8));
            o_memcpy(&multiplicity_1_assist[i + length_step], &multiplicity_1_assist[i], sizeof(*multiplicity_1_assist), (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9));
            multiplicity_new_temp = (condition_1 && !condition_2 && condition_7) * (length_step / MAX(1, multiplicity_1_assist[i]));
            multiplicity_new[i + length_step] = (condition_1 && !condition_2 && condition_7 && condition_8) * (multiplicity_new_assist[i] - multiplicity_new_temp) + !(condition_1 && !condition_2 && condition_7 && condition_8) * multiplicity_new[i + length_step];
            multiplicity_new_assist[i + length_step] = (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * (multiplicity_new_assist[i] - multiplicity_new_temp) + !(condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9) * multiplicity_new_assist[i + length_step];
            multiplicity_new_assist[i] = (condition_1 && !condition_2 && condition_7) * multiplicity_new_temp;
            
            condition_10 = length_remain_step[i + length_step] == 0;
            condition_11 = length_remain_step_assist[i + length_step] == 0;

            multiplicity_new[i + length_step] = multiplicity_new[i + length_step] - (condition_1 && !condition_2 && condition_7 && condition_8 && condition_10);
            multiplicity_new_assist[i + length_step] = multiplicity_new_assist[i + length_step] - (condition_1 && !condition_2 && condition_7 && !condition_8 && condition_9 && condition_11);
            
            printf("condition 1:%d 2:%d 3:%d 4:%d 5:%d 6:%d 7:%d 8:%d 9:%d 10:%d 11:%d\n", condition_1, condition_2, condition_3, condition_4, condition_5, condition_6, condition_7, condition_8, condition_9, condition_10, condition_11);
            if (arr_new[i].has_value) {
                printf("%ld th arr new i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i].key, multiplicity_new[i], multiplicity_1[i], length_remain_step[i]);
            }
            if (arr_new[i+length_step].has_value) {
                printf("%ld th arr new i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new[i+length_step].key, multiplicity_new[i+length_step], multiplicity_1[i+length_step], length_remain_step[i+length_step]);
            }
            if (arr_new_assist[i].has_value) {
                printf("%ld th arr new assist i: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i].key, multiplicity_new_assist[i], multiplicity_1_assist[i], length_remain_step_assist[i]);
            }
            if (arr_new_assist[i+length_step].has_value) {
                printf("%ld th arr new assist i+step: key %ld new m %ld m1 %ld remained step %ld\n", i, arr_new_assist[i+length_step].key, multiplicity_new_assist[i+length_step], multiplicity_1_assist[i+length_step], length_remain_step_assist[i+length_step]);
            }
        }
        length_step /= 2;
    }
}

int aligned_expand_main(void *args_) {
    printf("[INFO] enter aligned_expand_main...\n");
    struct aligned_expand_args *args = (struct aligned_expand_args*)args_;
    
    elem_t *arr = args->arr;
    uint64_t length = args->length;
    uint64_t number_threads = args->number_threads;
    uint64_t *index_duplicate_start = args->index_duplicate_start;
    bool *control_bits_0 = args->control_bits_0;
    uint64_t *m0 = args->m0;
    uint64_t *m1 = args->m1;

    //ret = aggregation_tree(PREFIX, ADD, &multiplicity_0, &index_duplicate_start, 1, num_threads);
    index_duplicate_start[0] = 0;
    for (uint64_t i = 1; i < length; i++) {
        index_duplicate_start[i] = index_duplicate_start[i-1] + m0[i-1] * !arr[i].table_0;
    }

    control_bits_0[0] = 0;
    struct parallel_execute_0_args parallel_execute_0_args = {
        .arr = arr,
        .index_duplicate_start = index_duplicate_start,
        .control_bits_0 = control_bits_0,
        .length = length,
        .idx_start = 1,
        .number_threads = number_threads,
        .m0 = m0,
    };
    //printf("[INFO] start the first parallel_execute_0...\n");
    parallel_execute_0(&parallel_execute_0_args);
    //printf("[INFO] exited the first parallel_execute_0...\n");

    //index_duplicate_start = aggregation_tree(PREFIX, ADD, index_duplicate_start, control_bits_0);
    for (uint64_t i = 1; i < length; i++) {
        index_duplicate_start[i] = control_bits_0[i] * index_duplicate_start[i-1] + index_duplicate_start[i];
    }
    
    uint64_t *index_duplicate_end;
    index_duplicate_end = calloc(length, sizeof(*index_duplicate_end));
    struct parallel_execute_1_args parallel_execute_1_args = {
        .arr = arr,
        .index_duplicate_start = index_duplicate_start,
        .index_duplicate_end = index_duplicate_end,
        .length = length,
        .number_threads = number_threads,
        .m0 = m0,
        .m1 = m1,
    };
    printf("[INFO] start the first parallel_execute_1...\n");
    parallel_execute_1(&parallel_execute_1_args);
    printf("[INFO] exited the first parallel_execute_1...\n");

    uint64_t dimension_total = index_duplicate_start[length - 1] + (0 < m0[length - 1]) * (m0[length - 1] - 1) * m1[length - 1];
    uint64_t dimension_thread = dimension_total / number_threads;

    printf("\n\n[INFO] result show index start and index end -------------");
    for (uint64_t i = 0; i < length; i++) {
        printf("%ld th key:%ld index start:%ld index end:%ld m0:%ld m1:%ld\n", i, arr[i].key, index_duplicate_start[i], index_duplicate_end[i], m0[i], m1[i]);
    }

    struct aligned_expand_core_args aligned_expand_core_args[number_threads];
    struct thread_work multi_align[number_threads];
    for (uint64_t i = 0; i < number_threads; i++) {
        aligned_expand_core_args[i].arr = arr;
        aligned_expand_core_args[i].index_duplicate_start = index_duplicate_start;
        aligned_expand_core_args[i].index_duplicate_end = index_duplicate_end;
        aligned_expand_core_args[i].m0 = m0;
        aligned_expand_core_args[i].m1 = m1;
        aligned_expand_core_args[i].length_total = length;
        aligned_expand_core_args[i].length_thread = dimension_thread;
        aligned_expand_core_args[i].order_thread = i;

        multi_align[i].type = THREAD_WORK_SINGLE;
        multi_align[i].single.func = aligned_expand_core;
        multi_align[i].single.arg = &aligned_expand_core_args[i];
    }
    printf("[INFO] start push work in aligned_expand_main...\n");
    for (uint64_t i = 0; i < number_threads - 1; i++) {
        printf("[INFO] start push work in aligned_expand_main %ld th thread...\n", i);
        thread_work_push(&multi_align[i]);
    }
    printf("[INFO] complete push work in aligned_expand_main...\n");
    printf("[INFO] start aligned_expand_core in current thread...\n");
    aligned_expand_core(&aligned_expand_core_args[number_threads-1]);
    printf("[INFO] complete aligned_expand_core in current thread...\n");
    for (uint64_t i = 0; i < number_threads - 1; i++) {\
        printf("[INFO] wait thread in aligned_expand_main %ld th thread...\n", i);
        thread_wait(&multi_align[i]);
        printf("[INFO] stop wait thread in aligned_expand_main %ld th thread...\n", i);
    }
    printf("[INFO] complete aligned_expand_main...\n");
    return 0;
}

void aligned_expand(elem_t *arr2, uint64_t length, uint64_t number_threads, uint64_t *m0, uint64_t *m1) {
    printf("[INFO] enter aligned_expand...\n");
    int ret;
    uint64_t *index_duplicate_start;
    bool *control_bits_0;
    
    length_total = length;

    index_duplicate_start = calloc(length, sizeof(*index_duplicate_start));
    control_bits_0 = calloc(length, sizeof(*control_bits_0));

    struct aligned_expand_args args = {
        .arr = arr2,
        .index_duplicate_start = index_duplicate_start,
        .control_bits_0 = control_bits_0,
        .length = length_total,
        .number_threads = number_threads,
        .m0 = m0,
        .m1 = m1,
    };

    ret = aligned_expand_main(&args);
    if (ret) {
        handle_error_string("[ERROR] aligned expansion - main function, exit!");
        return ;
    }
    
    printf("[INFO] complete aligned_expand...\n");
    return ;
}
