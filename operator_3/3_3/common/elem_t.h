#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define ELEM_SIZE 32
#define ELEM_STRUCT_SIZE 19
#define DATA_LENGTH 305
#define max_output_bytes 1073741824

typedef int ojoin_int_type;

typedef struct elem {
    //char unused[32];
    int pagerank;
    uint64_t key;
    float adrevenue;
    float avg_pagerank;
    float sum_adrevenue;
} elem_t;

typedef struct ele2m {
    ojoin_int_type key;
    unsigned char data[4];

    /* Oblivious join stuff*/
    bool has_value;
    bool table_0;

    /* Florian's join */
    ojoin_int_type m0;
    ojoin_int_type m1;
    ojoin_int_type true_key;
    ojoin_int_type idx_start;
    ojoin_int_type j_order;

    //unsigned char unused[ELEM_SIZE - ELEM_STRUCT_SIZE];
} ele2m_t;

static_assert(sizeof(elem_t) == ELEM_SIZE, "Element should be 64 bytes");

#endif /* common/elem_t.h */
