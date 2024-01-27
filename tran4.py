import sys

f1 = open("lineitem.tbl", "r")
f2 = open("orders.tbl", "r")

f3 = open("test"+sys.argv[1]+"_4.txt", "w")
data1 =  f1.readlines()
data2 = f2.readlines()
f3.write(str(len(data1))+" "+str(len(data2))+"\n")
f3.write('\n')

for i in range(len(data1)):
    lst = data1[i].split("|")
    f3.write(lst[0]+" DATA")
f3.write('\r\n')

for i in range(len(data2)):
    lst = data2[i].split("|")
    f3.write(lst[0]+" DATA")
f1.close()
f2.close()
f3.close()