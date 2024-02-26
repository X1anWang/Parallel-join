#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_ORSHUFFLE_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_ORSHUFFLE_H

#include <stddef.h>
#include "common/elem_t.h"

int orshuffle_init(void);
void orshuffle_free(void);
int orshuffle_sort(elem_t *arr, size_t length, size_t num_threads);

#endif
