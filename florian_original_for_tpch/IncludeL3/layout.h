#ifndef LAYOUT_H
#define LAYOUT_H

#include <math.h>
#include "sort.h"
#include "trace_mem.h"


#define EMPTY_ENTRY false
#define REG_ENTRY 1
#define DATA_LENGTH 4

struct Table {

    struct TableEntry {
        // input data
        int join_attr;
        char data_attr[DATA_LENGTH];

        // auxillary data
        int block_height;
        int block_width;
        int index;
        int t1index;

        int table_id;
        int entry_type = EMPTY_ENTRY;
    };

    TraceMem<TableEntry> data;

    Table(int size) : data(TraceMem<TableEntry>(size)) {
    }

    // index function
    static int entry_ind(TableEntry e) {
        int res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.index);
        return res;
    }

    // weight functions

    static int entry_height(TableEntry e) {
        int res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.block_height);
        return res;
    }

    static int entry_width(TableEntry e) {
        int res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.block_width);
        return res;
    }


    // comparison functions

    static bool attr_comp(TableEntry e1, TableEntry e2) {
        int res = ((e1.join_attr == e2.join_attr) * (e1.table_id < e2.table_id)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr));
        return res;
    }

    static bool tid_comp(TableEntry e1, TableEntry e2) {
        int res = ((e1.table_id == e2.table_id) * (((e1.join_attr == e2.join_attr) * (e1.data_attr < e2.data_attr)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr)))) + ((!(e1.table_id == e2.table_id)) * (e1.table_id < e2.table_id));
        return res;
    }

    static bool t1_comp(TableEntry e1, TableEntry e2) {
        int res = ((e1.join_attr == e2.join_attr) * (e1.t1index < e2.t1index)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr));
        return res;
    }

};

#endif

