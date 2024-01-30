#ifndef DB_PRIMITIVES_H
#define DB_PRIMITIVES_H

#include <assert.h>
#include "layout.h"
#include "sort.h"
#include "trace_mem.h"


// TODO: do this in two passes, as in pseudocode from paper
int write_block_sizes(int n, Table& table) {
    int output_size = 0;

    // scan in forward direction to fill in height fields for table 1 entries
    int height = 0, width = 0, last_join_attr = INT_MIN;
    for (int i = 0; i < n; i++) {
        Table::TableEntry entry = table.data.read(i);
        bool same_attr = entry.join_attr == last_join_attr;

        height = (((entry.table_id == 0) & (!same_attr)) * 1) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * (height + 1)) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * 0) + ((!((entry.table_id == 1) & (!same_attr))) * height)))));
        entry.block_height = (((entry.table_id == 0) & (!same_attr)) * entry.block_height) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * entry.block_height) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * 0) + ((!((entry.table_id == 1) & (!same_attr))) * ((((entry.table_id == 1) & same_attr) * height) + ((!((entry.table_id == 1) & same_attr)) * entry.block_height)))))));

        last_join_attr = entry.join_attr;
        table.data.write(i, entry);
    }
    // scan in backward direction to fill in width + height fields for table 0 entries
    height = 0; width = 0, last_join_attr = INT_MIN;
    for (int i = n - 1; i >= 0; i--) {
        Table::TableEntry entry = table.data.read(i);
        bool same_attr = entry.join_attr == last_join_attr;

        width = (((entry.table_id == 0) & (!same_attr)) * 0) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * width) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * 1) + ((!((entry.table_id == 1) & (!same_attr))) * ((((entry.table_id == 1) & same_attr) * (width + 1)) + ((!((entry.table_id == 1) & same_attr)) * width)))))));
        height = (((entry.table_id == 0) & (!same_attr)) * 0) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * height) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * entry.block_height) + ((!((entry.table_id == 1) & (!same_attr))) * ((((entry.table_id == 1) & same_attr) * entry.block_height) + ((!((entry.table_id == 1) & same_attr)) * height)))))));
        entry.block_width = (((entry.table_id == 0) & (!same_attr)) * 0) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * width) + ((!((entry.table_id == 0) & same_attr)) * entry.block_width)));
        entry.block_height = (((entry.table_id == 0) & (!same_attr)) * 0) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * height) + ((!((entry.table_id == 0) & same_attr)) * entry.block_height)));
        
        last_join_attr = entry.join_attr;
        table.data.write(i, entry);
    }
    // scan in forward direction to fill in width fields for table 1 entries
    height = 0; width = 0, last_join_attr = INT_MIN;
    for (int i = 0; i < n; i++) {
        Table::TableEntry entry = table.data.read(i);
        bool same_attr = entry.join_attr == last_join_attr;

        output_size = (((entry.table_id == 0) & (!same_attr)) * (output_size + (entry.block_height * entry.block_width))) + ((!((entry.table_id == 0) & (!same_attr))) * output_size);
        entry.block_width = (((entry.table_id == 0) & (!same_attr)) * entry.block_width) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * entry.block_width) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * 0) + ((!((entry.table_id == 1) & (!same_attr))) * ((((entry.table_id == 1) & same_attr) * width) + ((!((entry.table_id == 1) & same_attr)) * entry.block_width)))))));
        width = (((entry.table_id == 0) & (!same_attr)) * entry.block_width) + ((!((entry.table_id == 0) & (!same_attr))) * ((((entry.table_id == 0) & same_attr) * entry.block_width) + ((!((entry.table_id == 0) & same_attr)) * ((((entry.table_id == 1) & (!same_attr)) * 0) + ((!((entry.table_id == 1) & (!same_attr))) * width)))));

        last_join_attr = entry.join_attr;
        table.data.write(i, entry);
    }

    return output_size;
}

template <int (*weight_func)(Table::TableEntry e)>
static void obliv_expand(TraceMem<Table::TableEntry> *traceMem) {
    int csum = 0;

    for (int i = 0; i < traceMem->size; i++) {
        Table::TableEntry e = traceMem->read(i);
        int weight = weight_func(e);
        e.entry_type = ((weight == 0) * EMPTY_ENTRY) + ((!(weight == 0)) * e.entry_type);
        e.index = ((weight == 0) * e.index) + ((!(weight == 0)) * csum);
        traceMem->write(i, e);
        csum += weight;
    }

    obliv_distribute<Table::TableEntry, Table::entry_ind>(traceMem, csum);
    get_time(1);

    // TODO: simplify this logic
    Table::TableEntry last;
    int dupl_off = 0, block_off = 0;
    for (int i = 0; i < csum; i++) {
        Table::TableEntry e = traceMem->read(i);
        bool cond = e.entry_type != EMPTY_ENTRY;
        o_memcpy(&e, &last, sizeof(last), !cond);
        o_memcpy(&last, &e, sizeof(last), cond);
        dupl_off = ((e.entry_type != EMPTY_ENTRY) * 0) + ((!(e.entry_type != EMPTY_ENTRY)) * dupl_off);
        e.index += dupl_off;
        e.t1index = int(block_off / e.block_height) +
                    (block_off % e.block_height) * e.block_width;
        dupl_off++;
        block_off++;
        traceMem->write(i, e);
    }
}

#endif
