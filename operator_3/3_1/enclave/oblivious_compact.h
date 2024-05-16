#ifndef DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_COMPACT_H
#define DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_COMPACT_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

void oswap_range_elem(void *voidargs);
void oblivious_compact_inner_elem(elem_t *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count);
void oblivious_compact_inner_2power_parallel_elem(void *args_);
void oblivious_compact_inner_parallel_elem(elem_t *buf, ojoin_int_type N, ojoin_int_type block_size, bool *selected, ojoin_int_type *selected_count, ojoin_int_type nthreads);
int oblivious_compact_elem(elem_t *buf, bool *selected, ojoin_int_type length, ojoin_int_type block_size, ojoin_int_type number_threads);

#endif /* distributed-sgx-sort/enclave/oblivious_compact.h */