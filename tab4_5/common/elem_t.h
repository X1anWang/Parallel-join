#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define DATA_LENGTH 2

typedef long long ojoin_int_type;

typedef struct elem {
    long long m0;
    long long m1;
    long long j_order;
    int key;
    char data[DATA_LENGTH];
    bool has_value;
    bool table_0;
} elem_t;

static_assert(sizeof(elem_t) == 32, "Element should be 32 bytes");

#endif /* common/elem_t.h */
