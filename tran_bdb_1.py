
for i in range(3):
    f1 = open("/home/xian/Parallel-join/bdb_data/rankings/1million/00000"+str(i)+"_0.txt", "r")
    f2 = open("/home/xian/1_"+str(i)+".txt", "w")

    data = f1.readlines()
    f2.write(str((len(data) - 1))+"\n")
    f2.write("\n")

    for i in range((len(data) - 1)):
        lst = data[i].split(",")
        f2.write(lst[1]+" "+data[i])
    
    f1.close()
    f2.close()
