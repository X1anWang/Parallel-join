
max_len = 0
max_len2 = 0

for i in range(10):
    f1 = open("tree_two_user_"+str(i)+"_output.txt", "r")
    f2 = open("bdb3_3_"+str(i)+".txt", "w")

    data = f1.readlines()
    f2.write(str((len(data) - 1))+"\n")
    f2.write("\n")

    for i in range((len(data) - 1)):
        lst = data[i].split(",")
        lst2 = data[i].split(lst[1])
        my_float = lst[3]
        if ("E" in my_float):
            my_float_ = my_float.split("E")
            my_float = float(my_float_[0]) * pow(10, float(my_float_[1]))
        f2.write(lst[0]+" "+lst2[2].split(",")[1]+" "+str(my_float)+"\n")
        if (max_len < len(lst[0])):
            max_len = len(lst[0])
    
    f1.close()
    f2.close()


print("Max length is "+str(max_len))
print("Max length2 is "+str(max_len2))