import sys
import random

name = "input2.txt"
file = open(name, 'w')
a = 2000
b = 2121
file.write(str(a)+" "+str(b)+"\n")
file.write("\n")
#file.write(str(8)+" "+str(random.randint(1, 1024))+"\n")
#file.write(str(8)+" "+str(8)+"\n")
for o in range(a):
    file.write(str(random.randint(1,600))+" "+str(random.randint(1, 10240))+"\n")
file.write("\n")
for o in range(b):
    file.write(str(random.randint(1,600))+" "+str(random.randint(1, 10240))+"\n")
file.close
print(name + " ", end = "")