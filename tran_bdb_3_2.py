max_len = 0
max_len2 = 0

for i in range(10):
    f1 = open("jan9_3_1_"+str(i)+"_output.txt", "r")
    f2 = open("jan9_3_2_"+str(i)+".txt", "w")
    f3 = open("r00000"+str(i)+"_0.txt", "r")
    data = f1.readlines()
    data2 = f3.readlines()
    f2.write(str((len(data) - 1))+" ")
    f2.write(str((len(data2) - 1))+"\n")
    
    f2.write("\n")

    for i in range((len(data) - 1)):
        lst = data[i].split(",")
        f2.write(lst[1]+" "+data[i])
        if (max_len < len(lst[1])):
            max_len = len(lst[1])
        if (max_len2 < len(data[i])):
            max_len2 = len(data[i])

    f2.write("\r\n")

    for i in range((len(data2) - 1)):
        lst = data2[i].split(",")
        f2.write(lst[0]+" "+data2[i])
        if (max_len < len(lst[0])):
            max_len = len(lst[0])
        if (max_len2 < len(data2[i])):
            max_len2 = len(data2[i])
    
    f1.close()
    f2.close()

print("Max length is "+str(max_len))
print("Max length2 is "+str(max_len2))
