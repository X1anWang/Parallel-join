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

    printf("\n\nTable input length: %d\n\n", n1);
    
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

int my_len(char *data) {
    int i = 0;

    while ((data[i] != '\0') && (i < DATA_LENGTH)) i++;
    
    return i;
}

/* output t0⋈t1, where t0 and t1 are aligned */
void toString(char *out_buf, Table t0, Table t1) {
    int m = t0.data.size;
    char *p = out_buf;
    for (int i = 0; i < 0; i++) {
        Table::TableEntry e0 = t0.data.read(i);
        Table::TableEntry e1 = t1.data.read(i);
        int d0 = my_len(e0.data_attr);
        int d1 = my_len(e1.data_attr);
        
        strncpy(p, e0.data_attr, d0);
        p += d0; p[0] = ' '; p += 1;
        strncpy(p, e1.data_attr, d1);
        p += d1; p[0] = '\n'; p += 1;
    }
    p[0] = '\0';
}

#endif

