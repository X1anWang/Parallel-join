#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define DATA_LENGTH 247
#define KEY_LENGTH 22
typedef int ojoin_int_type;

typedef struct elem {
    char data[DATA_LENGTH];
    bool table_0;
    uint64_t key;
    //char unused[14];
    //bool unused;
} elem_t;

static_assert(sizeof(elem_t) == 256, "Element should be 256 bytes");

#endif /* common/elem_t.h */
