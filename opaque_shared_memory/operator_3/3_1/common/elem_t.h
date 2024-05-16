#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define ELEM_SIZE 128
#define ELEM_STRUCT_SIZE 19
#define DATA_LENGTH 507

typedef int ojoin_int_type;

typedef struct elem {
    char data[DATA_LENGTH];
    bool has_value;
    int key;
} elem_t;

static_assert(sizeof(elem_t) == 512, "Element should be 512 bytes");

#endif /* common/elem_t.h */
