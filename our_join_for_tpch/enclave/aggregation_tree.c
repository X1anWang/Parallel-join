#include "enclave/aggregation_tree.h"
#include <errno.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <threads.h>
#include <liboblivious/primitives.h>
#include "common/defs.h"
#include "common/elem_t.h"
#include "common/error.h"
#include "common/util.h"
#include "enclave/mpi_tls.h"
#include "enclave/parallel_enc.h"
#include "enclave/threading.h"

#ifndef DISTRIBUTED_SGX_SORT_HOSTONLY
#include <openenclave/enclave.h>
#include "enclave/parallel_t.h"
#endif




struct tree_node_i {
    volatile long long i;
    volatile long long prev_i;
    volatile long long i2;
    volatile long long prev_i2;
    volatile bool complete1;
    volatile bool complete2;
};

static struct tree_node_i *tree_node_4;

struct tree_node_j {
    volatile long long j;
    volatile long long key;
    volatile long long prev_j;
    volatile bool complete1;
    volatile bool complete2;
};

static struct tree_node_j *tree_node_3;














struct tree_node_m {
    volatile long long key_first;
    volatile long long key_last;
    volatile long long m0_first;
    volatile long long m0_last;
    volatile long long m0_prefix;
    volatile long long m0_suffix;
    volatile long long m1_first;
    volatile long long m1_last;
    volatile long long m1_prefix;
    volatile long long m1_suffix;
    volatile bool complete1;
    volatile bool complete2;
};

struct tree_node_dup {
    /*
    long long key_first;
    long long key_last;
    long long m0_first;
    long long m0_last;
    long long m0_prefix;
    long long m0_suffix;
    long long m1_first;
    long long m1_last;
    long long m1_prefix;
    long long m1_suffix;
    

    volatile long long prev_elem;
    volatile long long first_elem;
    volatile long long last_elem;
    elem_t prev_element;
    elem_t last_element;
    */
    volatile long long k_p;
    volatile char d_p[DATA_LENGTH];
    volatile bool has_value_p;

    volatile long long k_l;
    volatile char d_l[DATA_LENGTH];
    volatile bool has_value_l;

    volatile bool complete1;
    volatile bool complete2;
};

long long tree_node_idx_48[48] = {63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62};
long long tree_node_idx_6[6] = {7, 8, 9, 10, 5, 6};

static struct tree_node_m *tree_node_1;
static struct tree_node_dup *tree_node_2;


struct aggregation_tree_m_args {
    elem_t *arr;
    long long *m0;
    long long *m1;
    long long idx_start;
    long long idx_end;
    long long order_thread;
};

void aggregation_tree_init(long long nthreads) {
    tree_node_1 = calloc(2 * nthreads - 1, sizeof(*tree_node_1));
    //tree_node_2 = calloc(2 * nthreads - 1, sizeof(*tree_node_2));
    tree_node_3 = calloc(2 * nthreads - 1, sizeof(*tree_node_3));
    tree_node_4 = calloc(2 * nthreads - 1, sizeof(*tree_node_4));
    tree_node_1[0].complete2 = true;
    //tree_node_2[0].complete2 = true;
    tree_node_3[0].complete2 = true;
    tree_node_4[0].complete2 = true;

    tree_node_1[0].m0_prefix = 0;
    tree_node_1[0].m0_suffix = 0;
    tree_node_1[0].m1_prefix = 0;
    tree_node_1[0].m1_suffix = 0;

    /*
    for (long long i = 0; i < 2 * nthreads - 1; i++) {
        tree_node_2[i].prev_elem = calloc(1, sizeof(*tree_node_2[i].prev_elem));
        tree_node_2[i].first_elem = calloc(1, sizeof(*tree_node_2[i].first_elem));
        tree_node_2[i].last_elem = calloc(1, sizeof(*tree_node_2[i].last_elem));
    }
    */

    //tree_node_2[0].prev_elem = calloc(1, sizeof(*tree_node_2[0].prev_elem));
    //elem_t* vacant = calloc(1, sizeof(*vacant));
    //vacant->has_value = false;
    //vacant->key = -1;
    //vacant->data[0] = 65;

    //tree_node_2[0].prev_elem = vacant;

    tree_node_3[0].j = 0;
    tree_node_3[0].key = -1;
    tree_node_3[0].prev_j = 0;

    tree_node_4[0].i = 0;
    tree_node_4[0].i2 = 0;
    tree_node_4[0].prev_i = 0;
    tree_node_4[0].prev_i2 = 0;
    
    return ;
}

