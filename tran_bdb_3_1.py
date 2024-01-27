
for i in range(3):
    f1 = open("u00000"+str(i)+"_0.txt", "r")
    f2 = open("jan9_3_1_"+str(10+i)+".txt", "w")

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
