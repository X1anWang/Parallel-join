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
//#include "enclave/bucket.h"
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

void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path){
    control_bit = calloc(length1, sizeof(*control_bit));
    (void)length2;
    int result_length = 0;
    printf("\n Start BDB operator - 3 step 1\n");
    init_time();

    for (int i = 0; i < length1; i++) {
        control_bit[i] = (19800101 <= arr[i].key) && (arr[i].key <= 20000101);
        result_length += control_bit[i];
    }

    oblivious_compact_elem(arr, control_bit, length1, 1, number_threads);
    get_time(true);

    char *char_current = output_path;
    //printf("\nresult length is:%d\n",length_result);
    for (int i = 0; i < result_length; i++) {
        int data_len1 = my_len(arr[i].data);
        
        strncpy(char_current, arr[i].data, data_len1);
        char_current += data_len1; char_current[0] = '\n'; char_current += 1;

    }
    char_current[0] = '\0';

    return;
}