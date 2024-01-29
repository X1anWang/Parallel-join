#include "enclave/scalable_oblivious_join.h"
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
#include "common/code_conf.h"
#include "enclave/mpi_tls.h"
#include "enclave/bitonic.h"
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"
#include "enclave/aligned_expand.h"
#include "enclave/oblivious_distribute.h"
#include "enclave/oblivious_compact.h"
#include "enclave/aggregation_tree.h"
//#include "enclave/bucket.h"
//#include "enclave/nonoblivious.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

volatile bool thread_status[32];

static int number_threads;
static int *index_target;
static int *index_target2;
static bool *control_bit;
static bool *control_bit_;

void reverse(char *s) {
    int i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

int my_len(char *data) {
    int i = 0;

    while ((data[i] != '\0') && (i < DATA_LENGTH)) i++;
    
    return i;
}

// < -1
// == 0
// > 1
int o_strcmp(char* str1, char* str2) {
    bool flag = false;
    int result = 0;

    for (int i = 0; i < 105; i++) {
        result = !flag * (-1 * (str1[i] < str2[i]) + 1 * (str1[i] > str2[i])) + flag * result;
        flag = (!flag && ((str1[i] < str2[i]) || (str1[i] > str2[i]))) || flag;
    }

    return result;
}

void itoa(int n, char *s, int *len) {
    int i = 0;
    int sign;

    if ((sign = n) < 0) {
        n = -n;
        i = 0;
    }
        
    do {
        s[i++] = n % 10 + '0';
    } while ((n /= 10) > 0);
    
    if (sign < 0)
        s[i++] = '-';
    s[i] = '\0';
    
    *len = i;
    
    reverse(s);
}

int scalable_oblivious_join_init(int nthreads) {

    number_threads = nthreads;
    //aggregation_tree_init(number_threads);

    
    return 0;

}

void scalable_oblivious_join_free() {
    
    aggregation_tree_free();
    //aligned_expand_free();
}

struct soj_scan_1_args {
    int idx_st;
    int idx_ed;
    bool* control_bit;
    bool* control_bit_;
    elem_t *arr2;
    elem_t *arr1;
    int* m0;
    int* m1;
};

struct soj_scan_2_args {
    int idx_st;
    int idx_ed;
    int length1;
    int length2;
    elem_t *arr1;
    elem_t *arr2;
    elem_t *arr1_;
    elem_t *arr2_;
    int *index_target1;
    int *index_target2;
    int *index_target1_;
    int *index_target2_;
};


void soj_scan_1(void *voidargs) {
    struct soj_scan_1_args *args = (struct soj_scan_1_args*)voidargs;
    int index_start = args->idx_st;
    int index_end = args->idx_ed;
    bool* cb1 = args->control_bit;
    bool* cb2 = args->control_bit_;
    elem_t *arr1 = args->arr1;
    elem_t *arr2 = args->arr2;

    for (int i = index_start; i < index_end; i++) {
        cb1[i] = arr1[i].table_0 && (0 < arr1[i].m1);
        cb2[i] = (!arr1[i].table_0) && (0 < arr1[i].m0);
        o_memcpy(arr2 + i, arr1 + i, sizeof(*arr2), true);
        arr1[i].has_value = cb1[i];
        arr2[i].has_value = cb2[i];
    }

    return;
}

void soj_scan_2(void *voidargs) {
    struct soj_scan_2_args *args = (struct soj_scan_2_args*)voidargs;
    int index_start = args->idx_st;
    int index_end = args->idx_ed;
    int length1 = args->length1;
    int length2 = args->length2;
    elem_t *arr1 = args->arr1;
    elem_t *arr2 = args->arr2;
    elem_t *arr1_ = args->arr1_;
    elem_t *arr2_ = args->arr2_;
    int *index_target1 = args->index_target1;
    int *index_target2 = args->index_target2;
    int *index_target1_ = args->index_target1_;
    int *index_target2_ = args->index_target2_;

    for (int i = index_start; (i < index_end) && (i < length1); i++) {
        o_memcpy(arr1 + i, arr1_ + i, sizeof(*arr1), true);
        index_target1[i] = index_target1_[i];
    }
    for (int i = length1; i < index_end; i++) {
        arr1[i].has_value = false;
        index_target1[i] = index_target1_[length1 - 1];
    }

    for (int i = index_start; (i < index_end) && (i < length2); i++) {
        o_memcpy(arr2 + i, arr2_ + i, sizeof(*arr2), true);
        index_target2[i] = index_target2_[i];
    }
    for (int i = length2; i < index_end; i++) {
        arr2[i].has_value = false;
        index_target2[i] = index_target2_[length2 - 1];
    }
    return;
}

struct args_op2 {
    int index_thread_start;
    int index_thread_end;
    elem_t* arr;
    elem_t* arr_;
    int thread_order;
};

void aggregation_tree_op2(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    elem_t* arr = args->arr;
    elem_t* arr_ = args->arr_;
    bool condition;
    elem_t *arr_temp = calloc(1, sizeof(*arr_temp));
    int current_order = args->thread_order;
    arr_temp[0].table_0 = false;

    condition = arr[index_thread_start].table_0;
    o_memcpy(arr_temp, arr + index_thread_start, sizeof(*arr), condition);
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr[i].table_0;
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), !condition);
        o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
    }

    if (current_order == 0) {
        get_time(true);
        printf("\n Timer start\n");
        thread_status[0] = false;
    } else {
        while(thread_status[current_order - 1]) {
            ;
        }
        condition = !arr[index_thread_start].table_0;
        o_memcpy(arr_ + index_thread_start, arr + index_thread_start - 1, sizeof(*arr_), condition);
        condition = !arr[index_thread_end - 1].table_0;
        o_memcpy(arr_ + index_thread_end - 1, arr + index_thread_start - 1, sizeof(*arr_), condition); 
        thread_status[current_order] = false;
    }
    if (current_order == number_threads - 1) {
        get_time(true);
        printf("\n Timer end\n");
    }

    free(arr_temp);
    return;
}

