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

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif



static int number_threads;

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

struct args_op {
    int index_thread_start;
    int index_thread_end;
    float* sum;
    elem_t* arr;
    int thread_order;
    float sum_prefix;
    float sum_suffix;
    int key_first;
    int key_last;
};

void parallel_scan_1(void *voidargs) {
    struct args_op *args = (struct args_op*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    float* sum = args->sum;
    elem_t* arr = args->arr;
    bool condition;

    sum[index_thread_start] = arr[index_thread_start].sum;
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = (arr[i].key == arr[i - 1].key);
        sum[i] = condition * sum[i - 1] + arr[i].sum;
    }
    for (int i = index_thread_end - 2; index_thread_start <= i; i--) {
        condition = (arr[i].key == arr[i + 1].key);
        sum[i] = condition * sum[i + 1] + !condition * sum[i];
    }

    return;

}

void parallel_scan_2(void *voidargs) {
    struct args_op *args = (struct args_op*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    float* sum = args->sum;
    elem_t* arr = args->arr;
    int k_first = args->key_first;
    int k_last = args->key_last;
    float s_prefix = args->sum_prefix;
    float s_suffix = args->sum_suffix;
    bool condition;
    bool condition2;

    for (int i = index_thread_start; i < index_thread_end; i++) {
        condition = (arr[i].key == k_first);
        condition2 = (arr[i].key == k_last);
        sum[i] += condition * s_prefix + condition2 * s_suffix;
    }

    return;
}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    int length = length1;
    (void)length2;
    float* sum = calloc(length, sizeof(*sum));
    bool condition;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct args_op args_op_[number_threads];
    args_op_[0].sum_prefix = 0;
    args_op_[number_threads - 1].sum_suffix = 0;
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    args_op_[0].key_first = 0;
    args_op_[number_threads - 1].key_last = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    struct thread_work multi_thread_aggregation_tree_2[number_threads - 1];
    init_time2();

    bitonic_sort_(arr, true, 0, length, number_threads, false);

    if (number_threads == 1) {
        sum[0] = arr[0].sum;
        for (int i = 1; i < length; i++) {
            condition = (arr[i].key == arr[i - 1].key);
            sum[i] = condition * sum[i - 1] + arr[i].sum;
        }
        for (int i = length - 2; 0 <= i; i--) {
            condition = (arr[i].key == arr[i + 1].key);
            sum[i] = condition * sum[i + 1] + !condition * sum[i];
        }
    } else {
        for (int i = 0; i < number_threads; i++) {
            idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);

            args_op_[i].arr = arr;
            args_op_[i].sum = sum;
            args_op_[i].index_thread_start = idx_start_thread[i];
            args_op_[i].index_thread_end = idx_start_thread[i + 1];
            if (i < number_threads - 1) {
                multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
                multi_thread_aggregation_tree_1[i].single.func = parallel_scan_1;
                multi_thread_aggregation_tree_1[i].single.arg = &args_op_[i];
                thread_work_push(&multi_thread_aggregation_tree_1[i]);
            }
        }
        parallel_scan_1(&args_op_[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_aggregation_tree_1[i]);
        }
        for (int i = 1; i < number_threads; i++) {
            args_op_[i].key_first = arr[args_op_[i].index_thread_start - 1].key;
            args_op_[i].sum_prefix = (arr[(args_op_[i - 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_start)].key) * sum[(args_op_[i - 1].index_thread_end - 1)] + (arr[(args_op_[i - 1].index_thread_start)].key == arr[(args_op_[i].index_thread_start)].key) * args_op_[i - 1].sum_prefix;
        }
        for (int i = number_threads - 2; 0 <= i; i--) {
            args_op_[i].key_last = arr[args_op_[i].index_thread_end].key;
            args_op_[i].sum_suffix = (arr[(args_op_[i + 1].index_thread_start)].key == arr[(args_op_[i].index_thread_end - 1)].key) * sum[args_op_[i + 1].index_thread_start] + (arr[(args_op_[i + 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_end - 1)].key) * args_op_[i + 1].sum_suffix;
        }
        for (int i = 0; i < number_threads - 1; i++) {
            multi_thread_aggregation_tree_2[i].type = THREAD_WORK_SINGLE;
            multi_thread_aggregation_tree_2[i].single.func = parallel_scan_2;
            multi_thread_aggregation_tree_2[i].single.arg = &args_op_[i];
            thread_work_push(&multi_thread_aggregation_tree_2[i]);
        }
        parallel_scan_2(&args_op_[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_aggregation_tree_2[i]);
        }
    }

    get_time2(true);

    char *char_current = output_path;
    for (int i = 0; i < length; i++) {
        int key1 = arr[i].key;

        char string_key1[10];
        int str1_len;
        itoa(key1, string_key1, &str1_len);
        int data_len1 = my_len(arr[i].data);

        char sum1[20];
        int sum1_len;
        sprintf(sum1, "%g", arr[i].sum);
        sum1_len = my_len(sum1);

        char sum2[20];
        int sum2_len;
        sprintf(sum2, "%.2f", sum[i]);
        sum2_len = my_len(sum2);

        strncpy(char_current, string_key1, str1_len);
        char_current += str1_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, sum1, sum1_len);
        char_current += sum1_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, sum2, sum2_len);
        char_current += sum2_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, arr[i].data, data_len1);
        char_current += data_len1; char_current[0] = '\n'; char_current += 1;
    }
    char_current[0] = '\0';

    free(sum);

    return;
}