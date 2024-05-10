#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define ELEM_SIZE 32
#define ELEM_STRUCT_SIZE 19
#define DATA_LENGTH 14

typedef int ojoin_int_type;

typedef struct elem {
    char data[DATA_LENGTH];
    bool has_value;
    bool table_0;
    int key;
    int m0;
    int m1;
    int j_order;
} elem_t;

static_assert(sizeof(elem_t) == ELEM_SIZE, "Element should be 32 bytes");

#endif /* common/elem_t.h */
