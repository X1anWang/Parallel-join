#ifndef DISTRIBUTED_SGX_ENCLAVE_AGGREGATION_TREE_H
#define DISTRIBUTED_SGX_ENCLAVE_AGGREGATION_TREE_H

#include <stdbool.h>
#include <stddef.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/util.h"
#include "common/ocalls.h"

struct tree_node_i {
    volatile int i;
    volatile int prev_i;
    volatile int i2;
    volatile int prev_i2;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_j {
    volatile int j;
    volatile int key;
    volatile int prev_j;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_m {
    volatile int key_first;
    volatile int key_last;
    volatile int m0_first;
    volatile int m0_last;
    volatile int m0_prefix;
    volatile int m0_suffix;
    volatile int m1_first;
    volatile int m1_last;
    volatile int m1_prefix;
    volatile int m1_suffix;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_dup {
    volatile int k_p;
    volatile char d_p[DATA_LENGTH];
    volatile bool has_value_p;
    volatile int k_l;
    volatile char d_l[DATA_LENGTH];
    volatile bool has_value_l;
    volatile bool complete1;
    volatile bool complete2;
};

struct aggregation_tree_m_args {
    elem_t *arr;
    int *m0;
    int *m1;
    int idx_start;
    int idx_end;
    int order_thread;
};

struct aggregation_tree_j_args {
    elem_t *arr;
    int *j_index;
    int idx_start;
    int idx_end;
    int order_thread;
};

struct aggregation_tree_i_args {
    elem_t *arr1;
    elem_t *arr2;
    int idx_start;
    int idx_end;
    int idx_start2;
    int idx_end2;
    int order_thread;
    int *index_target;
    int *index_target2;
    int sum0;
    int sum1;
};

struct aggregation_tree_dup_args {
    elem_t *arr;
    int idx_start;
    int idx_end;
    int order_thread;
};

void aggregation_tree_init(ojoin_int_type nthreads);
void aggregation_tree_free();
void aggregation_tree_m_1_downward(void *voidargs);
void aggregation_tree_j_order(elem_t *arr, size_t length, int n_threads);
void aggregation_tree_i(int *index_target, int *index_target2, elem_t *arr1, elem_t *arr2, int length1, int length2, int number_threads);
void aggregation_tree_m(elem_t *arr, int length, int number_threads);
void aggregation_tree_dup_1_downward(void *voidargs);
void aggregation_tree_dup_2_downward(void *voidargs);
void aggregation_tree_add_idx_start_1_downward(void *voidargs);
void aggregation_tree_add_idx_start_2_downward(void *voidargs);
void aggregation_tree_dup(elem_t *arr, ojoin_int_type  length_total, ojoin_int_type  nthreads_total);
void aggregation_tree_add_idx_start(ojoin_int_type  *index_duplicate_start, ojoin_int_type  *m0, ojoin_int_type  idx_start, ojoin_int_type  length_total, ojoin_int_type  nthreads_total);

#endif /* distributed-sgx-sort/enclave/aggregation_tree.h */