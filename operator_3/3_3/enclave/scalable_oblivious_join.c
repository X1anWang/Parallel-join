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
//#include "enclave/bucket.h"
//#include "enclave/nonoblivious.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

int tree_node_idx_48[48] = {63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62};
int tree_node_idx_6[6] = {7, 8, 9, 10, 5, 6};

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

// < -1
// == 0
// > 1
int o_strcmp(char* str1, char* str2) {
    bool flag = false;
    int result = 0;

    for (int i = 0; i < 16; i++) {
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
    
    //aggregation_tree_free();
    //aligned_expand_free();
}

int o_strcmp_(volatile char* str1, volatile char* str2) {
    bool flag = false;
    int result = 0;

    for (int i = 0; i < 16; i++) {
        result = !flag * (-1 * (str1[i] < str2[i]) + 1 * (str1[i] > str2[i])) + flag * result;
        flag = (!flag && ((str1[i] < str2[i]) || (str1[i] > str2[i]))) || flag;
    }

    return result;
}

struct tree_node_op2 {
    volatile uint64_t key_first;
    volatile uint64_t key_last;
    volatile float sum_first;
    volatile float sum_last;
    volatile float sum_prefix;
    volatile float sum_suffix;
    volatile float sum_first2;
    volatile float sum_last2;
    volatile float sum_prefix2;
    volatile float sum_suffix2;
    volatile float sum_first3;
    volatile float sum_last3;
    volatile float sum_prefix3;
    volatile float sum_suffix3;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_op2* ag_tree;

void o_strcp_(volatile char* str1, volatile char* str2) {
    for (int i = 0; i < 16; i++) {
        str1[i] = str2[i];
    }
}

struct args_op2 {
    int index_thread_start;
    int index_thread_end;
    int *count;
    elem_t* arr;
    int thread_order;
};

void aggregation_tree_op2(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    int* count = args->count;
    elem_t* arr = args->arr;
    int thread_order = args->thread_order;
    int cur_tree_node = thread_order;
    bool condition;
    bool condition1;
    bool condition2;

    //printf("\nCheck 1, from thread %d\n", thread_order);

    arr[index_thread_start].avg_pagerank = arr[index_thread_start].pagerank;
    arr[index_thread_start].sum_adrevenue = arr[index_thread_start].adrevenue;
    count[index_thread_start] = 1;
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = (arr[i].key == arr[i - 1].key);
        arr[i].sum_adrevenue = condition * arr[i - 1].sum_adrevenue + arr[i].adrevenue;
        arr[i].avg_pagerank = condition * arr[i - 1].avg_pagerank + arr[i].pagerank;
        count[i] = 1 + condition * count[i - 1];
    }
    for (int i = index_thread_end - 2; index_thread_start <= i; i--) {
        condition = (arr[i].key == arr[i + 1].key);
        arr[i].sum_adrevenue = condition * arr[i + 1].sum_adrevenue + !condition * arr[i].sum_adrevenue;
        arr[i].avg_pagerank = condition * arr[i + 1].avg_pagerank + !condition * arr[i].avg_pagerank;
        count[i] = condition * count[i + 1] + !condition * count[i];
        //arr[i].avg_pagerank /= count[i];
    }

    //printf("\nCheck 2, from thread %d\n", thread_order);

    ag_tree[cur_tree_node].key_first = arr[index_thread_start].key;
    ag_tree[cur_tree_node].key_last = arr[index_thread_end - 1].key;
    ag_tree[cur_tree_node].sum_first = arr[index_thread_start].avg_pagerank;
    ag_tree[cur_tree_node].sum_last = arr[index_thread_end - 1].avg_pagerank;
    ag_tree[cur_tree_node].sum_first2 = arr[index_thread_start].sum_adrevenue;
    ag_tree[cur_tree_node].sum_last2 = arr[index_thread_end - 1].sum_adrevenue;
    ag_tree[cur_tree_node].sum_first3 = count[index_thread_start];
    ag_tree[cur_tree_node].sum_last3 = count[index_thread_end - 1];
    ag_tree[cur_tree_node].complete1 = true;

    int temp; // aggregation tree start
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
        ag_tree[temp].sum_last2 = condition * ag_tree[cur_tree_node - 1].sum_last2 + ag_tree[cur_tree_node].sum_last2;
        ag_tree[temp].sum_first2 = condition1 * ag_tree[cur_tree_node].sum_first2 + ag_tree[cur_tree_node - 1].sum_first2;
        ag_tree[temp].sum_last3 = condition * ag_tree[cur_tree_node - 1].sum_last3 + ag_tree[cur_tree_node].sum_last3;
        ag_tree[temp].sum_first3 = condition1 * ag_tree[cur_tree_node].sum_first3 + ag_tree[cur_tree_node - 1].sum_first3;
        ag_tree[temp].complete1 = true;
        cur_tree_node = temp;
    }
    //complete2[cur_tree_node] = true;
    int temp1;
    //printf("\nCheck 3, from thread %d\n", thread_order);

    while(cur_tree_node < thread_order) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;
        while(!ag_tree[cur_tree_node].complete2) {
            ;
        };
        condition = ag_tree[temp1].key_last == ag_tree[temp].key_first;
        condition1 = ag_tree[cur_tree_node].key_first == ag_tree[temp].key_first;
        condition2 = ag_tree[cur_tree_node].key_last == ag_tree[temp1].key_last;

        ag_tree[temp1].sum_prefix = ag_tree[cur_tree_node].sum_prefix;
        ag_tree[temp].sum_prefix = condition * ag_tree[temp1].sum_last + condition1 * ag_tree[cur_tree_node].sum_prefix;
                
        ag_tree[temp1].sum_suffix = condition * ag_tree[temp].sum_first + condition2 * ag_tree[cur_tree_node].sum_suffix;
        ag_tree[temp].sum_suffix = ag_tree[cur_tree_node].sum_suffix;

        ag_tree[temp1].sum_prefix2 = ag_tree[cur_tree_node].sum_prefix2;
        ag_tree[temp].sum_prefix2 = condition * ag_tree[temp1].sum_last2 + condition1 * ag_tree[cur_tree_node].sum_prefix2;
                
        ag_tree[temp1].sum_suffix2 = condition * ag_tree[temp].sum_first2 + condition2 * ag_tree[cur_tree_node].sum_suffix2;
        ag_tree[temp].sum_suffix2 = ag_tree[cur_tree_node].sum_suffix2;

        ag_tree[temp1].sum_prefix3 = ag_tree[cur_tree_node].sum_prefix3;
        ag_tree[temp].sum_prefix3 = condition * ag_tree[temp1].sum_last3 + condition1 * ag_tree[cur_tree_node].sum_prefix3;
                
        ag_tree[temp1].sum_suffix3 = condition * ag_tree[temp].sum_first3 + condition2 * ag_tree[cur_tree_node].sum_suffix3;
        ag_tree[temp].sum_suffix3 = ag_tree[cur_tree_node].sum_suffix3;
        
        ag_tree[temp1].complete2 = true;
        ag_tree[temp].complete2 = true;
        cur_tree_node = temp;
    }
    while(!ag_tree[thread_order].complete2) {
        ;
    };

    uint64_t key_first;
    uint64_t key_last;
    key_first = arr[index_thread_start].key;
    float sum_previous = ag_tree[thread_order].sum_prefix;
    key_last = arr[index_thread_end - 1].key;
    float sum_last = ag_tree[thread_order].sum_suffix;
    float sum_previous2 = ag_tree[thread_order].sum_prefix2;
    float sum_last2 = ag_tree[thread_order].sum_suffix2;
    float sum_previous3 = ag_tree[thread_order].sum_prefix3;
    float sum_last3 = ag_tree[thread_order].sum_suffix3;
    for (int i = index_thread_start; i < index_thread_end; i++) {
        condition = (arr[i].key == key_first);
        condition1 = (arr[i].key == key_last);
        arr[i].avg_pagerank += condition * sum_previous + condition1 * sum_last;
        arr[i].sum_adrevenue += condition * sum_previous2 + condition1 * sum_last2;
        count[i] += condition * sum_previous3 + condition1 * sum_last3;
        arr[i].avg_pagerank /= count[i];
    }

    return;

}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    int length = length1;
    (void)length2;
    int* count = calloc(length, sizeof(*count));
    bool condition;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct args_op2 args_op2_[number_threads];
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    ag_tree = calloc(2 * number_threads - 1, sizeof(*ag_tree));
    ag_tree[0].sum_prefix = 0;
    ag_tree[0].sum_suffix = 0;
    ag_tree[0].sum_prefix2 = 0;
    ag_tree[0].sum_suffix2 = 0;
    ag_tree[0].sum_prefix3 = 0;
    ag_tree[0].sum_suffix3 = 0;
    ag_tree[0].complete2 = true;
    init_time2();

    bitonic_sort(arr, true, 0, length, number_threads, false);

    if (number_threads == 1) {
        arr[0].avg_pagerank = arr[0].pagerank;
        arr[0].sum_adrevenue = arr[0].adrevenue;
        count[0] = 1;
        for (int i = 1; i < length; i++) {
            condition = (arr[i].key == arr[i - 1].key);
            arr[i].sum_adrevenue = condition * arr[i - 1].sum_adrevenue + arr[i].adrevenue;
            arr[i].avg_pagerank = condition * arr[i - 1].avg_pagerank + arr[i].pagerank;
            count[i] = 1 + condition * count[i - 1];
        }
        arr[length - 1].pagerank = arr[length - 1].avg_pagerank;
        for (int i = length - 2; 0 <= i; i--) {
            // printf("\n before %d th %ld %f %f %d", i, arr[i].key, arr[i].sum_adrevenue, arr[i].avg_pagerank, count[i]);
            condition = (arr[i].key == arr[i + 1].key);
            arr[i].pagerank = arr[i].avg_pagerank;
            arr[i].sum_adrevenue = condition * arr[i + 1].sum_adrevenue + !condition * arr[i].sum_adrevenue;
            arr[i].avg_pagerank = condition * arr[i + 1].pagerank + !condition * arr[i].avg_pagerank;
            count[i] = condition * count[i + 1] + !condition * count[i];
            arr[i].avg_pagerank = (arr[i].avg_pagerank / count[i]);
            // printf("\n after %d th %ld %f %f %d", i, arr[i].key, arr[i].sum_adrevenue, arr[i].avg_pagerank, count[i]);
        }
    } else {
        for (int i = 0; i < number_threads; i++) {
            idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);

            args_op2_[i].arr = arr;
            args_op2_[i].count = count;
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
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_aggregation_tree_1[i]);
        }
    }

    bitonic_sort(arr, true, 0, length, number_threads, true);

    get_time2(true);

    char *char_current = output_path;
    for (int i = 0; i < length; i++) {
        char ip[20];
        int len1_ip;
        sprintf(ip, "%ld", arr[i].key);
        len1_ip = my_len(ip);

        char revenue[20];
        int len2_revenue;
        sprintf(revenue, "%f", arr[i].sum_adrevenue);
        len2_revenue = my_len(revenue);

        char rank[20];
        int len3_rank;
        sprintf(rank, "%f", arr[i].avg_pagerank);
        len3_rank = my_len(rank);

        strncpy(char_current, ip, len1_ip);
        char_current += len1_ip; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, revenue, len2_revenue);
        char_current += len2_revenue; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, rank, len3_rank);
        char_current += len3_rank; char_current[0] = '\n'; char_current += 1;
    }
    char_current[0] = '\0';

    free(count);
    free(ag_tree);

    
    return ;
}