#!/usr/bin/python3


import numpy as np
import matplotlib.pyplot as plt
from parse import parse


xx = []
yy = []
tt = []

x = 0
with open('trace.txt') as file:
    for line in file.readlines():
        for word in line.rstrip().split(' '):
            t, r, n = parse('{}:{:n}[{:n}]', word)
            
            xx.append(x)
            yy.append(n)
            tt.append(t)

            x += 1
    
expand_by = 5
A = np.ones((max(xx) + 1, expand_by * (max(yy) + 1)))
for i in range(len(xx)):
    for j in range(expand_by):
        A[xx[i], expand_by * yy[i] + j % expand_by] = 0 if tt[i] == "W" else 0.6

plt.matshow(np.flip(A.transpose(), 0), cmap='gray')
plt.xlim(-1, A.shape[0] + 1)
plt.ylim(-1, A.shape[1] + 1)
plt.axis('off')
plt.savefig('trace_graph.png', bbox_inches='tight', dpi=300)
