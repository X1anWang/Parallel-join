#!/usr/bin/python3

import sys
import subprocess
import filecmp
import time
from parse import parse


TESTS_PER_N = 20


def find_and_parse(s, lines):
    for line in lines:
        parse_res = parse(s, line)
        if parse_res: return parse_res
    raise Exception("Parsing error")


def run_tests(n):
    all_suc = True
    for i in range(1, TESTS_PER_N + 1):
        # run tests of type 1, 2, 3 once, and then just run tests of type 4
        cmp_suc, hsh = run_test(n, min(i, 4), i)
        if not cmp_suc:
            print("Test {} for input size {} failed. ".format(i, n) +
                  "Output does not match expected.")
            all_suc = False 
        if i > 1 and hsh != prev_hsh:
            print("Test {} for input size {} failed. ".format(i, n) +
                  "Memory trace for same input size has a different hash.")
            all_suc = False
        prev_hsh = hsh
    if all_suc:
        print("All {} tests for n = {} passed succesfully.".format(TESTS_PER_N, n))


def run_test(n, test_type, test_num):
    inp_file = "../inputs/generated/input_{}_{}.txt".format(n, test_num)
    out_file = "../inputs/generated/output_{}_{}.txt".format(n, test_num)
    exp_file = "../inputs/generated/expected_{}_{}.txt".format(n, test_num)
    subprocess.run(["./gen_example.py", str(n), str(test_type), inp_file, exp_file], check=True)

    stdout = subprocess.check_output(["../prototype", inp_file, out_file]).decode('utf-8')
    lines = stdout.rstrip().split('\n')
    
    cmp_suc = filecmp.cmp(out_file, exp_file)
    
    hsh = find_and_parse("Hash of memory trace: {}", lines)[0]
    
    return cmp_suc, hsh


if __name__ == '__main__':
    subprocess.check_output(["make", "-B", "prototype", "LOG_MODE=HASH"], cwd="../")

    for n in [10, 100, 1000, 10000]:
        run_tests(n)
        
    subprocess.check_output(["make", "clean"], cwd="../")
