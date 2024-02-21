import sys

# 2 360002

f1 = open("query3_2.txt", "r")
f2 = open("query3_2_correct.txt", "w")
data1 =  f1.readlines()
f1.close()
url_set = {}
record = 1

for i in range(2, 360002):
    f2.write(data1[i])

f2.write("\r\n")

for i in range(360003, 730249):
    if (" " in data1[i]) and (data1[i][0] != " "):
        f2.write(data1[i].split(" ")[0]+"\n")
        f2.write(data1[i].split(" ")[1])
    else:
        f2.write(data1[i])

print("Length 2 is "+str(len(url_set)))

