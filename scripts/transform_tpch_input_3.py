import sys

f1 = open("/home/xian/tpch/dbgen/customer.tbl", "r")
f2 = open("/home/xian/tpch/dbgen/customer.tbl", "r")

data1 =  f1.readlines()
data2 = f2.readlines()
f1.close()
f2.close()

file_list = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]

for o in range(len(file_list)):
    f3 = open("test"+str(file_list[o])+"_3.txt", "w")
    f3.write(str(o * 1500)+" "+str(o * 1500)+"\n")
    f3.write('\n')

    for i in range(o * 1500):
        lst = data1[i].split("|")
        f3.write(lst[3]+" "+data1[i]+"\n")
    f3.write('\r\n')

    for i in range(o * 1500):
        lst = data2[i].split("|")
        f3.write(lst[3]+" "+data2[i]+"\n")
    f3.close()