void aggregation_tree_free() {
    free(tree_node_1);
    //free(tree_node_2);
    free(tree_node_3);
    free(tree_node_4);

    return ;
}

void aggregation_tree_m_1_downward(void *voidargs) {
    struct aggregation_tree_m_args *args = (struct aggregation_tree_m_args*)voidargs;
    elem_t *arr = args->arr;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;
    long long order_thread = args->order_thread;
    long long cur_tree_node = order_thread;
    bool condition;
    bool condition1;
    bool condition2;

    arr[idx_start].m0 = arr[idx_start].table_0;
    arr[idx_start].m1 = !arr[idx_start].table_0;
    for (long long i = idx_start + 1; i < idx_end; i++) {
        condition = (arr[i].key == arr[i - 1].key);
        arr[i].m0 = (arr[i].table_0 && condition) * (arr[i - 1].m0 + 1) + (!arr[i].table_0 && condition) * (arr[i - 1].m0) + (arr[i].table_0 && !condition);
        arr[i].m1 = (arr[i].table_0 && condition) * (arr[i - 1].m1) + (!arr[i].table_0 && condition) * (arr[i - 1].m1 + 1) + (!arr[i].table_0 && !condition);
    }
    for (long long i = idx_end - 1; idx_start < i; i--) {
        condition = (arr[i - 1].key == arr[i].key);
        arr[i - 1].m0 = condition * arr[i].m0 + !condition * arr[i - 1].m0;
        arr[i - 1].m1 = condition * arr[i].m1 + !condition * arr[i - 1].m1;
    }

    tree_node_1[cur_tree_node].key_first = arr[idx_start].key;
    tree_node_1[cur_tree_node].key_last = arr[idx_end - 1].key;
    tree_node_1[cur_tree_node].m0_first = arr[idx_start].m0;
    tree_node_1[cur_tree_node].m0_last = arr[idx_end - 1].m0;
    tree_node_1[cur_tree_node].m1_first = arr[idx_start].m1;
    tree_node_1[cur_tree_node].m1_last = arr[idx_end - 1].m1;
    tree_node_1[cur_tree_node].complete1 = true;
    
    long long temp; // aggregation tree start
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2;
        while(!tree_node_1[cur_tree_node - 1].complete1) {
            ;
        };
        condition = tree_node_1[cur_tree_node - 1].key_last == tree_node_1[cur_tree_node].key_last;
        condition1 = tree_node_1[cur_tree_node - 1].key_first == tree_node_1[cur_tree_node].key_first;
        tree_node_1[temp].key_first = tree_node_1[cur_tree_node - 1].key_first;
        tree_node_1[temp].key_last = tree_node_1[cur_tree_node].key_last;
        tree_node_1[temp].m0_last = condition * tree_node_1[cur_tree_node - 1].m0_last + tree_node_1[cur_tree_node].m0_last;
        tree_node_1[temp].m1_last = condition * tree_node_1[cur_tree_node - 1].m1_last + tree_node_1[cur_tree_node].m1_last;
        tree_node_1[temp].m0_first = condition1 * tree_node_1[cur_tree_node].m0_first + tree_node_1[cur_tree_node - 1].m0_first;
        tree_node_1[temp].m1_first = condition1 * tree_node_1[cur_tree_node].m1_first + tree_node_1[cur_tree_node - 1].m1_first;
        tree_node_1[temp].complete1 = true;
        cur_tree_node = temp;
    }
    //complete2[cur_tree_node] = true;
    long long temp1;

    while(cur_tree_node < order_thread) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;
        while(!tree_node_1[cur_tree_node].complete2) {
            ;
        };
        condition = tree_node_1[temp1].key_last == tree_node_1[temp].key_first;
        condition1 = tree_node_1[cur_tree_node].key_first == tree_node_1[temp].key_first;
        condition2 = tree_node_1[cur_tree_node].key_last == tree_node_1[temp1].key_last;

        tree_node_1[temp1].m0_prefix = tree_node_1[cur_tree_node].m0_prefix;
        tree_node_1[temp].m0_prefix = condition * tree_node_1[temp1].m0_last + condition1 * tree_node_1[cur_tree_node].m0_prefix;
        
        tree_node_1[temp1].m1_prefix = tree_node_1[cur_tree_node].m1_prefix;
        tree_node_1[temp].m1_prefix = condition * tree_node_1[temp1].m1_last + condition1 * tree_node_1[cur_tree_node].m1_prefix;
        
        tree_node_1[temp1].m0_suffix = condition * tree_node_1[temp].m0_first + condition2 * tree_node_1[cur_tree_node].m0_suffix;
        tree_node_1[temp].m0_suffix = tree_node_1[cur_tree_node].m0_suffix;
        
        tree_node_1[temp1].m1_suffix = condition * tree_node_1[temp].m1_first + condition2 * tree_node_1[cur_tree_node].m1_suffix;
        tree_node_1[temp].m1_suffix = tree_node_1[cur_tree_node].m1_suffix;
        
        tree_node_1[temp1].complete2 = true;
        tree_node_1[temp].complete2 = true;
        cur_tree_node = temp;
    }

    while(!tree_node_1[order_thread].complete2) {
        ;
    };

    long long key_first = arr[idx_start].key;
    long long m0_previous = tree_node_1[order_thread].m0_prefix;
    long long m1_previous = tree_node_1[order_thread].m1_prefix;
    long long key_last = arr[idx_end - 1].key;
    long long m0_last = tree_node_1[order_thread].m0_suffix;
    long long m1_last = tree_node_1[order_thread].m1_suffix;

    for (long long i = idx_start; i < idx_end; i++) {
        condition = (arr[i].key == key_first);
        condition1 = (arr[i].key == key_last);
        arr[i].m0 += condition * m0_previous + condition1 * m0_last;
        arr[i].m1 += condition * m1_previous + condition1 * m1_last;
    }

    return;
}


