import sys

# 2 360002

f1 = open("query3_0_correct.txt", "r")
f2 = open("query3_0_hash.txt", "w")
data1 =  f1.readlines()
f1.close()
url_set = {}
record = 1

for i in range(360000):
    lst = data1[i].split(" ")
    lst2 = lst[1].split(",")
    if lst[0] in url_set:
        print("Found")
        f2.write(str(url_set[lst[0]])+" "+lst2[0]+","+lst2[1]+"\n")
    else:
        url_set[lst[0]] = record
        record += 1
        f2.write(str(url_set[lst[0]])+" "+lst2[0]+","+lst2[1]+"\n")

f2.write("\r\n")

i = 360001
while(True):
    if(i == 734861):
        break
    lst = data1[i][:-1]
    lst2 = data1[i+1].split(",")[0][1:]
    if lst in url_set:
        print("Found")
        f2.write(str(url_set[lst])+" "+lst2+"\n")
    else:
        url_set[lst] = record
        record += 1
        f2.write(str(url_set[lst])+" "+lst2+"\n")
    i += 2

print("Length 2 is "+str(len(url_set)))

