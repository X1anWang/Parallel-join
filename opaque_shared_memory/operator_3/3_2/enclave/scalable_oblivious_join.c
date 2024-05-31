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
#include "enclave/oblivious_compact.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif

bool* control_bit;

#define MAX_DUMMY_ORDER 2147483640

static int number_threads;
elem_t arr_thread_last[100];
int res_thread[100];
//volatile bool ready[100];

void reverse(char *s) {
    int i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

int my_len_key(char *key) {
    int i = 0;

    while ((key[i] != '\0') && (i < KEY_LENGTH)) i++;
    
    return i;
}

int my_len_key_2(char *key) {
    int i = 0;
    bool flag = true;

    while ((key[i] != '\0') && (i < KEY_LENGTH)) {
        flag = (key[i] != '\0') && flag;
        i += flag;
    }
    
    return i;
}

int my_len(char *data) {
    int i = 0;

    while ((data[i] != '\0') && (i < DATA_LENGTH)) i++;
    
    return i;
}

int o_strcmp(char* str1, char* str2) {
    bool flag = false;
    int result = 0;

    for (int i = 0; i < KEY_LENGTH; i++) {
        result = !flag * (-1 * (str1[i] < str2[i]) + 1 * (str1[i] > str2[i])) + flag * result;
        flag = (!flag && ((str1[i] < str2[i]) || (str1[i] > str2[i]))) || flag;
    }

    result = (my_len_key_2(str1) == my_len_key_2(str2)) * result - (my_len_key_2(str1) < my_len_key_2(str2)) + (my_len_key_2(str1) > my_len_key_2(str2));

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
    return 0;
}

void scalable_oblivious_join_free() {
    return;
}

void aggregation_tree_op2(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    elem_t* arr = args->arr;
    elem_t* arr_ = args->arr_;
    int thread_order = args->thread_order;
    bool condition;
    bool condition2;
    elem_t *arr_temp = calloc(1, sizeof(*arr_temp));
    arr_temp[0].table_0 = false;

    condition = arr[index_thread_start].table_0;
    o_memcpy(arr_temp, arr + index_thread_start, sizeof(*arr), condition);
    for (int i = index_thread_start + 1; i < index_thread_end; i++) {
        condition = arr[i].table_0;
        condition2 = (arr[i].key == arr_temp[0].key);
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), ((!condition) && condition2));
        o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
        // res_thread[thread_order] += ((!condition)&&condition2);
    }

    o_memcpy(arr_thread_last + thread_order, arr_temp, sizeof(*arr_temp), true);

    free(arr_temp);
    return;
}

