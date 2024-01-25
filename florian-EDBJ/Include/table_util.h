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
    
    for (int i = 0; i < n1 + n2; i++) {
        int j, d;
        j = atoi(strtok(NULL, " "));
        d = atoi(strtok(NULL, "\n"));
        
        Table::TableEntry entry = t.data.read(i);
        entry.entry_type = REG_ENTRY;
        entry.table_id = (i < n1 ? 0 : 1);
        entry.join_attr = j;
        entry.data_attr = d;
        t.data.write(i, entry);
    }
    
    return t;
}


/* output t0⋈t1, where t0 and t1 are aligned */
void toString(char *out_buf, Table t0, Table t1) {
    int m = t0.data.size;
    char *p = out_buf;
    for (int i = 0; i < m; i++) {
        Table::TableEntry e0 = t0.data.read(i);
        Table::TableEntry e1 = t1.data.read(i);
        int d0 = e0.data_attr;
        int d1 = e1.data_attr;
        
        char d0_str[10], d1_str[10];
        int d0_len, d1_len;
        itoa(d0, d0_str, &d0_len);
        itoa(d1, d1_str, &d1_len);
        
        strncpy(p, d0_str, d0_len);
        p += d0_len; p[0] = ' '; p += 1;
        strncpy(p, d1_str, d1_len);
        p += d1_len; p[0] = '\n'; p += 1;
    }
    p[0] = '\0';
}

#endif