struct aggregation_tree_j_args {
    elem_t *arr;
    long long *j_index;
    long long idx_start;
    long long idx_end;
    long long order_thread;
};

struct aggregation_tree_i_args {
    elem_t *arr1;
    elem_t *arr2;
    long long idx_start;
    long long idx_end;
    long long idx_start2;
    long long idx_end2;
    long long order_thread;
    long long *index_target;
    long long *index_target2;
    long long sum0;
    long long sum1;
};

void aggregation_tree_j_downward(void *voidargs) {
    struct aggregation_tree_j_args *args = (struct aggregation_tree_j_args*)voidargs;
    elem_t *arr = args->arr;
    long long *j_index = args->j_index;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;
    long long order_thread = args->order_thread;
    long long cur_tree_node = order_thread;
    
    j_index[idx_start] = 0;
    for (long long i = idx_start + 1; i < idx_end; i++) {
        j_index[i] = (arr[i].key == arr[i - 1].key) * (j_index[i - 1] + 1);
    }

    //o_memcpy(tree_node_3[cur_tree_node].last_key, arr + idx_start, sizeof(*arr), true);
    //o_memcpy(tree_node_3[cur_tree_node].last_elem, arr + idx_end - 1, sizeof(*arr), true);
    tree_node_3[cur_tree_node].j = j_index[idx_end - 1];
    tree_node_3[cur_tree_node].key = arr[idx_end - 1].key;
    tree_node_3[cur_tree_node].complete1 = true;
    //bool condition;

    long long temp;
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2; // parent node id
        while(!tree_node_3[cur_tree_node - 1].complete1) {
            ;
        };
        tree_node_3[temp].key = tree_node_3[cur_tree_node].key;
        tree_node_3[temp].j = tree_node_3[cur_tree_node].j + (tree_node_3[cur_tree_node].key == tree_node_3[cur_tree_node - 1].key) * tree_node_3[cur_tree_node - 1].j;
        tree_node_3[temp].complete1 = true;
        cur_tree_node = temp;
        //!condition * tree_node_2[cur_tree_node - 1].last_elem + condition * tree_node_2[cur_tree_node].last_elem;
    }
    long long temp1;

    while(cur_tree_node < order_thread) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;

        while(!tree_node_3[cur_tree_node].complete2) {
            ;
        }
        tree_node_3[temp1].prev_j = tree_node_3[cur_tree_node].prev_j;
        tree_node_3[temp].prev_j = tree_node_3[temp1].j;

        tree_node_3[temp1].complete2 = true;
        tree_node_3[temp].complete2 = true;
        cur_tree_node = temp;
    }

    while(!tree_node_3[order_thread].complete2) {
        ;
    };

    //o_memcpy(elem_previous, tree_node_2[order_thread].prev_elem, true);

    if (idx_start != 0) {
        for (long long i = idx_start; i < idx_end; i++) {
            j_index[i] = j_index[i] + (arr[i].key == arr[idx_start - 1].key) * tree_node_3[order_thread].prev_j;
        }
    } 

    for (long long i = idx_start; i < idx_end; i++) {
        arr[i].j_order = j_index[i] % MAX(1,arr[i].m0) * arr[i].m1 + (j_index[i] / MAX(arr[i].m0, 1));
    }

    return;
}

