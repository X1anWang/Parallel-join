#ifndef DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H
#define DISTRIBUTED_SGX_ENCLAVE_SCALABLE_H

#include <stddef.h>
#include "common/elem_t.h"
#include "common/ocalls.h"

int scalable_oblivious_join_init(int nthreads);
long long o_strcmp(char* str1, char* str2);
void scalable_oblivious_join_free();

void scalable_oblivious_join(elem_t *arr, long long length1, long long length2, char* output_path);

#endif /* distributed-sgx-sort/enclave/ojoin.h */
