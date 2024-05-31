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
#include "enclave/oblivious_distribute.h"
#include "enclave/oblivious_compact.h"
#include "enclave/aggregation_tree.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

static bool condition;
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
    return 0;
}

void scalable_oblivious_join_free() {    
    aggregation_tree_free();
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

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    aggregation_tree_init(number_threads);
    int length = length1 + length2;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct soj_scan_1_args soj_scan_1_args_[number_threads];
    struct soj_scan_2_args soj_scan_2_args_[number_threads];
    int index_start_thread[number_threads + 1];
    index_start_thread[0] = 0;
    struct thread_work soj_scan_1_[number_threads - 1];
    struct thread_work soj_scan_2_[number_threads - 1];
    elem_t *arr_ = calloc(length, sizeof(*arr_));
    control_bit = calloc(length, sizeof(*control_bit));
    control_bit_ = calloc(length, sizeof(*control_bit_));
    int length_result;
    index_target = calloc(length1, sizeof(*index_target));
    index_target2 = calloc(length2, sizeof(*index_target2));
    elem_t *arr1;
    elem_t *arr2;
    int *index_target_;
    int *index_target2_;
    int pre_allocate_size = length1;
    int warmup_size = 1073741824;
    #ifdef PRE_ALLOCATION
        arr1 = calloc(pre_allocate_size, sizeof(*arr1));
        arr2 = calloc(pre_allocate_size, sizeof(*arr2));
        index_target_ = calloc(pre_allocate_size, sizeof(*index_target_));
        index_target2_ = calloc(pre_allocate_size, sizeof(*index_target2_));
    #else
        arr1 = calloc(warmup_size, sizeof(*arr1));
        arr2 = calloc(warmup_size, sizeof(*arr2));
        index_target_ = calloc(warmup_size, sizeof(*index_target_));
        index_target2_ = calloc(warmup_size, sizeof(*index_target2_));
        for (int i = 0; i < warmup_size; i++) {
            arr1[i].key = i;
            arr2[i].key = i;
            index_target_[i] = i;
            index_target2_[i] = i;
        }
        free(arr1);
        free(arr2);
        free(index_target_);
        free(index_target2_);
    #endif
    init_time2();

    bitonic_sort_(arr, true, 0, length, number_threads, false);

    if (1 < number_threads) {
        aggregation_tree_m(arr, length, number_threads);
    }
    else {
        arr[0].m0 = arr[0].table_0;
        arr[0].m1 = !arr[0].table_0;
        
        for (int i = 1; i < length; i++) {
            condition = (arr[i].key == arr[i - 1].key);
            arr[i].m0 = (arr[i].table_0 && condition) * (arr[i - 1].m0 + 1) + (!arr[i].table_0 && condition) * (arr[i - 1].m0) + (arr[i].table_0 && !condition);
            arr[i].m1 = (arr[i].table_0 && condition) * (arr[i - 1].m1) + (!arr[i].table_0 && condition) * (arr[i - 1].m1 + 1) + (!arr[i].table_0 && !condition);
        }
        
        for (int i = length - 1; 0 < i; i--) {
            condition = (arr[i - 1].key == arr[i].key);
            arr[i - 1].m0 = condition * arr[i].m0 + !condition * arr[i - 1].m0;
            arr[i - 1].m1 = condition * arr[i].m1 + !condition * arr[i - 1].m1;
        }
    }

    for (int i = 0; i < number_threads; i++) {
        index_start_thread[i + 1] = index_start_thread[i] + length_thread + (i < length_extra);
    
        soj_scan_1_args_[i].idx_st = index_start_thread[i];
        soj_scan_1_args_[i].idx_ed = index_start_thread[i + 1];
        soj_scan_1_args_[i].control_bit = control_bit;
        soj_scan_1_args_[i].control_bit_ = control_bit_;
        soj_scan_1_args_[i].arr1 = arr;
        soj_scan_1_args_[i].arr2 = arr_;

        if (i < number_threads - 1) {
            soj_scan_1_[i].type = THREAD_WORK_SINGLE;
            soj_scan_1_[i].single.func = soj_scan_1;
            soj_scan_1_[i].single.arg = soj_scan_1_args_ + i;
            thread_work_push(soj_scan_1_ + i);
        }
    }
    soj_scan_1(soj_scan_1_args_ + number_threads - 1);
    for (int i = 0; i < number_threads; i++) {
        if (i < number_threads - 1) {
            thread_wait(soj_scan_1_ + i);
        };
    }

    oblivious_compact_elem(arr, control_bit, length, 1, number_threads);
    oblivious_compact_elem(arr_, control_bit_, length, 1, number_threads);
    
    aggregation_tree_i(index_target, index_target2, arr, arr_, length1, length2, number_threads);

    length_result = index_target[length1 - 1] + arr[length1 - 1].table_0 * arr[length1 - 1].m1;
    #ifdef PRE_ALLOCATION
        if(length_result != pre_allocate_size) {
            arr1 = realloc(arr1, length_result * sizeof(*arr1));
            arr2 = realloc(arr2, length_result * sizeof(*arr2));
            index_target_ = realloc(index_target_, length_result * sizeof(*index_target_));
            index_target2_ = realloc(index_target2_, length_result * sizeof(*index_target2_));
        }
    #else
            arr1 = malloc(arr1, length_result * sizeof(*arr1));
            arr2 = malloc(arr2, length_result * sizeof(*arr2));
            index_target_ = malloc(index_target_, length_result * sizeof(*index_target_));
            index_target2_ = malloc(index_target2_, length_result * sizeof(*index_target2_));
    #endif
    length_thread = length_result / number_threads;
    length_extra = length_result % number_threads;
    for (int i = 0; i < number_threads; i++) {
        index_start_thread[i + 1] = index_start_thread[i] + length_thread + (i < length_extra);

        soj_scan_2_args_[i].idx_st = index_start_thread[i];
        soj_scan_2_args_[i].idx_ed = index_start_thread[i + 1];
        soj_scan_2_args_[i].arr1 = arr1;
        soj_scan_2_args_[i].arr2 = arr2;
        soj_scan_2_args_[i].arr1_ = arr;
        soj_scan_2_args_[i].arr2_ = arr_;
        soj_scan_2_args_[i].index_target1 = index_target_;
        soj_scan_2_args_[i].index_target2 = index_target2_;
        soj_scan_2_args_[i].index_target1_ = index_target;
        soj_scan_2_args_[i].index_target2_ = index_target2;
        soj_scan_2_args_[i].length1 = length1;
        soj_scan_2_args_[i].length2 = length2;
        

        if (i < number_threads - 1) {
            soj_scan_2_[i].type = THREAD_WORK_SINGLE;
            soj_scan_2_[i].single.func = soj_scan_2;
            soj_scan_2_[i].single.arg = soj_scan_2_args_ + i;
            thread_work_push(soj_scan_2_ + i);
        }
    }
    soj_scan_2(soj_scan_2_args_ + number_threads - 1);
    for (int i = 0; i < number_threads; i++) {
        if (i < number_threads - 1) {
            thread_wait(soj_scan_2_ + i);
        };
    }
    oblivious_distribute_elem(arr1, index_target_, length_result, number_threads);
    oblivious_distribute_elem(arr2, index_target2_, length_result, number_threads);

    if (1 < number_threads) {
        aggregation_tree_dup(arr1, length_result, number_threads);
        aggregation_tree_dup(arr2, length_result, number_threads);
    }
    else {
        for (int i = 1; i < length_result; i++) {
            o_memcpy(arr1 + i, arr1 + i - 1, sizeof(*arr1), !arr1[i].has_value);
            o_memcpy(arr2 + i, arr2 + i - 1, sizeof(*arr2), !arr2[i].has_value);
        }
    }

    aggregation_tree_j_order(arr2, length_result, number_threads);
    bitonic_sort_(arr2, true, 0, length_result, number_threads, true);

    get_time2(true);
    
    char *char_current = output_path;
    for (int i = 0; i < length_result; i++) {
        int key1 = arr1[i].key;
        int key2 = arr2[i].key;

        char string_key1[10];
        char string_key2[10];
        int str1_len, str2_len;
        itoa(key1, string_key1, &str1_len);
        itoa(key2, string_key2, &str2_len);
        int data_len1 = my_len(arr1[i].data);
        int data_len2 = my_len(arr2[i].data);
        
        strncpy(char_current, string_key1, str1_len);
        char_current += str1_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, arr1[i].data, data_len1);
        char_current += data_len1; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, string_key2, str2_len);
        char_current += str2_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, arr2[i].data, data_len2);
        char_current += data_len2; char_current[0] = '\n'; char_current += 1;
    }
    char_current[0] = '\0';

    aggregation_tree_free();
    free(arr_);
    free(control_bit);
    free(control_bit_);
    free(index_target);
    free(index_target2);
    free(arr1);
    free(arr2);
    (void)warmup_size;
    (void)pre_allocate_size;
    
    return ;
}