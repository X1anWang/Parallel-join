/*
 * Copyright (C) 2011-2018 Intel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Intel Corporation nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */


#include <stdarg.h>
#include <stdio.h>      /* vsnprintf */
#include <string.h>
#include <stdint.h>

#include <vector>

#include "Enclave.h"
#include "Enclave_t.h"  /* print_string */

#include "join.h"
// #include "sort.h"
#include "layout.h"
#include "table_util.h"

int branching_factor_test( int maxsize) {
    printf("Inside the enclave, %d\n", maxsize);
    long long tsize = 1 << 21;
    printf("tsize: %lld, table entry size: %d\n", tsize, sizeof(Table::TableEntry));
    long long cnt = 0;
    Table t(tsize);
    for ( long long i = tsize -1; i > 0; i--) {
        // printf("%lld\n", i);
        int j,d;
        j = i;
        d = i% 10;

        Table::TableEntry entry = t.data.read(i);
        entry.entry_type = REG_ENTRY;
        entry.table_id = 0;
        entry.join_attr = j;
        entry.data_attr = d;
        t.data.write(i, entry);
        // printf("Table[%lld]: %d\n", cnt, entry.join_attr);
    }
    // for ( long long i = tsize -1; i > 0; i--) {
    //     // printf("%lld\n", i);
    //     int j,d;
    //     j = i;
    //     d = i% 10;

    //     Table::TableEntry entry = t.data.read(cnt);
    //     entry.entry_type = REG_ENTRY;
    //     entry.table_id = 0;
    //     entry.join_attr = j;
    //     entry.data_attr = d;
    //     t.data.write(cnt, entry);
    //     // printf("Table[%lld]: %d\n", cnt, entry.join_attr);
    //     cnt++;
    // }
    printf("Done initializing table\n");
    ocall_init_time();
    bitonic_sort<Table::TableEntry, Table::attr_comp>(&t.data);
    ocall_get_time();
    
    return 0;
}

/* 
 * printf: 
 *   Invokes OCALL to display the enclave buffer to the terminal.
 */
void printf(const char *fmt, ...)
{
    char buf[BUFSIZ] = {'\0'};
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, BUFSIZ, fmt, ap);
    va_end(ap);
    ocall_print_string(buf);
}

void process_input(char *buf, size_t len)
{   
    printf("Enclave begin\n");
    
    // read input as one concatenated table
    int n1, n2;
    Table t = parseTables(buf, n1, n2);
    int n = n1 + n2;
    
    init_time();
    Table t0(n1), t1(n2);

    join(t, t0, t1);
    
    // write output
    toString(buf, t0, t1);
    
    printf("Enclave end\n");
}
