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
#include "enclave/oblivious_distribute.h"
#include "enclave/oblivious_compact.h"
#include "enclave/bucket.h"
//#include "enclave/nonoblivious.h"

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
    //aggregation_tree_init(number_threads);

    
    return 0;

}

void scalable_oblivious_join_free() {
    return;
    //aggregation_tree_free();
    //aligned_expand_free();
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
    control_bit = calloc(length1, sizeof(*control_bit));
    (void)length2;
    (void)output_path;
    int length_thread = length1 / number_threads;
    int length_extra = length1 % number_threads;
    struct soj_scan_1_args soj_scan_1_args_[number_threads];
    int index_start_thread[number_threads + 1];
    index_start_thread[0] = 0;
    elem_t * result = calloc(length1, sizeof(*result));
    struct thread_work soj_scan_1_[number_threads - 1];
    //int o = 0;
    bucket_init();
    printf("\n Start BDB our offline operator - 1\n");
    init_time();


    int ret = bucket_sort(arr, length1, number_threads);

    get_time(true);


    if (number_threads == 1) {

        for (int i = 0; i < length1; i++) {
            control_bit[i] = (88 < arr[i].key);
        }
    }
    else {
        // Step(3): Break table according to their tid (0 or 1) by parallel NlogN oblivious compaction
        for (int i = 0; i < number_threads; i++) {
            index_start_thread[i + 1] = index_start_thread[i] + length_thread + (i < length_extra);
        
            soj_scan_1_args_[i].idx_st = index_start_thread[i];
            soj_scan_1_args_[i].idx_ed = index_start_thread[i + 1];
            soj_scan_1_args_[i].control_bit = control_bit;
            soj_scan_1_args_[i].arr1 = arr;

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
    };


    oblivious_compact_elem(arr, control_bit, length1, 1, number_threads);
    get_time(true);
    (void) ret;
    bucket_free();

    return;
}