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

    int num = 0;
    int total = n1 + n2;
    int c = int(total * 100 / 99);
    int index_1 = 0;
    int index_2 = n1;
    int sum = 0;
    int num1 = 0;
    int num2 = 0;
    for (int ii = 0; ii < n1 && sum < n1; ii++) {
        num = (n1 - sum) < int(c * 1 / (ii * ii)) ? (n1 - sum) : int(c * 1 / (ii * ii));
        num1 = (num % 2 == 0) ? 2 : 1;
        num2 = num / num1;
        
        for(int u = 0; u < num1; u++) {
            Table::TableEntry entry = t.data.read(index_1);
            entry.entry_type = REG_ENTRY;
            entry.table_id = 0;
            entry.join_attr = ii;
            t.data.write(index_1++, entry);
        }

        for(int u = 0; u < num2; u++) {
            Table::TableEntry entry = t.data.read(index_2);
            entry.entry_type = REG_ENTRY;
            entry.table_id = 1;
            entry.join_attr = ii;
            t.data.write(index_2++, entry);
        }
        sum += num;
    }

    for (; index_1 < n1; ) {
        Table::TableEntry entry = t.data.read(index_1);
        entry.entry_type = REG_ENTRY;
        entry.table_id = 0;
        entry.join_attr = total + 1;
        t.data.write(index_1++, entry);
    }

    for (; index_2 < n1 + n2; ) {
        Table::TableEntry entry = t.data.read(index_2);
        entry.entry_type = REG_ENTRY;
        entry.table_id = 1;
        entry.join_attr = total + 2;
        t.data.write(index_2++, entry);
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

