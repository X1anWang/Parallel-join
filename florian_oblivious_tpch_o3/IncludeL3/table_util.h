#ifndef TABLE_UTIL_H
#define TABLE_UTIL_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "layout.h"
#include "util.h"


Table parseTables(char *buf, int& n1, int& n2) {
    char *cp;
    cp = strtok(buf, " ");
    n1 = atoi(cp);
    cp = strtok(NULL, "\n");
    n2 = atoi(cp);
    
    Table t(n1 + n2);

    printf("\n\nTable length: %d\n\n", n1);
    
    for (int i = 0; i < n1 + n2; i++) {
        int j;//, d;
        j = atoi(strtok(NULL, " "));
        //d = atoi(strtok(NULL, "\n"));
        
        Table::TableEntry entry = t.data.read(i);
        entry.entry_type = REG_ENTRY;
        entry.table_id = (i < n1 ? 0 : 1);
        entry.join_attr = j;
        strncpy(entry.data_attr, strtok(NULL, "\n"), DATA_LENGTH);
        //entry.data_attr = d;
        t.data.write(i, entry);
    }
    
    return t;
}


/* output t0⋈t1, where t0 and t1 are aligned */
void toString(char *out_buf, Table t0, Table t1) {
    return;
}

#endif

