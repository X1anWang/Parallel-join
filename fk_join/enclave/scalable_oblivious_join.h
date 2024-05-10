#ifndef DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H
#define DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H

#include <stddef.h>
#include "common/elem_t.h"
#include "common/ocalls.h"

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

struct args_op2 {
    long long index_thread_start;
    long long index_thread_end;
    elem_t* arr;
    elem_t* arr_;
    long long thread_order;
};

int scalable_oblivious_join_init(int nthreads);
long long o_strcmp(char* str1, char* str2);
void scalable_oblivious_join_free();

void scalable_oblivious_join(elem_t *arr, long long length1, long long length2, char* output_path);

#endif /* distributed-sgx-sort/enclave/ojoin.h */
