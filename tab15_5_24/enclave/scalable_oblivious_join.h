#ifndef DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H
#define DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H

#include <stddef.h>
#include "common/elem_t.h"
#include "common/ocalls.h"

long long scalable_oblivious_join_init(long long nthreads);

void scalable_oblivious_join_free();

void scalable_oblivious_join(elem_t *arr, long long length1, long long length2, char* output_path);

#endif /* distributed-sgx-sort/enclave/ojoin.h */