void aggregation_tree_op3(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    elem_t* arr_ = args->arr_;
    bool condition;
    elem_t *arr_temp = calloc(1, sizeof(*arr_temp));
    
    o_memcpy(arr_temp, arr_ + index_thread_start, sizeof(*arr_), true);
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr_[i].table_0;
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), !condition);
        //o_memcpy(arr_temp, arr, sizeof(*arr), condition);
    }

    free(arr_temp);

    return;

}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    for (int i = 0; i < number_threads; i++) thread_status[i] = true;
    // Step(0): Initialize local variable
    printf("\nBitonoic sort based parallel join start...");
    printf("\nInput length: %d and %d", length1, length2);
    printf("\n key and value size is: %d (Bytes)", (DATA_LENGTH + 4));
    printf("\nNumber of threads: %d\n", number_threads);
    //printf("\nSeconds in order: 1st sort, m scan (aggregation tree), prepare for ocompact, ocompact, prepare for odistribute, odistribute, duplicate (aggregation tree), prepare for align, align by sort.\n");
    aggregation_tree_init(number_threads);
    int length = length1 + length2;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    elem_t *arr_ = calloc(length, sizeof(*arr_));
    elem_t *arr_temp = calloc(1, sizeof(*arr_));
    control_bit = calloc(length, sizeof(*control_bit));
    control_bit_ = calloc(length, sizeof(*control_bit_));
    bool condition;
    (void)output_path;
    struct args_op2 args_op2_[number_threads];
    index_target = calloc(length1, sizeof(*index_target));
    index_target2 = calloc(length2, sizeof(*index_target2));
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    bitonic_init();
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    struct thread_work multi_thread_aggregation_tree_2[number_threads - 1];
    init_time2();
    init_time();

    // Step(1): 1st sort
    bitonic_sort_(arr, true, 0, length, number_threads, true);
    get_time(true);


    if (number_threads == 1) {
        condition = arr[0].table_0;
        o_memcpy(arr_temp, arr, sizeof(*arr), condition);
        for (int i = 1; i < length; i++) {
            condition = arr[i].table_0;
            o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), !condition);
            o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
        }
    } else {
        for (int i = 0; i < number_threads; i++) {
            idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);

            args_op2_[i].arr = arr;
            args_op2_[i].arr_ = arr_;
            args_op2_[i].index_thread_start = idx_start_thread[i];
            args_op2_[i].index_thread_end = idx_start_thread[i + 1];
            args_op2_[i].thread_order = i;
            if (i < number_threads - 1) {
                multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
                multi_thread_aggregation_tree_1[i].single.func = aggregation_tree_op2;
                multi_thread_aggregation_tree_1[i].single.arg = &args_op2_[i];
                thread_work_push(&multi_thread_aggregation_tree_1[i]);
            }
        }
    aggregation_tree_op2(&args_op2_[number_threads - 1]);
    for (int i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }
    for (int i = 0; i < number_threads - 1; i++) {
        multi_thread_aggregation_tree_2[i].type = THREAD_WORK_SINGLE;
        multi_thread_aggregation_tree_2[i].single.func = aggregation_tree_op3;
        multi_thread_aggregation_tree_2[i].single.arg = &args_op2_[i];
        thread_work_push(&multi_thread_aggregation_tree_2[i]);
    }
    aggregation_tree_op3(&args_op2_[number_threads - 1]);
    for (int i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_2[i]);
    }
    }
    get_time(true);


















    bitonic_free();
    aggregation_tree_free();
    free(arr_);
    free(control_bit);
    free(control_bit_);
    free(index_target);
    free(index_target2);
    
    return ;
}