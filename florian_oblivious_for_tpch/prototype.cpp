#include <fstream>
#include <iostream>
#include <assert.h>
#include <math.h>
#include <limits.h>
#include <time.h>
#ifdef LOG_HASH
#include <openssl/sha.h>
#endif
#include "join.h"
#include "layout.h"
#include "sort.h"
#include "trace_mem.h"
#include "util.h"
#include "debug_util.h"
using namespace std;


int main(int argc, char *argv[]) {
    if (argc != 3) {
        cout << "Usage: " << argv[0] << " INPUT_FILE OUTPUT_FILE\n";
        exit(0);
    }

    ifstream in_file(argv[1]);
    if (!in_file) {
        cerr << "Error opening input file" << endl;
        exit(0);
    }
    
    ofstream out_file(argv[2]);
    if (!out_file) {
        cerr << "Error opening output file.\n";
        exit(0);
    }

    int n1, n2;
    in_file >> n1 >> n2;
    int n = n1 + n2;

    // input is read into one concatenated table
    Table t(n);
    for (int i = 0; i < n; i++) {
        Table::TableEntry entry = t.data.read(i);
        entry.entry_type = REG_ENTRY;
        entry.table_id = (i < n1 ? 0 : 1);
        in_file >> entry.join_attr >> entry.data_attr;
        t.data.write(i, entry);
    }
    int tmp; assert(!(in_file >> tmp));
    in_file.close();
    
    Table t0(n1), t1(n2);

    clock_t program_start = clock();
    
    join(t, t0, t1);
    
    cout << "Total runtime: " << fixed << setprecision(2)
         << (clock() - program_start) / (float)CLOCKS_PER_SEC << "s\n";

    // write output
    int i = 0;
    assert(t0.data.size == t1.data.size);
    for (; i < t0.data.size; i++) {
        Table::TableEntry e0 = t0.data.read(i);
        Table::TableEntry e1 = t1.data.read(i);
        out_file << e0.data_attr << " " << e1.data_attr << endl;
    }
    out_file.close();
    
    cout << "Output size: " << t0.data.size << endl;
    
    // memory log
    #ifdef LOG_ALL
    ofstream trace_file("join_mem_trace.txt");
    trace_file << t.data.getTrace() << endl 
               << t0.data.getTrace() << endl
               << t1.data.getTrace() << endl;
    trace_file.close();
    #endif
    #ifdef LOG_HASH
    auto total_rw = t.data.getTotalRW() +
        t0.data.getTotalRW() + t1.data.getTotalRW();
    cout << "Total memory accesses: " << total_rw << endl;
    
    cout << "Hash of memory trace: ";
    SHA256_CTX *sha = t.data.getHash();
    SHA256_Update(sha, t0.data.getHash(), SHA256_DIGEST_LENGTH);
    SHA256_Update(sha, t1.data.getHash(), SHA256_DIGEST_LENGTH);
    unsigned char md[SHA256_DIGEST_LENGTH];
    SHA256_Final(md, sha);
    for (int i = 0; i < SHA256_DIGEST_LENGTH; i++)
        std::cout << std::setfill('0') << std::setw(2) << std::hex << (int)md[i];
    std::cout << endl;
    #endif
}