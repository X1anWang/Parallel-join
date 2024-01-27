#ifndef LAYOUT_H
#define LAYOUT_H

#include <math.h>
#include "sort.h"
#include "trace_mem.h"


#define EMPTY_ENTRY false
#define REG_ENTRY 1
#define DATA_LENGTH 16

struct Table {

    struct TableEntry {
        // input data

        // auxillary data
        long long block_height;
        long long block_width;
        long long index;
        long long t1index;
        
        long long join_attr;
        char data_attr[DATA_LENGTH];
        int table_id;
        int entry_type = EMPTY_ENTRY;
    };

    TraceMem<TableEntry> data;

    Table(long long size) : data(TraceMem<TableEntry>(size)) {
    }

    // index function
    static long long entry_ind(TableEntry e) {
        long long res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.index);
        return res;
    }

    // weight functions

    static long long entry_height(TableEntry e) {
        long long res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.block_height);
        return res;
    }

    static long long entry_width(TableEntry e) {
        long long res = ((e.entry_type == EMPTY_ENTRY) * (-1)) + ((!(e.entry_type == EMPTY_ENTRY)) * e.block_width);
        return res;
    }


    // comparison functions

    static bool attr_comp(TableEntry e1, TableEntry e2) {
        long long res = ((e1.join_attr == e2.join_attr) * (e1.table_id < e2.table_id)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr));
        return res;
    }

    static bool tid_comp(TableEntry e1, TableEntry e2) {
        long long res = ((e1.table_id == e2.table_id) * (((e1.join_attr == e2.join_attr) * (e1.data_attr < e2.data_attr)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr)))) + ((!(e1.table_id == e2.table_id)) * (e1.table_id < e2.table_id));
        return res;
    }

    static bool t1_comp(TableEntry e1, TableEntry e2) {
        long long res = ((e1.join_attr == e2.join_attr) * (e1.t1index < e2.t1index)) + ((!(e1.join_attr == e2.join_attr)) * (e1.join_attr < e2.join_attr));
        return res;
    }

};

#endif

