#include <fstream>
#include <iostream>
#include <vector>
#include <algorithm>
#include <iomanip>
#include <time.h>

using namespace std;


struct Table {

    struct TableEntry {
        int d1;
        int d2;
    };
    
    vector<TableEntry> data;
    
    static bool comp(TableEntry e1, TableEntry e2) {
        return e1.d1 < e2.d1;
    }
};


int main(int argc, char *argv[]) {

    ifstream in_file(argv[1]);
    if (!in_file) {
        cerr << "Error opening input file" << endl;
        exit(0);
    }
    
    int n1, n2;
    in_file >> n1 >> n2;
    
    Table t1;
    for (int i = 0; i < n1; i++) {
        int d1, d2;
        in_file >> d1 >> d2;
        t1.data.push_back(Table::TableEntry{.d1=d1, .d2=d2});
    }
    
    Table t2;
    for (int i = 0; i < n2; i++) {
        int d1, d2;
        in_file >> d1 >> d2;
        t2.data.push_back(Table::TableEntry{.d1=d1, .d2=d2});
    }
    
    in_file.close();
    
    clock_t program_start = clock();
    
    sort(t1.data.begin(), t1.data.end(), Table::comp);
    sort(t2.data.begin(), t2.data.end(), Table::comp);
    
    Table out;
    
    int i = 0, j = 0, prev_j = 0;
    while (i < n1 && j < n2) {
        if (t1.data[i].d1 == t2.data[j].d1) {
            out.data.push_back(Table::TableEntry{.d1=t1.data[i].d2, .d2=t2.data[j].d2});
            j++;
        }
        else if (t1.data[i].d1 < t2.data[j].d1) {
            i++;
            j = prev_j;
        }
        else {
            j++;
            prev_j = j;
        }
    }
    
    cout << "Total runtime: " << fixed << setprecision(2)
         << (clock() - program_start) / (float)CLOCKS_PER_SEC << "s\n";
    
  
}
