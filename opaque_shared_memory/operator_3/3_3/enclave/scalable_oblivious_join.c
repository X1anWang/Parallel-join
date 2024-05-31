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

void o_strcp_(volatile char* str1, volatile char* str2) {
    for (int i = 0; i < 16; i++) {
        str1[i] = str2[i];
    }
}

struct args_op {
    int index_thread_start;
    int index_thread_end;
    int *count;
    elem_t* arr;
    uint64_t key_first;
    uint64_t key_last;

    float sum_previous;
    float sum_last;
    float sum_previous2;
    float sum_last2;
    float sum_previous3;
    float sum_last3;
};

void parallel_scan_1(void *voidargs) {
    struct args_op *args = (struct args_op*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    int* count = args->count;
    elem_t* arr = args->arr;
    //int thread_order = args->thread_order;
    //int cur_tree_node = thread_order;
    bool condition;
    //bool condition1;
    //bool condition2;

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

}

void parallel_scan_2(void *voidargs) {
    struct args_op *args = (struct args_op*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    int* count = args->count;
    elem_t* arr = args->arr;
    //int thread_order = args->thread_order;
    //int cur_tree_node = thread_order;
    bool condition;
    bool condition1;
    //bool condition2;
    uint64_t key_first = args->key_first;
    uint64_t key_last = args->key_last;

    float sum_previous = args->sum_previous;
    float sum_last = args->sum_last;
    float sum_previous2 = args->sum_previous2;
    float sum_last2 = args->sum_last2;
    float sum_previous3 = args->sum_previous3;
    float sum_last3 = args->sum_last3;

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
    struct args_op args_op_[number_threads];
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    struct thread_work multi_thread_aggregation_tree_2[number_threads - 1];
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

            args_op_[i].arr = arr;
            args_op_[i].count = count;
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
            args_op_[i].sum_previous = (arr[(args_op_[i - 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_start)].key) * arr[(args_op_[i - 1].index_thread_end - 1)].avg_pagerank + (arr[(args_op_[i - 1].index_thread_start)].key == arr[(args_op_[i].index_thread_start)].key) * args_op_[i - 1].sum_previous;
            args_op_[i].sum_previous2 = (arr[(args_op_[i - 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_start)].key) * arr[(args_op_[i - 1].index_thread_end - 1)].sum_adrevenue + (arr[(args_op_[i - 1].index_thread_start)].key == arr[(args_op_[i].index_thread_start)].key) * args_op_[i - 1].sum_previous2;
            args_op_[i].sum_previous3 = (arr[(args_op_[i - 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_start)].key) * count[(args_op_[i - 1].index_thread_end - 1)] + (arr[(args_op_[i - 1].index_thread_start)].key == arr[(args_op_[i].index_thread_start)].key) * args_op_[i - 1].sum_previous3;
            //args_op_[i].sum_prefix = (arr[(args_op_[i - 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_start)].key) * sum[(args_op_[i - 1].index_thread_end - 1)] + (arr[(args_op_[i - 1].index_thread_start)].key == arr[(args_op_[i].index_thread_start)].key) * args_op_[i - 1].sum_prefix;
        }
        for (int i = number_threads - 2; 0 <= i; i--) {
            args_op_[i].key_last = arr[args_op_[i].index_thread_end].key;
            args_op_[i].sum_last = (arr[(args_op_[i + 1].index_thread_start)].key == arr[(args_op_[i].index_thread_end - 1)].key) * arr[args_op_[i + 1].index_thread_start].avg_pagerank + (arr[(args_op_[i + 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_end - 1)].key) * args_op_[i + 1].sum_last;
            args_op_[i].sum_last2 = (arr[(args_op_[i + 1].index_thread_start)].key == arr[(args_op_[i].index_thread_end - 1)].key) * arr[args_op_[i + 1].index_thread_start].avg_pagerank + (arr[(args_op_[i + 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_end - 1)].key) * args_op_[i + 1].sum_last2;
            args_op_[i].sum_last3 = (arr[(args_op_[i + 1].index_thread_start)].key == arr[(args_op_[i].index_thread_end - 1)].key) * arr[args_op_[i + 1].index_thread_start].avg_pagerank + (arr[(args_op_[i + 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_end - 1)].key) * args_op_[i + 1].sum_last3;
            //args_op_[i].sum_suffix = (arr[(args_op_[i + 1].index_thread_start)].key == arr[(args_op_[i].index_thread_end - 1)].key) * sum[args_op_[i + 1].index_thread_start] + (arr[(args_op_[i + 1].index_thread_end - 1)].key == arr[(args_op_[i].index_thread_end - 1)].key) * args_op_[i + 1].sum_suffix;
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

    return ;
}