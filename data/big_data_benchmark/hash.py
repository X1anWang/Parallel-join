import sys
import hashlib

# 2 360002

f1 = open("query3_2_correct.txt", "r")
f2 = open("query3_2_hash.txt", "w")
data1 =  f1.readlines()
f1.close()
url_set = {}
record = 0

for i in range(360000):
    lst = data1[i].split(" ")
    lst2 = lst[1].split(",")
    f2.write(str(int(str(hashlib.sha256(lst[0].encode()).hexdigest())[:16], 16))+" "+lst2[0]+","+lst2[1]+"\n")
    if str(int(str(hashlib.sha256(lst[0].encode()).hexdigest())[:16], 16)) in url_set:
        if lst[0] != url_set[str(int(str(hashlib.sha256(lst[0].encode()).hexdigest())[:16], 16))]:
            record += 1
            print("Collision! "+str(record))
    else:
        url_set[str(int(str(hashlib.sha256(lst[0].encode()).hexdigest())[:16], 16))] = lst[0]

f2.write("\r\n")

i = 360001
while(True):
    if(i == 735555):# 534119 for 1, 734861 for 0, 735555 for 2
        break
    lst = data1[i][:-1]
    lst2 = data1[i+1].split(",")[0][1:]
    f2.write(str(int(str(hashlib.sha256(lst.encode()).hexdigest())[:16], 16))+" "+lst2+"\n")
    i += 2
    if str(int(str(hashlib.sha256(lst.encode()).hexdigest())[:16], 16)) in url_set:
        if lst != url_set[str(int(str(hashlib.sha256(lst.encode()).hexdigest())[:16], 16))]:
            record += 1
            print("Collision! "+str(record))
    else:
        url_set[str(int(str(hashlib.sha256(lst.encode()).hexdigest())[:16], 16))] = lst

print("Length 2 is "+str(len(url_set)))

