#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define DATA_LENGTH 48

typedef int ojoin_int_type;

typedef struct elem {
    char data[DATA_LENGTH];
    int m0;
    int m1;
    int j_order;
    short key;
    bool has_value;
    bool table_0;
} elem_t;

static_assert(sizeof(elem_t) == 64, "Element should be 64 bytes");

#endif /* common/elem_t.h */
