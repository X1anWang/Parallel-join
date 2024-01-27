#include <iostream>
#include <assert.h>
#include "sort.h"
#include "trace_mem.h"
using namespace std;


struct TestStruct {
    TestStruct(int non_empty, int id, int target_coord): 
        non_empty(non_empty), id(id), target_coord(target_coord){}

    int non_empty;
    int id;
    int target_coord;
};


int test_ind_func(TestStruct e) {
    if (e.non_empty == 0) return -1;
    else return e.target_coord;
}


void test_struct_distribute() {
    TraceMem<TestStruct> memA(16);
    for (int i = 0; i < memA.size; i++) {
        if (i == 2) memA.write(i, TestStruct(1, 2, 8));
        else if (i == 5) memA.write(i, TestStruct(1, 5, 14));
        else if (i == 6) memA.write(i, TestStruct(1, 6, 1));
        else if (i == 10) memA.write(i, TestStruct(1, 10, 4));
        else if (i == 13) memA.write(i, TestStruct(1, 13, 15));
        else memA.write(i, TestStruct(0, 0, 0));
    }
    obliv_distribute<TestStruct, test_ind_func>(&memA, 16);
    #ifdef FULL_LOG
    cout << "Trace for A:" << endl;
    cout << memA.getTrace() << endl << endl;
    #endif

    TraceMem<TestStruct> memB(17);
    for (int i = 0; i < memB.size; i++) {
        if (i == 3) memB.write(i, TestStruct(1, 0, 0));
        else if (i == 7) memB.write(i, TestStruct(1, 7, 17));
        else if (i == 8) memB.write(i, TestStruct(1, 8, 21));
        else if (i == 10) memB.write(i, TestStruct(1, 10, 4));
        else if (i == 14) memB.write(i, TestStruct(1, 14, 29));
        else if (i == 15) memB.write(i, TestStruct(1, 1, 5));
        else memB.write(i, TestStruct(0, 0, 0));
    }
    obliv_distribute<TestStruct, test_ind_func>(&memB, 31);
    #ifdef FULL_LOG
    cout << "Trace for B:" << endl;
    cout << memB.getTrace() << endl << endl;
    #endif

    TraceMem<TestStruct> memC(14);
    for (int i = 0; i < memC.size; i++) {
        if (i == 0) memC.write(i, TestStruct(1, 0, 8));
        else if (i == 1) memC.write(i, TestStruct(1, 1, 10));
        else if (i == 2) memC.write(i, TestStruct(1, 2, 4));
        else if (i == 3) memC.write(i, TestStruct(1, 3, 3));
        else if (i == 4) memC.write(i, TestStruct(1, 4, 9));
        else if (i == 5) memC.write(i, TestStruct(1, 5, 92));
        else if (i == 6) memC.write(i, TestStruct(1, 6, 44));
        else if (i == 7) memC.write(i, TestStruct(1, 7, 45));
        else if (i == 12) memC.write(i, TestStruct(1, 12, 39));
        else memC.write(i, TestStruct(0, 0, 0));
    }
    obliv_distribute<TestStruct, test_ind_func>(&memC, 100);
    #ifdef FULL_LOG
    cout << "Trace for C:" << endl;
    cout << memC.getTrace() << endl << endl;
    #endif

    cout << "Result for A:" << endl;
    for (int i = 0; i < memA.size; i++) {
        TestStruct e = memA.read(i);
        if (e.non_empty == 0)
            cout << i << ": D" << endl;
        else
            cout << i << ": " << e.id << " -> " << e.target_coord << endl;
    }
    cout << endl;

    cout << "Result for B:" << endl;
    for (int i = 0; i < memB.size; i++) {
        TestStruct e = memB.read(i);
        if (e.non_empty == 0)
            cout << i << ": D" << endl;
        else
            cout << i << ": " << e.id << " -> " << e.target_coord << endl;
    }
    cout << endl;

    cout << "Result for C:" << endl;
    for (int i = 0; i < memC.size; i++) {
        TestStruct e = memC.read(i);
        if (e.non_empty == 0)
            cout << i << ": D" << endl;
        else
            cout << i << ": " << e.id << " -> " << e.target_coord << endl;
    }
    cout << endl;
}


int main(int argc, char *argv[]) {
    test_struct_distribute();
}