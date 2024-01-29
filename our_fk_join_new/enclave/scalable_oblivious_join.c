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

//#define COMMUNICATE

#ifdef COMMUNICATE
volatile bool timer_start = true;
volatile bool timer_end = true;
#endif

static long long number_threads;

long long tree_node_idx_48[48] = {63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62};
long long tree_node_idx_6[6] = {7, 8, 9, 10, 5, 6};

void reverse(char *s) {
    long long i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

long long my_len(char *data) {
    long long i = 0;

    while ((data[i] != '\0') && (i < DATA_LENGTH)) i++;
    
    return i;
}

long long o_strcmp(char* str1, char* str2) {
    bool flag = false;
    long long result = 0;

    for (long long i = 0; i < 105; i++) {
        result = !flag * (-1 * (str1[i] < str2[i]) + 1 * (str1[i] > str2[i])) + flag * result;
        flag = (!flag && ((str1[i] < str2[i]) || (str1[i] > str2[i]))) || flag;
    }

    return result;
}

void itoa(long long n, char *s, long long *len) {
    long long i = 0;
    long long sign;

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
    return;
    //aggregation_tree_free();
    //aligned_expand_free();
}

struct tree_node_op2 {
    volatile long long key_first;
    volatile long long key_last;
    volatile long long key_prefix;
    volatile bool table0_fisrt;
    volatile bool table0_last;
    volatile bool table0_prefix;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_op2* ag_tree;

struct args_op2 {
    long long index_thread_start;
    long long index_thread_end;
    elem_t* arr;
    elem_t* arr_;
    long long thread_order;
};

void aggregation_tree_op2(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    long long index_thread_start = args->index_thread_start;
    long long index_thread_end = args->index_thread_end;
    elem_t* arr = args->arr;
    elem_t* arr_ = args->arr_;
    long long thread_order = args->thread_order;
    long long cur_tree_node = thread_order;
    bool condition;




    elem_t* arr_temp = calloc(1, sizeof(*arr_temp));
    arr_temp[0].table_0 = false;
    condition = arr[index_thread_start].table_0;
    o_memcpy(arr_temp, arr + index_thread_start, sizeof(*arr), condition);
    for (long long i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr[i].table_0;
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), !condition);
        o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
    }

    ag_tree[cur_tree_node].key_last = arr_temp[0].key;

    ag_tree[cur_tree_node].table0_last = arr_temp[0].table_0;
    ag_tree[cur_tree_node].complete1 = true;

    #ifdef COMMUNICATE
    if(timer_start) {
        timer_start = false;
        printf("\nTimer start\n");
        get_time(false);
    }
    #endif

    long long temp; // aggregation tree start
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2;
        while(!ag_tree[cur_tree_node - 1].complete1) {
            ;
        };
        condition = ag_tree[cur_tree_node].table0_last;
        ag_tree[temp].key_last = condition * ag_tree[cur_tree_node].key_last + !condition * ag_tree[cur_tree_node - 1].key_last;
        ag_tree[temp].table0_last = condition + ag_tree[cur_tree_node - 1].table0_last;
        ag_tree[temp].complete1 = true;
        cur_tree_node = temp;
    }
    //complete2[cur_tree_node] = true;
    long long temp1;
    //printf("\nCheck 3, from thread %d\n", thread_order);

    while(cur_tree_node < thread_order) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;
        while(!ag_tree[cur_tree_node].complete2) {
            ;
        };
        condition = 

        ag_tree[temp1].table0_prefix = ag_tree[cur_tree_node].table0_prefix;
        ag_tree[temp].table0_prefix = ag_tree[temp1].table0_last + ag_tree[cur_tree_node].table0_prefix;
            ag_tree[temp1].key_prefix = ag_tree[cur_tree_node].key_prefix;
            ag_tree[temp].key_prefix = ag_tree[temp1].table0_last * ag_tree[temp1].key_last + !ag_tree[temp1].table0_last * ag_tree[cur_tree_node].key_prefix;
        ag_tree[temp1].complete2 = true;
        ag_tree[temp].complete2 = true;
        cur_tree_node = temp;
    }
    //printf("\nCheck 4, from thread %d\n", thread_order);
    while(!ag_tree[thread_order].complete2) {
        ;
    };

    #ifdef COMMUNICATE
    if(timer_end) {
        timer_end = false;
        get_time(true);
        printf("\nTimer end\n");
    }
    #endif

        arr_temp[0].key = ag_tree[thread_order].key_prefix;
    arr_temp[0].table_0 = ag_tree[thread_order].table0_prefix;

    for (long long i = index_thread_start; i < index_thread_end; i++) {
        condition = !arr[i].table_0 && !arr[i].table_0;
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_temp), condition);
    }
    //printf("\nCheck 6, from thread %d\n", thread_order);

    free(arr_temp);
    return;
}

void scalable_oblivious_join(elem_t *arr, long long length1, long long length2, char* output_path){
    #ifdef COMMUNICATE
    timer_start = true;
    timer_end = true;
    #endif
    long long length = length1 + length2;
    (void)output_path;
    elem_t* arr_ = calloc(length, sizeof(*arr_));
    for (long long i = 0; i < length; i++) {
        arr_[i].table_0 = false;
    }
    bool condition;
    long long length_thread = length / number_threads;
    long long length_extra = length % number_threads;
    struct args_op2 args_op2_[number_threads];
    long long idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    ag_tree = calloc(2 * number_threads - 1, sizeof(*ag_tree));
    ag_tree[0].table0_prefix = 0;
    ag_tree[0].complete2 = true;
    elem_t* arr_temp = calloc(1, sizeof(*arr_temp));
    printf("\n Our foreign key join - start. \n");
    printf("\n Number of threads: %lld \n", number_threads);
    init_time();


    bitonic_sort_(arr, true, 0, length, number_threads, true);
    //printf("\n check 1. \n");
    //printf("\n Sort completed");

    if (number_threads == 1) {
        condition = arr[0].table_0;
        o_memcpy(arr_temp, arr, sizeof(*arr), condition);
        for (long long i = 1; i < length; i++) {
            condition = arr[i].table_0;
            o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), !condition);
            o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
        }
    } else {
    //printf("\n check 2. \n");
    for (long long i = 0; i < number_threads; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);

        args_op2_[i].arr = arr;
            args_op2_[i].arr_ = arr_;
            args_op2_[i].index_thread_start = idx_start_thread[i];
            args_op2_[i].index_thread_end = idx_start_thread[i + 1];
            if (number_threads == 6) {
                args_op2_[i].thread_order = tree_node_idx_6[i];        
            } else if (number_threads == 48) {
                args_op2_[i].thread_order = tree_node_idx_48[i];
            } else {
                args_op2_[i].thread_order = number_threads + i - 1;
            }
            if (i < number_threads - 1) {
                multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
                multi_thread_aggregation_tree_1[i].single.func = aggregation_tree_op2;
                multi_thread_aggregation_tree_1[i].single.arg = &args_op2_[i];
                thread_work_push(&multi_thread_aggregation_tree_1[i]);
            }
    }
    aggregation_tree_op2(&args_op2_[number_threads - 1]);
    for (long long i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }
    }
    get_time(true);

    free(ag_tree);
    free(arr_temp);
    free(arr_);
    
    return;
}