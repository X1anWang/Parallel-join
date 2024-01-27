#ifndef DEBUG_UTIL_H
#define DEBUG_UTIL_H

#include <iostream>
#include <iomanip>
#include "layout.h"
#include "sort.h"
#include "trace_mem.h"
#include "util.h"
using namespace std;


void print_table(Table& table, int n) {
    for (int i = 0; i < min(n, table.data.size); i++) {
        Table::TableEntry entry = table.data.read(i);
        if (i % 10 == 0) {
            cout << setw(4) << left << "ne"
                 << setw(4) << left << "tid"
                 << setw(4) << left << "ja"
                 << setw(4) << left << "da"
                 << setw(4) << left << "bh"
                 << setw(4) << left << "bw"
                 << setw(4) << left << "i"
                 << setw(4) << left << "t1i"
                 << endl;
        }
        cout << setw(4) << left << (entry.entry_type == EMPTY_ENTRY ? 0 : 1)
             << setw(4) << left << entry.table_id
             << setw(4) << left << entry.join_attr
             << setw(4) << left << entry.data_attr
             << setw(4) << left << entry.block_height
             << setw(4) << left << entry.block_width
             << setw(4) << left << entry.index
             << setw(4) << left << entry.t1index
             << endl;
    }
}


#endif
