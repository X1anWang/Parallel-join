#ifndef DISTRIBUTED_SGX_ENCLAVE_ALIGNED_EXPAND_H
#define DISTRIBUTED_SGX_ENCLAVE_ALIGNED_EXPAND_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

void aligned_expand_init(ojoin_int_type length, ojoin_int_type nthreads);

void aligned_expand_free();

void aligned_expand_main(void *voidargs);

void aligned_expand(elem_t *arr, ojoin_int_type *m0, ojoin_int_type *m1, ojoin_int_type length_result, ojoin_int_type number_threads);

#endif /* distributed-sgx-sort/enclave/aligned_expand.h */