void aggregation_tree_j_order(elem_t *arr, size_t length, long long n_threads) {
    arr[0].j_order = 0;

    long long length_thread = length / n_threads;
    long long length_extra = length % n_threads;

    struct aggregation_tree_j_args aggregation_tree_j_argss[n_threads];
    long long idx_start_thread[n_threads + 1];
    idx_start_thread[0] = 0;
    long long *jidx;
    jidx = calloc(length, sizeof(*jidx));
    struct thread_work multi_aggregation_j[n_threads - 1];
    for (long long i = 0; i < n_threads; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);
        
        aggregation_tree_j_argss[i].arr = arr;
        aggregation_tree_j_argss[i].idx_start = idx_start_thread[i];
        aggregation_tree_j_argss[i].idx_end = idx_start_thread[i + 1];
        aggregation_tree_j_argss[i].j_index = jidx;
        if (n_threads == 6) {
            aggregation_tree_j_argss[i].order_thread = tree_node_idx_6[i];        
        } else if (n_threads == 48) {
            aggregation_tree_j_argss[i].order_thread = tree_node_idx_48[i];
        } else {
            aggregation_tree_j_argss[i].order_thread = n_threads + i - 1;
        }

        if (i < n_threads - 1) {
            multi_aggregation_j[i].type = THREAD_WORK_SINGLE;
            multi_aggregation_j[i].single.func = aggregation_tree_j_downward;
            multi_aggregation_j[i].single.arg = &aggregation_tree_j_argss[i];
            thread_work_push(&multi_aggregation_j[i]);
        }
    }
    aggregation_tree_j_downward(&aggregation_tree_j_argss[n_threads - 1]);
    for (long long i = 0; i < n_threads - 1; i++) {
        thread_wait(&multi_aggregation_j[i]);
    }

    return;
}










void aggregation_tree_i_downward(void *voidargs) {
    struct aggregation_tree_i_args *args = (struct aggregation_tree_i_args*)voidargs;
    elem_t *arr1 = args->arr1;
    elem_t *arr2 = args->arr2;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;
    long long idx_start2 = args->idx_start2;
    long long idx_end2 = args->idx_end2;
    long long order_thread = args->order_thread;
    long long *index_target = args->index_target;
    long long *index_target2 = args->index_target2;
    long long cur_tree_node = order_thread;

    index_target[idx_start] = 0;
    index_target2[idx_start2] = 0;
    for (long long i = idx_start + 1; i < idx_end; i++) {
        index_target[i] = index_target[i - 1] + arr1[i - 1].table_0 * arr1[i - 1].m1;
    }
    for (long long i = idx_start2 + 1; i < idx_end2; i++) {
        index_target2[i] = index_target2[i - 1] + (1 - arr2[i - 1].table_0) * arr2[i - 1].m0;
    }

    tree_node_4[cur_tree_node].i = index_target[idx_end - 1] + arr1[idx_end - 1].table_0 * arr1[idx_end - 1].m1;
    tree_node_4[cur_tree_node].i2 = index_target2[idx_end2 - 1] + (1 - arr2[idx_end2 - 1].table_0) * arr2[idx_end2 - 1].m0;

    tree_node_4[cur_tree_node].complete1 = true;

    long long temp;
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2;
        while(!tree_node_4[cur_tree_node - 1].complete1) {
            ;
        };
        tree_node_4[temp].i = tree_node_4[cur_tree_node].i + tree_node_4[cur_tree_node - 1].i;
        tree_node_4[temp].i2 = tree_node_4[cur_tree_node].i2 + tree_node_4[cur_tree_node - 1].i2;
        tree_node_4[temp].complete1 = true;
        cur_tree_node = temp;
        //!condition * tree_node_2[cur_tree_node - 1].last_elem + condition * tree_node_2[cur_tree_node].last_elem;
    }
    long long temp1;

    while(cur_tree_node < order_thread) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;

        while(!tree_node_4[cur_tree_node].complete2) {
            ;
        }
        tree_node_4[temp1].prev_i = tree_node_4[cur_tree_node].prev_i;
        tree_node_4[temp].prev_i = tree_node_4[temp1].i + tree_node_4[cur_tree_node].prev_i;
        tree_node_4[temp1].prev_i2 = tree_node_4[cur_tree_node].prev_i2;
        tree_node_4[temp].prev_i2 = tree_node_4[temp1].i2 + tree_node_4[cur_tree_node].prev_i2;

        tree_node_4[temp1].complete2 = true;
        tree_node_4[temp].complete2 = true;
        cur_tree_node = temp;
    }

    while(!tree_node_4[order_thread].complete2) {
        ;
    };

    long long offset = tree_node_4[order_thread].prev_i;
    long long offset2 = tree_node_4[order_thread].prev_i2;

    for (long long i = idx_start; i < idx_end; i++) {
        index_target[i] = index_target[i] + offset;
    }
    for (long long i = idx_start2; i < idx_end2; i++) {
        index_target2[i] = index_target2[i] + offset2;
    }

    return;
}

