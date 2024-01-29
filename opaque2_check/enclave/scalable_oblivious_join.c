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

volatile bool thread_status[32];

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
    //thread_status = calloc(nthreads, sizeof(*thread_status));

    
    return 0;

}

void scalable_oblivious_join_free() {
    return;
    //aggregation_tree_free();
    //aligned_expand_free();
}

struct tree_node_op2 {
    volatile int key_first;
    volatile int key_last;
    volatile float sum_first;
    volatile float sum_last;
    volatile float sum_prefix;
    volatile float sum_suffix;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_op2* ag_tree;

struct args_op2 {
    int index_thread_start;
    int index_thread_end;
    float* sum;
    elem_t* arr;
    int thread_order;
};

void aggregation_tree_op2(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    float* sum = args->sum;
    elem_t* arr = args->arr;
    bool condition;
    int current_order = args->thread_order;

    sum[index_thread_start] = arr[index_thread_start].sum;
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr[i].key == arr[i - 1].key;
        sum[i] = condition * sum[i - 1] + arr[i].sum;
    }
    for (int i = index_thread_end - 2; index_thread_start <= i; i--) {
        condition = arr[i].key == arr[i + 1].key;
        sum[i] = condition * sum[i + 1] + !condition * sum[i];
    }

    if (current_order == 0) {
        get_time(true);
        printf("\n Timer start\n");
        thread_status[0] = false;
    } else {
        while(thread_status[current_order - 1]) {
            ;
        }
        condition = (arr[index_thread_start - 1].key == arr[index_thread_start].key);
        sum[index_thread_start] += condition * sum[index_thread_start - 1];
        condition = (arr[index_thread_start - 1].key == arr[index_thread_end - 1].key);
        sum[index_thread_end - 1] += condition * sum[index_thread_start - 1];
        thread_status[current_order] = false;
    }
    if (current_order == number_threads - 1) {
        get_time(true);
        printf("\n Timer end\n");
    }
    return;

}

void aggregation_tree_op3(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    float* sum = args->sum;
    elem_t* arr = args->arr;
    bool condition;

    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr[i].key == arr[i - 1].key;
        sum[i] = condition * sum[i - 1] + !condition * sum[i];
    }

    return;

}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){

    for (int i = 0; i < number_threads; i++) thread_status[i] = true;
    int length = length1;
    (void)length2;
    (void)output_path;
    float* sum = calloc(length, sizeof(*sum));
    bool condition;
    //bool condition2;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct args_op2 args_op2_[number_threads];
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    struct thread_work multi_thread_aggregation_tree_2[number_threads - 1];
    ag_tree = calloc(2 * number_threads - 1, sizeof(*ag_tree));
    ag_tree[0].sum_prefix = 0;
    ag_tree[0].sum_suffix = 0;
    ag_tree[0].complete2 = true;
    printf("\n Opaque BDB Operator 2 - start. \n");
    printf("\n Number of threads - %d\n", number_threads);
    init_time();


    bitonic_sort_(arr, true, 0, length, number_threads, false);

    //printf("\n Sort completed");

    if (number_threads == 1) {
        sum[0] = arr[0].sum;
        for (int i = 1; i < length; i++) {
            condition = arr[i].key == arr[i - 1].key;
            sum[i] = condition * sum[i - 1] + arr[i].sum;
        }
        for (int i = length - 2; 0 <= i; i--) {
            condition = arr[i].key == arr[i + 1].key;
            sum[i] = condition * sum[i + 1] + !condition * sum[i];
        }
    } else {
        for (int i = 0; i < number_threads; i++) {
            idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);

            args_op2_[i].arr = arr;
            args_op2_[i].sum = sum;
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

    free(sum);
    free(ag_tree);

    return;
}