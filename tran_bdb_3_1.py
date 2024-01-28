
for i in range(3):
    f1 = open("/home/xian/Parallel-join/bdb_data/uservisits/1million/00000"+str(i)+"_0.txt", "r")
    f2 = open("/home/xian/3_1_"+str(i)+".txt", "w")

    data = f1.readlines()
    f2.write(str((len(data) - 1))+"\n")
    f2.write("\n")

    for i in range((len(data) - 1)):
        lst = data[i].split(",")
        ip = lst[0].split(".")
        mytime = lst[2].split("-")
        f2.write(mytime[0]+mytime[1]+mytime[2]+" "+data[i])
    
    f1.close()
    f2.close()
