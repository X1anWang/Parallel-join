#ifndef DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_DISTRIBUTE_H
#define DISTRIBUTED_SGX_ENCLAVE_OBLIVIOUS_DISTRIBUTE_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

struct oblivious_distribute_inner_2power_parallel_args {
    ojoin_int_type *buf;
    ojoin_int_type *index_target;
    ojoin_int_type index_start_cur;
    ojoin_int_type offset;
    ojoin_int_type N;
    ojoin_int_type nthreads;
};

struct oswap_range2_args {
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    ojoin_int_type *buf1, *buf2;
    bool swap_flag;
};

struct oblivious_distribute_inner_2power_parallel_args_elem {
    elem_t *buf;
    ojoin_int_type *index_target;
    ojoin_int_type index_start_cur;
    ojoin_int_type offset;
    ojoin_int_type N;
    ojoin_int_type nthreads;
};

struct oswap_range2_args_elem {
    ojoin_int_type swap_start, swap_end;
    ojoin_int_type offset_m1_mod;
    elem_t *buf1, *buf2;
    bool swap_flag;
};

void oswap_range2(void *voidargs);
void oswap_range2_elem(void *voidargs);
void oblivious_distribute_inner_2power_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type offset, ojoin_int_type N);
void oblivious_distribute_inner_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type index_start_cur, ojoin_int_type N);
void oblivious_distribute_inner_2power_parallel_elem(void *args_);
void oblivious_distribute_elem(elem_t *buf, ojoin_int_type *index_target, ojoin_int_type length, ojoin_int_type number_threads);

#endif /* distributed-sgx-sort/enclave/oblivious_compact.h */