void aggregation_tree_i(long long *index_target, long long *index_target2, elem_t *arr1, elem_t *arr2, long long length1, long long length2, long long number_threads) {

    long long length_thread = length1 / number_threads;
    long long length_extra = length1 % number_threads;
    long long length_thread2 = length2 / number_threads;
    long long length_extra2 = length2 % number_threads;

    struct aggregation_tree_i_args aggregation_tree_i_argss[number_threads];
    long long idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    long long idx_start_thread2[number_threads + 1];
    idx_start_thread2[0] = 0;
    struct thread_work multi_aggregation_i[number_threads - 1];
    for (long long i = 0; i < number_threads; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);
        idx_start_thread2[i + 1] = idx_start_thread2[i] + length_thread2 + (i < length_extra2);
        
        aggregation_tree_i_argss[i].arr1 = arr1;
        aggregation_tree_i_argss[i].arr2 = arr2;
        aggregation_tree_i_argss[i].idx_start = idx_start_thread[i];
        aggregation_tree_i_argss[i].idx_end = idx_start_thread[i + 1];
        aggregation_tree_i_argss[i].idx_start2 = idx_start_thread2[i];
        aggregation_tree_i_argss[i].idx_end2 = idx_start_thread2[i + 1];
        aggregation_tree_i_argss[i].index_target = index_target;
        aggregation_tree_i_argss[i].index_target2 = index_target2;
        if (number_threads == 6) {
            aggregation_tree_i_argss[i].order_thread = tree_node_idx_6[i];        
        } else if (number_threads == 48) {
            aggregation_tree_i_argss[i].order_thread = tree_node_idx_48[i];
        } else {
            aggregation_tree_i_argss[i].order_thread = number_threads + i - 1;
        }

        if (i < number_threads - 1) {
            multi_aggregation_i[i].type = THREAD_WORK_SINGLE;
            multi_aggregation_i[i].single.func = aggregation_tree_i_downward;
            multi_aggregation_i[i].single.arg = &aggregation_tree_i_argss[i];
            thread_work_push(&multi_aggregation_i[i]);
        }
    }
    aggregation_tree_i_downward(&aggregation_tree_i_argss[number_threads - 1]);

    for (long long i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_aggregation_i[i]);
    }
    
    return;
}












struct aggregation_tree_dup_args {
    elem_t *arr;
    long long idx_start;
    long long idx_end;
    long long order_thread;
    //elem_t *elem_previous;
};

