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

int tree_node_idx_48[48] = {63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62};
int tree_node_idx_6[6] = {7, 8, 9, 10, 5, 6};

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
    return;
}

struct tree_node_op {
    volatile int key_first;
    volatile int key_last;
    volatile float sum_first;
    volatile float sum_last;
    volatile float sum_prefix;
    volatile float sum_suffix;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_op* ag_tree;

struct args_op {
    int index_thread_start;
    int index_thread_end;
    float* sum;
    elem_t* arr;
    int thread_order;
};

void aggregation_tree_op(void *voidargs) {
    struct args_op *args = (struct args_op*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    float* sum = args->sum;
    elem_t* arr = args->arr;
    int thread_order = args->thread_order;
    int cur_tree_node = thread_order;
    bool condition;
    bool condition1;
    bool condition2;

    sum[index_thread_start] = arr[index_thread_start].sum;
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = (arr[i].key == arr[i - 1].key);
        sum[i] = condition * sum[i - 1] + arr[i].sum;
    }
    for (int i = index_thread_end - 2; index_thread_start <= i; i--) {
        condition = (arr[i].key == arr[i + 1].key);
        sum[i] = condition * sum[i + 1] + !condition * sum[i];
    }

    ag_tree[cur_tree_node].key_first = arr[index_thread_start].key;
    ag_tree[cur_tree_node].key_last = arr[index_thread_end - 1].key;
    ag_tree[cur_tree_node].sum_first = sum[index_thread_start];
    ag_tree[cur_tree_node].sum_last = sum[index_thread_end - 1];
    ag_tree[cur_tree_node].complete1 = true;

    int temp;
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2;
        while(!ag_tree[cur_tree_node - 1].complete1) {
            ;
        };
        condition = (ag_tree[cur_tree_node - 1].key_last == ag_tree[cur_tree_node].key_last);
        condition1 = (ag_tree[cur_tree_node - 1].key_first == ag_tree[cur_tree_node].key_first);
        ag_tree[temp].key_first = ag_tree[cur_tree_node - 1].key_first;
        ag_tree[temp].key_last = ag_tree[cur_tree_node].key_last;
        ag_tree[temp].sum_last = condition * ag_tree[cur_tree_node - 1].sum_last + ag_tree[cur_tree_node].sum_last;
        ag_tree[temp].sum_first = condition1 * ag_tree[cur_tree_node].sum_first + ag_tree[cur_tree_node - 1].sum_first;
        ag_tree[temp].complete1 = true;
        cur_tree_node = temp;
    }

    int temp1;

    while(cur_tree_node < thread_order) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;
        while(!ag_tree[cur_tree_node].complete2) {
            ;
        };
        condition = (ag_tree[temp1].key_last == ag_tree[temp].key_first);
        condition1 = (ag_tree[cur_tree_node].key_first == ag_tree[temp].key_first);
        condition2 = (ag_tree[cur_tree_node].key_last == ag_tree[temp1].key_last);

        ag_tree[temp1].sum_prefix = ag_tree[cur_tree_node].sum_prefix;
        ag_tree[temp].sum_prefix = condition * ag_tree[temp1].sum_last + condition1 * ag_tree[cur_tree_node].sum_prefix;
                
        ag_tree[temp1].sum_suffix = condition * ag_tree[temp].sum_first + condition2 * ag_tree[cur_tree_node].sum_suffix;
        ag_tree[temp].sum_suffix = ag_tree[cur_tree_node].sum_suffix;
        
        ag_tree[temp1].complete2 = true;
        ag_tree[temp].complete2 = true;
        cur_tree_node = temp;
    }

    while(!ag_tree[thread_order].complete2) {
        ;
    };

    int key_first = arr[index_thread_start].key;
    float sum_previous = ag_tree[thread_order].sum_prefix;
    int key_last = arr[index_thread_end - 1].key;
    float sum_last = ag_tree[thread_order].sum_suffix;

    for (int i = index_thread_start; i < index_thread_end; i++) {
        condition = (arr[i].key == key_first);
        condition1 = (arr[i].key == key_last);
        sum[i] = sum[i] + condition * sum_previous + condition1 * sum_last;
    }

    return;

}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    printf("\n(5) Entered operator_2 function");
    printf("\n(6) Input length: %d", length1);
    printf("\n(7) key and value size is: %ld and %d (Bytes)", sizeof(arr[0].key), DATA_LENGTH);
    printf("\n(8) Number of threads: %d", number_threads);
    int length = length1;
    (void)length2;
    float* sum = calloc(length, sizeof(*sum));
    bool condition;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct args_op args_op_[number_threads];
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    ag_tree = calloc(2 * number_threads - 1, sizeof(*ag_tree));
    ag_tree[0].sum_prefix = 0;
    ag_tree[0].sum_suffix = 0;
    ag_tree[0].complete2 = true;
    printf("\n(9) Start obliviator operator_2 (X = 3) now, we do: 1) sort, 2) parallel scan\n");
    init_time2();
    init_time();

    bitonic_sort(arr, true, 0, length, number_threads, false);
    get_time(true);

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
            if (number_threads == 6) {
                args_op_[i].thread_order = tree_node_idx_6[i];        
            } else if (number_threads == 48) {
                args_op_[i].thread_order = tree_node_idx_48[i];
            } else {
                args_op_[i].thread_order = number_threads + i - 1;
            }
            if (i < number_threads - 1) {
                multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
                multi_thread_aggregation_tree_1[i].single.func = aggregation_tree_op;
                multi_thread_aggregation_tree_1[i].single.arg = &args_op_[i];
                thread_work_push(&multi_thread_aggregation_tree_1[i]);
            }
        }
        aggregation_tree_op(&args_op_[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_aggregation_tree_1[i]);
        }
    }
    get_time(true);

    printf("\n(10) operator_1 completed, total time:");
    get_time2(true);
    printf("\n(11) Now write out output result");

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
    free(ag_tree);

    return;
}