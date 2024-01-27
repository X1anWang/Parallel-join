#!/usr/bin/python3

import sys
import os
import csv
from collections import OrderedDict
import matplotlib.pyplot as plt


def draw_graph(input_sizes, results, image_name):
    plt.rc('font', size=14)
    plt.ticklabel_format(style='sci', axis='x', scilimits=(0,0), useMathText='true')
    plt.xlabel(r"Input Size ($n$)")
    plt.ylabel("Runtime (s)")
    plt.grid(axis='y', linestyle='--')
    for case in results.keys():
        plt.plot(input_sizes, results[case], marker='o', label=case)
    plt.legend()
    plt.tight_layout()
    plt.savefig(image_name)
    
    
def draw_stacked_bar(input_sizes, results, image_name):
    plt.rc('font', size=14)
    plt.ticklabel_format(style='sci', axis='x', scilimits=(0,0), useMathText='true')
    plt.xlabel(r"Input Size ($n$)")
    plt.ylabel("Runtime (s)")
    subproc_list = list(results.keys())
    for c, subproc in enumerate(subproc_list):
        csum = []
        for i in range(len(input_sizes)):
            csum.append(sum([results[subproc][i] for subproc in subproc_list[:c]]))
        plt.bar(input_sizes, results[subproc], bottom=csum, label=subproc)
    plt.legend()
    plt.tight_layout()
    plt.savefig(image_name)


if __name__ == '__main__':

    input_sizes = []
    results = OrderedDict()
    
    with open(sys.argv[1], 'r') as csv_file:
        csvr = csv.DictReader(csv_file, delimiter=' ')
        for key in csvr.fieldnames[1:]: results[key] = []
        for row in csvr:
            input_sizes.append(row['n'])
            for key in results.keys():
                results[key].append(float(row[key]))
      
    image_name = os.path.splitext(sys.argv[1])[0] + '.png'
    if len(sys.argv) < 3 or sys.argv[2] != '--stacked':
        draw_graph(input_sizes, results, image_name)
    else:
        draw_stacked_bar(input_sizes, results, image_name)
        