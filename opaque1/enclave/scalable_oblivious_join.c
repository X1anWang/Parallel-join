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
#include "enclave/bitonic.h"
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
    (void)output_path;
    printf("\n Start BDB operator - 1\n");
    init_time();

    for (int i = 0; i < length1; i++) {
        arr[i].key = 1 - (88 < arr[i].key);
    }

    bitonic_sort_(arr, true, 0, length1, 1, false);

    get_time(true);

    return;
}