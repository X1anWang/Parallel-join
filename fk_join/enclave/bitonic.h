#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"

struct bitonic_merge_args_1 {
    bool ascend;
    long long lo;
    long long hi;
    long long number_threads;
};
struct bitonic_merge_args_2 {
    bool ascend;
    long long a;
    long long b;
    long long c;
};
void bitonic_sort(elem_t *arr_, bool ascend , long long lo, long long hi, long long num_threads, bool D2enable);

#endif /* distributed-sgx-sort/enclave/bitonic.h */
