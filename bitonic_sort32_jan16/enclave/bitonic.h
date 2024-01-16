#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_BITONIC_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"

int bitonic_init(void);
void bitonic_free(void);
void bitonic_sort(elem_t *arr, size_t length, size_t num_threads);

#endif /* distributed-sgx-sort/enclave/bitonic.h */
