#ifndef DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H
#define DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H

#include <stddef.h>
#include "common/elem_t.h"
#include "common/ocalls.h"

struct tree_node_op2 {
    volatile char key_first[KEY_LENGTH];
    volatile char key_last[KEY_LENGTH];
    volatile char key_prefix[KEY_LENGTH];
    volatile bool table0_fisrt;
    volatile bool table0_last;
    volatile bool table0_prefix;
    volatile bool complete1;
    volatile bool complete2;
};

struct args_op2 {
    int index_thread_start;
    int index_thread_end;
    elem_t* arr;
    elem_t* arr_;
    int thread_order;
};

int scalable_oblivious_join_init(int nthreads);
int o_strcmp(char* str1, char* str2);
void scalable_oblivious_join_free();
void scalable_oblivious_join(elem_t *arr, int length1, int length2, char* output_path);

#endif /* distributed-sgx-sort/enclave/ojoin.h */
