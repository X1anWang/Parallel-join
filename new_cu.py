import sys


f1 = open("customer.tbl", "r")
f2 = open("customer"+sys.argv[1]+".tbl", "w")

data1 =  f1.readlines()

for i in range(150000+(int(sys.argv[1]) - 10)*15000):
    f2.write(data1[i])

f1.close()
f2.close()