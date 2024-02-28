#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

typedef int ojoin_int_type;

typedef struct elem {
    int m0;
    int m1;
    int j_order;
    short key;
    bool has_value;
    bool table_0;
} elem_t;

//static_assert(sizeof(elem_t) == ELEM_SIZE, "Element should be 128 bytes");

#endif /* common/elem_t.h */
