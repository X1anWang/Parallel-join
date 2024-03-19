#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define BLOCK_SIZE 32
#define DATA_LENGTH (BLOCK_SIZE - 16)
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

static_assert(sizeof(elem_t) == 32, "Element should be 32 bytes");

#endif /* common/elem_t.h */
