import sys


f1 = open("supplier.tbl", "r")
f2 = open("supplier"+sys.argv[1]+".tbl", "w")

data1 =  f1.readlines()

for i in range(10000+(int(sys.argv[1]) - 10)*1000):
    f2.write(data1[i])

f1.close()
f2.close()