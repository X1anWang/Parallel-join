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
    for (int ii = 1; (ii <= n1) && (sum < n1); ii++) {
        num = (n1 - sum) < int(c / (ii * ii)) ? (n1 - sum) : int(c / (ii * ii));
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
