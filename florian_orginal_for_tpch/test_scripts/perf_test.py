#!/usr/bin/python3

import sys
import subprocess
import time
from collections import defaultdict, OrderedDict
from parse import parse
from test import find_and_parse


INPUT_SIZES = [1000, 100000, 250000, 500000, 750000, 1000000]
   
    
def perf_test(prog, subtimes=False):
    prog_results = defaultdict(list)
    for n in INPUT_SIZES:
        subprocess.run(["./gen_example.py", str(n), "4", "../input.txt"], check=True)
        
        stdout = subprocess.check_output([prog, "input.txt", "output.txt"], cwd="../").decode('utf-8')
        lines = stdout.rstrip().split('\n')
        subprocess.run(["rm", "../input.txt"])
        subprocess.run(["rm", "../output.txt"])
        
        tot_time = find_and_parse("Total runtime: {:.2f}s", lines)[0]
        prog_results['tot_time'].append(tot_time)
        print("n = {}: {:.2f}s".format(n, tot_time))
        
        if subtimes:
            prog_results['init_sorts'].append(find_and_parse(
                "Sorting concatenated table twice: {:.2f}s", lines)[0])
            prog_results['od_sorts'].append(2*find_and_parse(
                "Sorting within oblivious distribute: {:.2f}s", lines)[0])
            prog_results['od_other_ops'].append(2*find_and_parse(
                "Remaining operations in oblivious distribute: {:.2f}s", lines)[0])
            prog_results['align_sort'].append(find_and_parse(
                "Sorting second expanded table: {:.2f}s", lines)[0])
    
    return prog_results
    
    
def tot_times_to_csv(results):
    with open("perf_results.csv", "w") as csv_file:
        csv_file.write("n {}\n".format(" ".join(results.keys())))
        times = [results[prog]['tot_time'] for prog in results.keys()]
        for line in zip(INPUT_SIZES, *times):
            n, times_per_n = line[0], line[1:]
            csv_file.write("{:d} {}\n".format(n, " ".join(
                ['{:.2f}'.format(t) for t in times_per_n])))
                
                
def breakdown_to_csv(results):
    presults = results['prototype']
    subprocs = ['initsorts', 'odsorts', 'odotherops', 'alignsort']
    with open("breakdown_results.csv", "w") as csv_file:
        csv_file.write("n {}\n".format(" ".join(subprocs + ['other'])))
        times = [presults[subproc] for subproc in subprocs]
        for line in zip(INPUT_SIZES, presults['tot_time'], *times):
            n, tot_time, times_per_n = line[0], line[1], list(line[2:])
            t_other = tot_time - sum(times_per_n)
            csv_file.write("{:d} {}\n".format(n, " ".join(
                ['{:.2f}'.format(t) for t in times_per_n + [t_other]])))            


if __name__ == '__main__':
    results = OrderedDict()
    
    print("Making merge_join")
    subprocess.check_output(["make", "-B", "merge_join"], cwd="../")
    print("\nRunning merge_join")
    results['mergejoin'] = perf_test("./merge_join")
    
    print("\nMaking prototype")
    subprocess.check_output(["make", "-B", "prototype", "SUBTIME=1"], cwd="../")
    print("\nRunning prototype")
    results['prototype'] = perf_test("./prototype", subtimes=True)
    
    print("\nMaking SGX app")
    subprocess.check_output(["make", "-B", "sgx", "SGX_PRERELEASE=1", "SGX_DEBUG=0"], cwd="../")
    print("\nRunning SGX app")
    results['sgx'] = perf_test("./app")
        
    print("\nMaking SGX app (L3)") 
    subprocess.check_output(["make", "-B", "sgx", "SGX_PRERELEASE=1", "SGX_DEBUG=0", "L3=1"], cwd="../")
    print("\nRunning SGX app (L3)")
    results['sgxl3'] = perf_test("./app")
    print()
    
    subprocess.check_output(["make", "clean"], cwd="../")        
       
    tot_times_to_csv(results)
    breakdown_to_csv(results)
    
    subprocess.run(['./draw_graph.py', 'perf_results.csv'], check=True)
    subprocess.run(['./draw_graph.py', 'breakdown_results.csv', '--stacked'], check=True)