void aggregation_tree_op3(void *voidargs) {
    struct args_op2 *args = (struct args_op2*) voidargs;
    int index_thread_start = args->index_thread_start;
    int index_thread_end = args->index_thread_end;
    elem_t* arr2 = args->arr;
    elem_t* arr_ = args->arr_;
    int thread_order = args->thread_order;
    int count = 0;
    bool condition;
    bool condition2;
    elem_t *arr_temp = calloc(1, sizeof(*arr_temp));

    if (thread_order == 0) {
        for (int i = index_thread_start + 1; i < index_thread_end; i++) {
            condition = !arr2[i].table_0 && arr_[i].table_0;
            arr2[i].dummy_order = condition * (count++) + !condition * MAX_DUMMY_ORDER;
            arr_[i].dummy_order = arr2[i].dummy_order;
            res_thread[0] = res_thread[0] + (int)condition;
        }

        return;
    }

    /*
    while(!ready[thread_order - 1]) {
        ;
    }
    */
    
    //o_memcpy(arr_thread_last + thread_order, arr_thread_last + thread_order - 1, sizeof(*arr_), true);
    o_memcpy(arr_temp, arr_thread_last + thread_order - 1, sizeof(*arr_), true);
    for (int i = index_thread_start; i < index_thread_end; i++) {
        condition = !arr2[i].table_0 && !arr_[i].table_0;
        condition2 = (arr2[i].key == arr_temp[0].key);
        o_memcpy(arr_ + i, arr_temp, sizeof(*arr_temp), (condition && condition2));
        condition = !arr2[i].table_0 && arr_[i].table_0;
        arr2[i].dummy_order = condition * (index_thread_start + count++) + !condition * MAX_DUMMY_ORDER;
        arr_[i].dummy_order = arr2[i].dummy_order;
        res_thread[thread_order] = res_thread[thread_order] + (int)condition;
    }

    //ready[thread_order] = true;

    free(arr_temp);

    return;
}

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    int length = length1 + length2;
    elem_t* arr_ = calloc(length, sizeof(*arr_));
    for (int i = 0; i < length; i++) {
        arr_[i].table_0 = false;
        arr_[i].dummy_order = MAX_DUMMY_ORDER;
        arr[i].dummy_order = MAX_DUMMY_ORDER;
    }
    bool condition;
    bool condition2;
    bool condition3;
    int length_thread = length / number_threads;
    int length_extra = length % number_threads;
    struct args_op2 args_op2_[number_threads];
    int idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_1[number_threads - 1];
    struct thread_work multi_thread_2[number_threads - 1];
    elem_t* arr_temp = calloc(1, sizeof(*arr_temp));
    control_bit = calloc(length, sizeof(*control_bit));
    int length_result = 0;
    int count = 0;
    //for (int i = 0; i < num_threads; i++) ready[i] = false;
    for (int i = 0; i < number_threads; i++) res_thread[i] = 0;
    init_time2();

    bitonic_sort(arr, true, 0, length, number_threads, false);

    if (number_threads == 1) {
        condition = arr[0].table_0;
        o_memcpy(arr_temp, arr, sizeof(*arr), condition);
        for (int i = 1; i < length; i++) {
            condition = arr[i].table_0;
            condition2 = (arr[i].key == arr_temp[0].key);
            condition3 = ((!condition) && condition2);
            o_memcpy(arr_ + i, arr_temp, sizeof(*arr_), condition3);
            o_memcpy(arr_temp, arr + i, sizeof(*arr), condition);
            arr[i].dummy_order = condition3 * (count++) + !condition3 * MAX_DUMMY_ORDER;
            arr_[i].dummy_order = arr[i].dummy_order;
            length_result = length_result + (int)condition3;
            /*
            if(condition3) {
                printf("\n %d th", i);
            }
            */
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
                multi_thread_1[i].type = THREAD_WORK_SINGLE;
                multi_thread_1[i].single.func = aggregation_tree_op2;
                multi_thread_1[i].single.arg = &args_op2_[i];
                thread_work_push(&multi_thread_1[i]);
            }
        }
        aggregation_tree_op2(&args_op2_[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_1[i]);
        }
        for (int i = 0; i < number_threads - 1; i++) {
            multi_thread_2[i].type = THREAD_WORK_SINGLE;
            multi_thread_2[i].single.func = aggregation_tree_op3;
            multi_thread_2[i].single.arg = &args_op2_[i];
            thread_work_push(&multi_thread_2[i]);
        }
        aggregation_tree_op3(&args_op2_[number_threads - 1]);
        for (int i = 0; i < number_threads - 1; i++) {
            thread_wait(&multi_thread_2[i]);
        }
        for (int i = 0 ; i < number_threads; i++) {
            length_result += res_thread[i];
        }
    }

    bitonic_sort(arr, true, 0, length, number_threads, true);
    bitonic_sort(arr_, true, 0, length, number_threads, true);
    
    get_time2(true);

    char *char_current = output_path;
    for (int i = 0; i < length_result; i++) {
        int data_len1 = my_len(arr[i].data);
        int data_len2 = my_len(arr_[i].data);

        strncpy(char_current, arr_[i].data, data_len2);
        char_current += data_len2; char_current[0] = ' '; char_current += 1;

        strncpy(char_current, arr[i].data, data_len1);
        char_current += data_len1; char_current[0] = '\n'; char_current += 1;
    }
    char_current[0] = '\0';

    free(arr_temp);
    free(arr_);
    free(control_bit);
    
    return;
}