#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"

struct bitonic_sort_new_args {
    bool ascend;
    int lo;
    int hi;
    int number_threads;
};

void bitonic_sort_(elem_t *arr_, bool ascend , int lo, int hi, int num_threads, bool D2enable);

#endif /* distributed-sgx-sort/enclave/bitonic.h */
