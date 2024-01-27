#ifdef SUBTIME
#include <time.h>
#endif
#include "layout.h"
#include "sort.h"
#include "trace_mem.h"
#include "db_primitives.h"

#define TIME_VAL ((clock() - begin) / (float)CLOCKS_PER_SEC)


// t: concatenated input table
// t0, t1: aligned output tables
void join(Table &t, Table &t0, Table &t1) {
    int n1 = t0.data.size, n2 = t1.data.size;
    int n = n1 + n2;

    #ifdef SUBTIME
    clock_t begin = clock();
    #endif
    
    // sort lexicographically by (join_attr, table_id)
    bitonic_sort<Table::TableEntry, Table::attr_comp>(&t.data);

    // fill in block heights and widths after initial sort & get output_size
    int output_size = write_block_sizes(n, t);
    
    // resort lexicographically by (table_id, join_attr, data_attr)
    bitonic_sort<Table::TableEntry, Table::tid_comp>(&t.data);
    
    #ifdef SUBTIME
    printf("Sorting concatenated table twice: %.2fs\n", TIME_VAL);
    #endif

    for (int i = 0; i < n1; i++) {
        Table::TableEntry e = t.data.read(i);
        t0.data.write(i, e);
    }

    for (int i = 0; i < n2; i++) {
        Table::TableEntry e = t.data.read(n1 + i);
        t1.data.write(i, e);
    }
    
    // obliviously expand both tables
    obliv_expand<Table::entry_width>(&t0.data);
    obliv_expand<Table::entry_height>(&t1.data);
    assert(t0.data.size == output_size);
    assert(t1.data.size == output_size);
    
    #ifdef SUBTIME
    begin = clock();
    #endif
    
    // align second table
    bitonic_sort<Table::TableEntry, Table::t1_comp>(&t1.data);
    
    #ifdef SUBTIME
    printf("Sorting second expanded table: %.2fs\n", TIME_VAL);
    #endif
}
