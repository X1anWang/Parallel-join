#ifndef __COMMON_NODE_T_H
#define __COMMON_NODE_T_H

#include <assert.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define ELEM_SIZE 256
#define ELEM_STRUCT_SIZE 19
#define DATA_LENGTH 238

typedef int ojoin_int_type;

// 4 int supplier / customer id
// ? char address 40
// 8 long long phone number
// 4 float acctbal 116
// ? char comment

// customer only:
// 4 market segment: -> int

typedef struct elem {
    int key;
    int m0;
    int m1;
    int j_order;
    bool has_value;
    bool table_0;
    char data[238];
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

static_assert(sizeof(elem_t) == ELEM_SIZE, "Element should be 256 bytes");

#endif /* common/elem_t.h */
