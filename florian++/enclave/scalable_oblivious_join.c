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

static bool condition;


static int number_threads;
//static int *index_target;
//static int *index_target2;
//static bool *control_bit;
//static bool *control_bit_;

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
    printf("\nFlorian++, our implementation w. parallel sort and oblivious memswap, random input.");
    printf("\nInput length: %d and %d", length1, length2);
    printf("\nkey and value size is: %d (Bytes)", (DATA_LENGTH + 4));
    printf("\nNumber of threads: %d\n", number_threads);
    //printf("\nSeconds in order: 1st sort, m scan, sort to break table, target index calculate, sort again before distribute, odistribute, duplicate, prepare for align, align by sort.\n");
    int length = length1 + length2;
    int length_result;
    elem_t *arr1;
    elem_t *arr2;
    int max_key1 = 0;
    int max_key2 = 0;
    init_time2();
    init_time();


    bitonic_sort_(arr, true, 0, length, number_threads, false, false);
    get_time(true);
    //printf("\nStep 1 - completed");

    
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
    get_time(true);
    //printf("\nStep 2 - completed");


    bitonic_sort_(arr, true, 0, length, number_threads, false, true);
    get_time(true);
    /*
    for(int i = 0; i < length; i++) {
        printf("\n %d th table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr[i].table_0), arr[i].key, arr[i].data, arr[i].m0, arr[i].m1);
    }
    */
    arr[0].idx_st = 0;
    arr[length1].idx_st = 0;
    max_key1 = MAX(max_key1, arr[0].key);
    max_key2 = MAX(max_key2, arr[length1].key);
    for(int i = 1; i < length1; i++) {
        arr[i].idx_st = arr[i - 1].idx_st + arr[i - 1].m1;
        max_key1 = MAX(max_key1, arr[i].key);
    }
    for(int i = length1 + 1; i < length; i++) {
        arr[i].idx_st = arr[i - 1].idx_st + arr[i - 1].m0;
        max_key2 = MAX(max_key2, arr[i].key);
    }
    get_time(true);
    max_key1++;
    max_key2++;
    length_result = arr[length1 - 1].idx_st + arr[length1 - 1].m1;
    arr1 = calloc(length_result, sizeof(*arr1));
    arr2 = calloc(length_result, sizeof(*arr2));
    for(int i = 0; i < MIN(length1, length_result); i++) {
        condition = (arr[i].m1 != 0);
        o_memcpy(arr1 + i, arr + i, sizeof(*arr1), condition);
        arr1[i].has_value = condition;
        arr1[i].key = condition * arr1[i].key + (!condition) * max_key1;
    }
    for (int i = length1; i < length_result; i++) {
        arr1[i].has_value = false;
        arr1[i].key = max_key1;
    }
    for(int i = 0; i < MIN(length2, length_result); i++) {
        condition = (arr[i].m0 != 0);
        o_memcpy(arr2 + i, arr + length1 + i, sizeof(*arr2), condition);
        arr2[i].has_value = condition;
        arr2[i].key = condition * arr2[i].key + (!condition) * max_key2;
    }
    for (int i = length2; i < length_result; i++) {
        arr2[i].has_value = false;
        arr2[i].key = max_key2;
    }
    get_time(true);
    bitonic_sort_(arr1, true, 0, length_result, number_threads, false, false);
    bitonic_sort_(arr2, true, 0, length_result, number_threads, false, false);
    get_time(true);
    /*
    for(int i = 0; i < length_result; i++) {
        printf("\n %d th 1 table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr1[i].table_0), arr1[i].key, arr1[i].data, arr1[i].m0, arr1[i].m1);
        //printf("\n %d th 2 table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr2[i].table_0), arr2[i].key, arr2[i].data, arr2[i].m0, arr2[i].m1);
    }
    for(int i = 0; i < length_result; i++) {
        //printf("\n %d th 1 table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr1[i].table_0), arr1[i].key, arr1[i].data, arr1[i].m0, arr1[i].m1);
        printf("\n %d th 2 table:%d key:%d data:%s m0:%d m1:%d", i, (1 - arr2[i].table_0), arr2[i].key, arr2[i].data, arr2[i].m0, arr2[i].m1);
    }
    printf("\nStep 3 - completed");
    */

    int length_step = pow2_lt(length_result);
    while (0 < length_step) {
        for (int i = length_result - 1; 0 <= i; i--) {
            if (i + length_step < length_result) {
                o_memswap(arr1 + i, arr1 + i + length_step, sizeof(*arr1), arr1[i].has_value && (i + length_step <= arr1[i].idx_st));
                o_memswap(arr2 + i, arr2 + i + length_step, sizeof(*arr2), arr2[i].has_value && (i + length_step <= arr2[i].idx_st));
                }
        }
        length_step /= 2;
    }
    get_time(true);
    //printf("\nStep 4 - completed");

    for (int i = 1; i < length_result; i++) {
        o_memcpy(arr1 + i, arr1 + i - 1, sizeof(*arr1), !arr1[i].has_value);
        o_memcpy(arr2 + i, arr2 + i - 1, sizeof(*arr2), !arr2[i].has_value);
    }
    get_time(true);
    //printf("\nStep 5 - completed");

    int temp_j_order = 0;
    for (int i = 0; i < length_result; i++) {        
        arr2[i].j_order = temp_j_order % MAX(1, arr2[i].m0) * arr2[i].m1 + (temp_j_order / MAX(arr2[i].m0, 1));
        temp_j_order = (arr2[i].key == arr2[i - 1].key) * (temp_j_order + 1);
    }
    get_time(true);
    bitonic_sort_(arr2, true, 0, length_result, number_threads, true, false);
    get_time(true);
    printf("\nFlorian (our parallel implementation) Completed. length_result is %d\n", length_result);
    printf("\nTotal time:");
    get_time2(true);

    // Write out
    char *char_current = output_path;
    //printf("\nresult length is:%d\n",length_result);
    for (int i = 0; i < length_result; i++) {
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
    //printf("\nStep 7 - completed");

    //aggregation_tree_free();

    return ;
}