void aggregation_tree_dup_1_downward(void *voidargs) {
    struct aggregation_tree_dup_args *args = (struct aggregation_tree_dup_args*)voidargs;
    elem_t *arr = args->arr;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;
    long long order_thread = args->order_thread;
    long long cur_tree_node = order_thread;

    for (long long i = idx_start + 1; i < idx_end; i++) {
        o_memcpy(arr + i, arr + i - 1, sizeof(*arr), !arr[i].has_value);
    }

    //tree_node_2[cur_tree_node].first_elem = idx_start;
    //tree_node_2[cur_tree_node].last_elem = idx_end - 1;
    //o_memcpy(tree_node_2[cur_tree_node].last_element, arr + idx_end - 1, sizeof(*arr), true);
    tree_node_2[cur_tree_node].k_l = arr[idx_end - 1].key;
    /*
    for (long long u = 0; u < DATA_LENGTH; u++) {
        tree_node_2[cur_tree_node].d_l[u] = arr[idx_end - 1].data[u];
    }
    */
    tree_node_2[cur_tree_node].has_value_l = arr[idx_end - 1].has_value;
    /*
    o_memcpy(tree_node_2[cur_tree_node].first_elem, arr + idx_start, sizeof(*arr), true);
    o_memcpy(tree_node_2[cur_tree_node].last_elem, arr + idx_end - 1, sizeof(*arr), true);
    */
    tree_node_2[cur_tree_node].complete1 = true;
    bool condition;

    long long temp;
    while(cur_tree_node % 2 == 0 && 0 < cur_tree_node) {
        temp = (cur_tree_node - 2) / 2; // parent node id
        while(!tree_node_2[cur_tree_node - 1].complete1) {
            ;
        };
        condition = tree_node_2[cur_tree_node].has_value_l;
        /*
        //o_memcpy(tree_node_2[temp].first_elem, tree_node_2[cur_tree_node - 1].first_elem, sizeof(*arr), true);
        o_memcpy(tree_node_2[temp].last_elem, tree_node_2[cur_tree_node].last_elem, sizeof(*arr), condition);
        o_memcpy(tree_node_2[temp].last_elem, tree_node_2[cur_tree_node - 1].last_elem, sizeof(*arr), !condition);
        */
        tree_node_2[temp].k_l = condition * tree_node_2[cur_tree_node].k_l + !condition * tree_node_2[cur_tree_node - 1].k_l;
        tree_node_2[temp].has_value_l = condition * tree_node_2[cur_tree_node].has_value_l + !condition * tree_node_2[cur_tree_node - 1].has_value_l;
        for (long long u = 0; u < DATA_LENGTH; u++) {
            tree_node_2[temp].d_l[u] = condition * tree_node_2[cur_tree_node].d_l[u] + !condition * tree_node_2[cur_tree_node - 1].d_l[u];
        }

        tree_node_2[temp].complete1 = true;
        cur_tree_node = temp;
        //!condition * tree_node_2[cur_tree_node - 1].last_elem + condition * tree_node_2[cur_tree_node].last_elem;
    }
    long long temp1;

    while(cur_tree_node < order_thread) {
        temp = cur_tree_node * 2 + 2;
        temp1 = cur_tree_node * 2 + 1;

        while(!tree_node_2[cur_tree_node].complete2) {
            ;
        }
        /*
        o_memcpy(tree_node_2[temp1].prev_elem, tree_node_2[cur_tree_node].prev_elem, sizeof(*arr), true);
        condition = tree_node_2[temp1].last_elem->has_value;
        o_memcpy(tree_node_2[temp].prev_elem, tree_node_2[temp1].last_elem, sizeof(*arr), condition);
        o_memcpy(tree_node_2[temp].prev_elem, tree_node_2[cur_tree_node].prev_elem, sizeof(*arr), !condition);
        */
        //tree_node_2[temp1].prev_elem = tree_node_2[cur_tree_node].prev_elem;
        condition = tree_node_2[temp1].has_value_l;
        //tree_node_2[temp].prev_elem = condition * tree_node_2[temp1].last_elem + !condition * tree_node_2[cur_tree_node].prev_elem;

        tree_node_2[temp1].k_p = tree_node_2[cur_tree_node].k_p;
        tree_node_2[temp1].has_value_p = tree_node_2[cur_tree_node].has_value_p;
        for (long long u = 0; u < DATA_LENGTH; u++) {
            tree_node_2[temp1].d_p[u] = tree_node_2[cur_tree_node].d_p[u];
        }

        tree_node_2[temp].k_p = condition * tree_node_2[temp1].k_l + !condition * tree_node_2[cur_tree_node].k_p;
        tree_node_2[temp].has_value_p = condition * tree_node_2[temp1].has_value_l + !condition * tree_node_2[cur_tree_node].has_value_p;
        for (long long u = 0; u < DATA_LENGTH; u++) {
            tree_node_2[temp].d_p[u] = condition * tree_node_2[temp1].d_l[u] + !condition * tree_node_2[cur_tree_node].d_p[u];
        }

        tree_node_2[temp1].complete2 = true;
        tree_node_2[temp].complete2 = true;
        cur_tree_node = temp;
    }

    while(!tree_node_2[order_thread].complete2) {
        ;
    };

    if (idx_start == 0) {
        return;
    }

    elem_t* previous_element = calloc(1, sizeof(*previous_element));
    previous_element->key = tree_node_2[order_thread].k_p;
    previous_element->has_value = tree_node_2[order_thread].has_value_p;
    /*
    for (long long u = 0; u < DATA_LENGTH; u++) {
        previous_element->data[u] = tree_node_2[order_thread].d_p[u];
    }
    */
    //prlong longf("\n%dth node key:%d data:%s", order_thread, tree_node_2[order_thread].k_p, tree_node_2[order_thread].d_p);
    for (long long i = idx_start; i < idx_end; i++) {
        o_memcpy(arr + i, previous_element, sizeof(*arr), !arr[i].has_value);
    }

    free(previous_element);

    return;
}

