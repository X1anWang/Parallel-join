#ifndef DISTRIBUTED_SGX_ENCLAVE_ALIGNED_EXPAND_H
#define DISTRIBUTED_SGX_ENCLAVE_ALIGNED_EXPAND_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

void parallel_execute_0(void *args_);

void parallel_execute_1(void *args_);

void aligned_expand_core(void *args_);

int aligned_expand_main(void *args_);

void aligned_expand(elem_t *arr2, uint64_t length, uint64_t number_threads, uint64_t *m0, uint64_t *m1);

#endif /* distributed-sgx-sort/enclave/aligned_expand.h */