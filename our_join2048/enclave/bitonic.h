#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"

int bitonic_init(void);
void bitonic_free(void);
void bitonic_sort(elem_t *arr, size_t length, size_t num_threads, bool D2enable);
void bitonic_sort_(elem_t *arr_, bool ascend , int lo, int hi, int num_threads, bool D2enable);

#endif /* distributed-sgx-sort/enclave/bitonic.h */