struct aggregation_tree_add_idx_start_args {
    long long *index_duplicate_start;
    long long *m0;
    long long idx_start;
    long long idx_end;
    long long index_duplicate_start_previous_temp;
};

void aggregation_tree_add_idx_start_1_downward(void *voidargs) {
    struct aggregation_tree_add_idx_start_args *args = (struct aggregation_tree_add_idx_start_args*)voidargs;
    long long *index_duplicate_start = args->index_duplicate_start;
    long long *m0 = args->m0;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;

    for (long long i = idx_start; i < idx_end; i++) {
        index_duplicate_start[i] = index_duplicate_start[i-1] + m0[i-1];
    }

    return;
}

void aggregation_tree_add_idx_start_2_downward(void *voidargs) {
    struct aggregation_tree_add_idx_start_args *args = (struct aggregation_tree_add_idx_start_args*)voidargs;
    long long *index_duplicate_start = args->index_duplicate_start;
    //long long *m0 = args->m0;
    long long idx_start = args->idx_start;
    long long idx_end = args->idx_end;
    long long index_duplicate_start_previous_temp = args->index_duplicate_start_previous_temp;

    for (long long i = idx_start; i < idx_end; i++) {
        index_duplicate_start[i] += index_duplicate_start_previous_temp;
    }

    return;
}

void aggregation_tree_m(elem_t *arr, long long length, long long number_threads) {
    long long length_thread = length / number_threads;
    long long length_extra = length % number_threads;

    struct aggregation_tree_m_args aggregation_tree_m_args[number_threads];
    long long idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    for (long long i = 0; i < number_threads; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);
        /*
        prlong longf("\n->start index: %d ", idx_start_thread[i]);
        prlong longf("end index: %d", idx_start_thread[i+1]);
        */
        
        aggregation_tree_m_args[i].arr = arr;
        aggregation_tree_m_args[i].idx_start = idx_start_thread[i];
        aggregation_tree_m_args[i].idx_end = idx_start_thread[i + 1];
        if (number_threads == 6) {
            aggregation_tree_m_args[i].order_thread = tree_node_idx_6[i];        
        } else if (number_threads == 48) {
            aggregation_tree_m_args[i].order_thread = tree_node_idx_48[i];
        } else {
            aggregation_tree_m_args[i].order_thread = number_threads + i - 1;
        }
        if (i < number_threads - 1) {
            multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
            multi_thread_aggregation_tree_1[i].single.func = aggregation_tree_m_1_downward;
            multi_thread_aggregation_tree_1[i].single.arg = &aggregation_tree_m_args[i];
            thread_work_push(&multi_thread_aggregation_tree_1[i]);
        }
    }

    aggregation_tree_m_1_downward(&aggregation_tree_m_args[number_threads - 1]);
    for (long long i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }

    /*
    for (long long i = 0; i < 2 * number_threads - 1; i++) {
        prlong longf("\n ----- m tree node : %d", i);
        prlong longf("\n key:%d,%d m0:%d,%d m1:%d,%d pre:%d,%d suf:%d,%d\n", tree_node_1[i].key_first, tree_node_1[i].key_last, tree_node_1[i].m0_first, tree_node_1[i].m0_last, tree_node_1[i].m1_first, tree_node_1[i].m1_last, tree_node_1[i].m0_prefix, tree_node_1[i].m1_prefix, tree_node_1[i].m0_suffix, tree_node_1[i].m1_suffix);
    }
    */

    return;
}

void aggregation_tree_dup(elem_t *arr, long long length, long long number_threads) {
    tree_node_2 = calloc(2 * number_threads - 1, sizeof(*tree_node_2));
    tree_node_2[0].complete2 = true;
    
    long long length_thread = length / number_threads;
    long long length_extra = length % number_threads;

    /* aggregation_tree_dup_1_downward */
    //prlong longf("\naggregation_tree_dup_1_downward");
    struct aggregation_tree_dup_args aggregation_tree_dup_args[number_threads];
    long long idx_start_thread[number_threads + 1];
    idx_start_thread[0] = 0;
    struct thread_work multi_thread_aggregation_tree_1[number_threads - 1];
    for (long long i = 0; i < number_threads; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);
        
        aggregation_tree_dup_args[i].arr = arr;
        aggregation_tree_dup_args[i].idx_start = idx_start_thread[i];
        aggregation_tree_dup_args[i].idx_end = idx_start_thread[i + 1];
        if (number_threads == 6) {
            aggregation_tree_dup_args[i].order_thread = tree_node_idx_6[i];        
        } else if (number_threads == 48) {
            aggregation_tree_dup_args[i].order_thread = tree_node_idx_48[i];
        } else {
            aggregation_tree_dup_args[i].order_thread = number_threads + i - 1;
        }

        if (i < number_threads - 1) {
            multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
            multi_thread_aggregation_tree_1[i].single.func = aggregation_tree_dup_1_downward;
            multi_thread_aggregation_tree_1[i].single.arg = &aggregation_tree_dup_args[i];
            thread_work_push(&multi_thread_aggregation_tree_1[i]);
        }
    }
    aggregation_tree_dup_1_downward(&aggregation_tree_dup_args[number_threads - 1]);

    for (long long i = 0; i < number_threads - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }

    free(tree_node_2);

    return;
}

