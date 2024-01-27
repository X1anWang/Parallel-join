#include <iostream>
#include <assert.h>
#include "sort.h"
#include "trace_mem.h"
using namespace std;


bool comp_int(int x, int y) {
    return x < y;
}

void test_int_sort() {
    TraceMem<int> memA(8);
    memA.write(0, 3);
    memA.write(1, 7);
    memA.write(2, 4);
    memA.write(3, 6);
    memA.write(4, 0);
    memA.write(5, 2);
    memA.write(6, 1);
    memA.write(7, 5);
    bitonic_sort<int, comp_int>(&memA);
    #ifdef FULL_LOG
    cout << "Trace for A:" << endl;
    cout << memA.getTrace() << endl << endl;
    #endif

    TraceMem<int> memB(11);
    memB.write(0, 7);
    memB.write(1, 10);
    memB.write(2, 8);
    memB.write(3, 1);
    memB.write(4, 3);
    memB.write(5, 6);
    memB.write(6, 9);
    memB.write(7, 2);
    memB.write(8, 4);
    memB.write(9, 5);
    memB.write(10, 0);
    bitonic_sort<int, comp_int>(&memB);
    #ifdef FULL_LOG
    cout << "Trace for B:" << endl;
    cout << memB.getTrace() << endl << endl;
    #endif

    cout << "A sorted:" << endl;
    for (int i = 0; i < 8; i++) {
        cout << memA.read(i) << " ";
    }
    cout << endl;

    cout << "B sorted:" << endl;
    for (int i = 0; i < 11; i++) {
        cout << memB.read(i) << " ";
    }
    cout << endl;
}


int main(int argc, char *argv[]) {
    test_int_sort();
}
