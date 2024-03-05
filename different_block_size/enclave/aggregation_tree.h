#ifndef DISTRIBUTED_SGX_ENCLAVE_AGGREGATION_TREE_H
#define DISTRIBUTED_SGX_ENCLAVE_AGGREGATION_TREE_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"


void aggregation_tree_init(ojoin_int_type nthreads);

void aggregation_tree_free();

void aggregation_tree_m_1_downward(void *voidargs);

void aggregation_tree_j_order(elem_t *arr, size_t length, int n_threads);

void aggregation_tree_i(int *index_target, int *index_target2, elem_t *arr1, elem_t *arr2, int length1, int length2, int number_threads);

/*
void aggregation_tree_m_2_downward(void *voidargs);

void aggregation_tree_m_3_upward(void *voidargs);

void aggregation_tree_m_4_upward(void *voidargs);
*/

void aggregation_tree_m(elem_t *arr, int length, int number_threads);

void aggregation_tree_dup_1_downward(void *voidargs);

void aggregation_tree_dup_2_downward(void *voidargs);

void aggregation_tree_add_idx_start_1_downward(void *voidargs);

void aggregation_tree_add_idx_start_2_downward(void *voidargs);

void aggregation_tree_dup(elem_t *arr, ojoin_int_type  length_total, ojoin_int_type  nthreads_total);

void aggregation_tree_add_idx_start(ojoin_int_type  *index_duplicate_start, ojoin_int_type  *m0, ojoin_int_type  idx_start, ojoin_int_type  length_total, ojoin_int_type  nthreads_total);

#endif /* distributed-sgx-sort/enclave/aggregation_tree.h */