void aggregation_tree_add_idx_start(long long *index_duplicate_start, long long *m0, long long idx_start, long long length, long long nthreads_total) {
    long long length_thread = length / nthreads_total;
    long long length_extra = length % nthreads_total;

    /* aggregation_tree_dup_1_downward */
    //prlong longf("\naggregation_tree_dup_1_downward");
    struct aggregation_tree_add_idx_start_args aggregation_tree_add_idx_start_args[nthreads_total];
    long long idx_start_thread[nthreads_total + 1];
    idx_start_thread[0] = idx_start;
    struct thread_work multi_thread_aggregation_tree_1[nthreads_total - 1];
    for (long long i = 0; i < nthreads_total; i++) {
        idx_start_thread[i + 1] = idx_start_thread[i] + length_thread + (i < length_extra);
        
        aggregation_tree_add_idx_start_args[i].index_duplicate_start = index_duplicate_start;
        aggregation_tree_add_idx_start_args[i].m0 = m0;
        aggregation_tree_add_idx_start_args[i].idx_start = idx_start_thread[i];
        aggregation_tree_add_idx_start_args[i].idx_end = idx_start_thread[i + 1];

        if (i < nthreads_total - 1) {
            multi_thread_aggregation_tree_1[i].type = THREAD_WORK_SINGLE;
            multi_thread_aggregation_tree_1[i].single.func =  aggregation_tree_add_idx_start_1_downward;
            multi_thread_aggregation_tree_1[i].single.arg = &aggregation_tree_add_idx_start_args[i];
            thread_work_push(&multi_thread_aggregation_tree_1[i]);
        }
    }
    aggregation_tree_add_idx_start_1_downward(&aggregation_tree_add_idx_start_args[nthreads_total - 1]);
    /*
    for (long long i = 0; i < nthreads_total - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }
    */

    /* aggregation_tree_dup_2_downward */
    //prlong longf("\naggregation_tree_dup_2_downward");
    long long index_duplicate_start_previous_temp;
    index_duplicate_start_previous_temp = 0;
    struct thread_work multi_thread_aggregation_tree_2[nthreads_total - 1];
    for (long long i = 0; i < nthreads_total - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_1[i]);
    }
    for (long long i = 1; i < nthreads_total; i++) {
        index_duplicate_start_previous_temp += index_duplicate_start[idx_start_thread[i] - 1] + m0[idx_start_thread[i] - 1];
        aggregation_tree_add_idx_start_args[i].index_duplicate_start_previous_temp = index_duplicate_start_previous_temp;

        //multi_thread_aggregation_tree_2[i - 1].type = THREAD_WORK_SINGLE;
        //multi_thread_aggregation_tree_2[i - 1].single.func = aggregation_tree_add_idx_start_1_downward;
        //multi_thread_aggregation_tree_2[i - 1].single.arg = &aggregation_tree_add_idx_start_args[i];
        //thread_work_push(&multi_thread_aggregation_tree_2[i - 1]);
    }
    for (long long i = 0; i < nthreads_total - 1; i++) {
        multi_thread_aggregation_tree_2[i].type = THREAD_WORK_SINGLE;
        multi_thread_aggregation_tree_2[i].single.func = aggregation_tree_add_idx_start_2_downward;
        multi_thread_aggregation_tree_2[i].single.arg = &aggregation_tree_add_idx_start_args[i + 1];
        thread_work_push(&multi_thread_aggregation_tree_2[i]);
    }
    for (long long i = 0; i < nthreads_total - 1; i++) {
        thread_wait(&multi_thread_aggregation_tree_2[i]);
    }
    
    //prlong longf("\naggregation_tree_dup complete.");

    return;
}