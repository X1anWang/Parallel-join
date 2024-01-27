
for i in range(10):
    f1 = open("00000"+str(i)+"_0.csv", "r")
    f2 = open(str(i)+".txt", "w")

    data = f1.readlines()
    f2.write(str((len(data) - 1))+"\n")
    f2.write("\n")

    for i in range((len(data) - 1)):
        lst = data[i].split(",")
        f2.write(lst[1]+" "+data[i])
    
    f1.close()
    f2.close()
