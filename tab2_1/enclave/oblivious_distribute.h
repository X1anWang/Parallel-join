#ifndef DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_DISTRIBUTE_H
#define DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_DISTRIBUTE_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

void oswap_range2(void *voidargs);

void oblivious_distribute_inner_2power(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type offset, ojoin_int_type N);

void oblivious_distribute_inner(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N);

void oblivious_distribute_inner_2power_parallel(void *args_);

void oblivious_distribute_inner_parallel(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N, ojoin_int_type nthreads);

void oblivious_distribute(ojoin_int_type *buf, ojoin_int_type *index_target, ojoin_int_type length, ojoin_int_type number_threads);

void oswap_range2_elem(void *voidargs);

void oblivious_distribute_inner_2power_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type offset, ojoin_int_type N);

void oblivious_distribute_inner_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N);

void oblivious_distribute_inner_2power_parallel_elem(void *args_);

void oblivious_distribute_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type length, ojoin_int_type number_threads);

#endif /* distributed-sgx-sort/enclave/oblivious_compact.h */