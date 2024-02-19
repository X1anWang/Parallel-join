import sys

f1 = open("/home/xian/tpch/dbgen/supplier.tbl", "r")
f2 = open("/home/xian/tpch/dbgen/supplier.tbl", "r")

data1 = f1.readlines()
data2 = f2.readlines()
f1.close()
f2.close()

file_list = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50]

for o in range(len(file_list)):

    f3 = open("test"+str(file_list[o])+"_2.txt", "w")
    f3.write(str(1000 * o)+" "+str(1000 * o)+"\n")
    f3.write('\n')

    for i in range(1000 * o):
        lst = data1[i].split("|")
        f3.write(lst[3]+" "+data1[i]+"\n")
    f3.write('\r\n')

    for i in range(1000 * o):
        lst = data2[i].split("|")
        f3.write(lst[3]+" "+data2[i]+"\n")
    f3.close()
