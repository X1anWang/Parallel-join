#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define DATA_LENGTH 243
#define KEY_LENGTH 22
typedef int ojoin_int_type;

typedef struct elem {
    char data[DATA_LENGTH];
    bool table_0;
    int dummy_order;
    //char key[KEY_LENGTH];
    uint64_t key;
} elem_t;

static_assert(sizeof(elem_t) == 256, "Element should be 256 bytes");

#endif /* common/elem_t.h */
