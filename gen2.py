import random

power_list = [16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40] # with same length output & power law
data_max = 1000
temp = ""

# 1 & n : same output input length
for i in power_list:
    a =[]
    b =[]
    name = "input_2power_of_"+str(i)+".txt"
    file = open(name, 'w')
    file.write(str(pow(2,i-1))+" "+str(pow(2,i-1))+"\n")
    file.write("\n")
    num_so_far = 0
    num_left = pow(2, i - 1)
    num_max = pow(2, i - 1)
    for o in range(pow(2, i - 1)):
        if num_left == 0:
            a.append(o)
            b.append(num_max)
            continue
        num_first = random.randint(1,num_left)
        num_second = random.randint(1,int(num_left/num_first))
        num_copy = num_first * num_second
        if (num_copy <= num_copy):
            num_left -= num_copy
            for u in range(num_first):
                a.append(o)
            for u in range(num_second):
                b.append(o)
        else:
            a.append(o)
            b.append(num_max)
            continue

    if 0 < num_left:
        for o in range(num_left):
            a.append(num_max + 1)
            b.append(num_max + 1)
    
    
    if len(a) < num_max:
        for o in range(len(a), num_max):
            a.append(o)
    
    if len(b) < num_max:
        for o in range(len(b), num_max):
            b.append(num_max)

    
    for o in range(num_max):
        file.write(str(a[o])+" "+str(random.randint(1, data_max))+"\n")
    file.write("\n")
    for o in range(num_max):
        file.write(str(b[o])+" "+str(random.randint(1, data_max))+"\n")
    file.close
    print(name + " ", end = "")
