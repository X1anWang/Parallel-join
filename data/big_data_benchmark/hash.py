import sys

# 2 360002

f1 = open("query3_0_correct.txt", "r")
f2 = open("query3_0_hash.txt", "w")
data1 =  f1.readlines()
f1.close()
url_set = {}
record = 0

for i in range(360000):
    lst = data1[i].split(" ")
    lst2 = lst[1].split(",")
    f2.write(str(hash(lst[0]))[-12:]+" "+lst2[0]+","+lst2[1]+"\n")
    if str(hash(lst[0]))[-12:] in url_set:
        if lst[0] != url_set[str(hash(lst[0]))[-12:]]:
            record += 1
            print("Collision! "+str(record))
    else:
        url_set[str(hash(lst[0]))[-12:]] = lst[0]

f2.write("\r\n")

i = 360001
while(True):
    if(i == 734861):
        break
    lst = data1[i][:-1]
    lst2 = data1[i+1].split(",")[0][1:]
    f2.write(str(hash(lst))[-12:]+" "+lst2+"\n")
    i += 2
    if str(hash(lst))[-12:] in url_set:
        if lst != url_set[str(hash(lst))[-12:]]:
            record += 1
            print("Collision! "+str(record))
    else:
        url_set[str(hash(lst))[-12:]] = lst

print("Length 2 is "+str(len(url_set)))

