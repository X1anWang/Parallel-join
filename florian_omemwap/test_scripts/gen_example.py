#!/usr/bin/python3


import sys
from math import *
import random
import numpy


def join(table1, table2):
    out = []
    i, j, prev_j = 0, 0, 0
    while i < len(table1) and j < len(table2):
        j1, d1 = table1[i]
        j2, d2 = table2[j]
        if j1 == j2:
            out.append((d1, d2))
            j += 1
        elif j1 < j2:
            i += 1
            j = prev_j
        else:
            j += 1
            prev_j = j
    return out    


if __name__ == '__main__':
    n = int(sys.argv[1])
    n1 = n // 2
    example_type = sys.argv[2]
    in_file = sys.argv[3]
    exp_file = sys.argv[4] if len(sys.argv) >= 5 else None
    
    if example_type == '1':
        table1j = [0] * n1
        table2j = [0] * 1 + [1] * (n1 - 1)
    elif example_type == '2':
        table1j = [0] * 1 + [1] * (n1 - 1)
        table2j = [0] * n1
    elif example_type == '3':
        table1j = list(range(n1))
        table2j = list(range(n1))
    elif example_type == '4':
        table1j = []
        table2j = []
        out_size = 0
        i = 0
        while max(len(table1j), len(table2j), out_size) < n1:
            h = numpy.random.zipf(2)
            w = numpy.random.zipf(2)
            if out_size + h * w > n1: continue
            table1j += [i] * h
            table2j += [i] * w
            out_size += h*w
            i += 1        
    else:
        print("{} is not a valid input class".format(example_type))
        exit()
        
    pad1 = max(0, n1 - len(table1j))
    pad2 = max(0, n1 - len(table2j))
    table1j += [max(table1j + table2j) + 1] * pad1
    table2j += [max(table1j + table2j) + 2] * pad2
    
    # table1d = [random.randint(0, n1-1) for _ in range(len(table1j))]
    # table2d = [random.randint(0, n1-1) for _ in range(len(table2j))]
    # ideally these should be filled with random values as above,
    # but this is problematic if we don't sort at the end
    table1d = table1j[:]
    table2d = table2j[:]
    
    table1 = sorted(zip(table1j, table1d))
    table2 = sorted(zip(table2j, table2d))   
    if exp_file: out = sorted(join(table1, table2))
        
    with open(in_file, 'w+') as file:
        file.write(str(len(table1)) + " " + str(len(table2)) + "\n\n")
        for (j, d) in table1:
            file.write(str(j) + " " + str(d) + "\n")
        file.write("\n")
        for (j, d) in table2:
            file.write(str(j) + " " + str(d) + "\n")

    if exp_file:
        with open(exp_file, 'w+') as file:
            for (d1, d2) in out:
                file.write(str(d1) + " " + str(d2) + "\n")
