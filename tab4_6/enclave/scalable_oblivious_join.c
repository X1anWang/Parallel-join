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

#define MAX_OUTPUT_LENGTH 536870912

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
    int order;
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
    //int order = args->order;
    //printf("\n\nCheck 0 thread order:%d\ns:%lld e:%lld l1:%lld l2:%lld\n\n", order, index_start, index_end, length1, length2);

    //printf("\n\nCheck 1 thread order:%d\n\n", order);
    for (int i = index_start; (i < index_end) && (i < length1); i++) {
        o_memcpy(arr1 + i, arr1_ + i, sizeof(*arr1), true);
        index_target1[i] = index_target1_[i];
    }
    //printf("\n\nCheck 2 thread order:%d\n\n", order);
    for (int i = length1; i < index_end; i++) {
        arr1[i].has_value = false;
        index_target1[i] = index_target1_[length1 - 1];
    }
    //printf("\n\nCheck 3 thread order:%d\n\n", order);
    for (int i = index_start; (i < index_end) && (i < length2); i++) {
        o_memcpy(arr2 + i, arr2_ + i, sizeof(*arr2), true);
        index_target2[i] = index_target2_[i];
    }
    //printf("\n\nCheck 4 thread order:%d\n\n", order);
    for (int i = length2; i < index_end; i++) {
        arr2[i].has_value = false;
        index_target2[i] = index_target2_[length2 - 1];
    }
    //printf("\n\nCheck 5 thread order:%d\n\n", order);
    return;
}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    
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
    elem_t *arr1 = calloc(MAX_OUTPUT_LENGTH, sizeof(*arr1));
    elem_t *arr2 = calloc(MAX_OUTPUT_LENGTH, sizeof(*arr2));
    int *index_target_ = calloc(MAX_OUTPUT_LENGTH, sizeof(*index_target_));
    int *index_target2_ = calloc(MAX_OUTPUT_LENGTH, sizeof(*index_target2_));
    bitonic_init();
    init_time2();
    init_time();

    // Step(1): 1st sort
    bitonic_sort_(arr, true, 0, length, number_threads, false);
    get_time(true);
    //printf("\nStep 1 - completed");


    // Step(2): Parallel scan multiplicity (m0, m1) by aggregation tree
    if (1 < number_threads) {
        aggregation_tree_m(arr, length, number_threads);
    }
    else {
        arr[0].m0 = arr[0].table_0;
        arr[0].m1 = !arr[0].table_0;
        
        // Downward scan
        for (int i = 1; i < length; i++) {
            condition = (arr[i].key == arr[i - 1].key);
            arr[i].m0 = (arr[i].table_0 && condition) * (arr[i - 1].m0 + 1) + (!arr[i].table_0 && condition) * (arr[i - 1].m0) + (arr[i].table_0 && !condition);
            arr[i].m1 = (arr[i].table_0 && condition) * (arr[i - 1].m1) + (!arr[i].table_0 && condition) * (arr[i - 1].m1 + 1) + (!arr[i].table_0 && !condition);
        }
        
        // Upward scan
        for (int i = length - 1; 0 < i; i--) {
            condition = (arr[i - 1].key == arr[i].key);
            arr[i - 1].m0 = condition * arr[i].m0 + !condition * arr[i - 1].m0;
            arr[i - 1].m1 = condition * arr[i].m1 + !condition * arr[i - 1].m1;
        }
    }
    get_time(true);
    /*
    printf("\nStep 2 - completed");
    
    for (int i = 0; i < length; i++) {
        printf("\n%d-th step2 table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr[i].table_0), arr[i].key, arr[i].data, arr[i].m0, arr[i].m1);
    }
    */


    // Step(3): Break table according to their tid (0 or 1) by parallel NlogN oblivious compaction
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
    get_time(true);
    oblivious_compact_elem(arr, control_bit, length, 1, number_threads);
    oblivious_compact_elem(arr_, control_bit_, length, 1, number_threads);
    get_time(true);
    //printf("\nStep 3 - completed");
    /*
    for (int i = 0; i < length; i++) {
        printf("\n%d-th step3 table:%d key:%d data:%s m0:%d m1:%d has?%d", i, (1 - arr[i].table_0), arr[i].key, arr[i].data, arr[i].m0, arr[i].m1, arr[i].has_value);
        printf("\n%d-th step3 table:%d key:%d data:%s m0:%d m1:%d has?%d", i, (1 - arr_[i].table_0), arr_[i].key, arr_[i].data, arr_[i].m0, arr_[i].m1, arr_[i].has_value);
    }
    */

    
    // Step(4): Parallel oblivious distribute elements to their target index
    aggregation_tree_i(index_target, index_target2, arr, arr_, length1, length2, number_threads);
    get_time(true);
    /*
    printf("\nStep 4 - 0\n");
    for (int i = 0; i < length1; i++) {
        printf("\n%d-th arr1 after aggre i k:%d d:%s target i:%d h_v?:%d", i, arr[i].key, arr[i].data, index_target[i], arr[i].has_value);
    }
    for (int i = 0; i < length2; i++) {
        printf("\n%d-th arr2 after aggre i k:%d d:%s target i:%d h_v?:%d", i, arr_[i].key, arr_[i].data, index_target2[i], arr_[i].has_value);
    }
    */
    //printf("\n\n--> Main Check 1 ");
    length_result = index_target[length1 - 1] + arr[length1 - 1].table_0 * arr[length1 - 1].m1;
    //printf("\n--> Main Check 2 length_result:%lld\n", length_result);
    //printf("\nStep 4 - 1\n");
    length_thread = length_result / number_threads;
    length_extra = length_result % number_threads;
    //printf("\nStep 4 - 2\n");
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
        soj_scan_2_args_[i].order = i;
        

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
    /*
    printf("\nStep 4 - 3\n");
    for (int i = 0; i < length_result; i++) {
        printf("\n%d-th arr2 key:%d data:%s target index:%d has_value?:%d", i, arr2[i].key, arr2[i].data, index_target2_[i], arr2[i].has_value);
    }
    */
    get_time(true);
    oblivious_distribute_elem(arr1, index_target_, length_result, number_threads);
    oblivious_distribute_elem(arr2, index_target2_, length_result, number_threads);
    //printf("\nStep 4 - 4\n");
    get_time(true);
    /*
    printf("\nStep 4 - completed");
        for (int i = 0; i < length_result; i++) {
        printf("\nafter distri %d-th ar2 k:%d d:%s target index:%d has_value?:%d", i, arr2[i].key, arr2[i].data, index_target2_[i], arr2[i].has_value);
    }
    */

    // Step(5): Parallel duplicate elements by aggregation tree
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
    get_time(true);
    //printf("\nStep 5 - completed");
    //printf("\nStep 4 - completed");
    /*
    for (int i = 0; i < length_result; i++) {
        printf("\nafter dup %d-th ar2 k:%d d:%s has_value?:%d", i, arr2[i].key, arr2[i].data, arr2[i].has_value);
    }
    */

    // Step(6): Align the second table by sort
    aggregation_tree_j_order(arr2, length_result, number_threads);
    get_time(true);
    bitonic_sort_(arr2, true, 0, length_result, number_threads, true);
    get_time(true);
    //printf("\nStep 6 - completed");

    printf("\nJoin completed, total time:");
    get_time2(true);    
    printf("\nOutput length is: %d", length_result);
    // Write out
    char *char_current = output_path;
    //printf("\nresult length is:%d\n",length_result);
    for (int i = 0; i < 0; i++) {
        int key1 = arr1[i].key;
        int key2 = arr2[i].key;
        //printf("\n Write out key1:%d key2:%d data1:%s data2:%s", key1, key2, arr1[i].data, arr2[i].data);

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

    bitonic_free();
    aggregation_tree_free();
    free(arr_);
    free(control_bit);
    free(control_bit_);
    free(index_target);
    free(index_target2);
    free(arr1);
    free(arr2);
    
    return ;
}