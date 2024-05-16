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
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"
#include "enclave/bitonic.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif



static int number_threads;
static bool *control_bit;

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


struct soj_scan_1_args {
    int idx_st;
    int idx_ed;
    bool* control_bit;
    elem_t *arr1;
};


void soj_scan_1(void *voidargs) {
    struct soj_scan_1_args *args = (struct soj_scan_1_args*)voidargs;
    int index_start = args->idx_st;
    int index_end = args->idx_ed;
    bool* cb1 = args->control_bit;
    elem_t *arr1 = args->arr1;

    for (int i = index_start; i < index_end; i++) {
        cb1[i] = (88 < arr1[i].key);
    }

    return;
}


void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    printf("\n(5) Entered operator_1 function");
    printf("\n(6) Input length: %d", length1);
    printf("\n(7) key and value size is: %ld and %d (Bytes)", sizeof(arr[0].key), DATA_LENGTH);
    printf("\n(8) Number of threads: %d", number_threads);
    control_bit = calloc(length1, sizeof(*control_bit));
    (void)length2;
    int length_result = 0;
    printf("\n(9) Start Opaque operator_1 now, we do: 1) parallel scan, 2) oblivious compaction\n");
    init_time2();
    init_time();

    for (int i = 0; i < length1; i++) {
        arr[i].key = 1 - (88 < arr[i].true_key);
        length_result += (88 < arr[i].true_key);
    }
    get_time(true);

    bitonic_sort(arr, true, 0, length1, 1, false);
    get_time(true);

    printf("\n(10) operator_1 completed, total time:");
    get_time2(true);
    printf("\n(11) Output length is: %d", length_result);
    printf("\n(12) Now write out output result");

    char *char_current = output_path;
    for (int i = 0; i < length_result; i++) {
        int key1 = arr[i].true_key;

        char string_key1[10];
        int str1_len;
        itoa(key1, string_key1, &str1_len);
        int data_len1 = my_len(arr[i].data);
        
        strncpy(char_current, string_key1, str1_len);
        char_current += str1_len; char_current[0] = ' '; char_current += 1;
        strncpy(char_current, arr[i].data, data_len1);
        char_current += data_len1; char_current[0] = '\n'; char_current += 1;
    }
    char_current[0] = '\0';

    return;
}