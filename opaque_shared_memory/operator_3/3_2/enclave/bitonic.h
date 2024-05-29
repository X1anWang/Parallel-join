#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"

struct bitonic_merge_args_1 {
    bool ascend;
    int lo;
    int hi;
    int number_threads;
};
struct bitonic_merge_args_2 {
    bool ascend;
    int a;
    int b;
    int c;
};
void bitonic_sort(elem_t *arr_, bool ascend , int lo, int hi, int num_threads, bool dim2nd);

#endif /* distributed-sgx-sort/enclave/bitonic.h */
