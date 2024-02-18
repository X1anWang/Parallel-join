import random

power_list = [16, 18, 20, 22, 24, 26, 28, 30]
data_max = 100

for i in power_list:
    name = "join_input_1xn_2power_"+str(i)+".txt"
    file = open(name, 'w')
    file.write(str(pow(2,i-1))+" "+str(pow(2,i-1))+"\n")
    file.write("\n")
    join_n_value = str(random.randint(1, (pow(2,i-1) - 1)))
    #for o in range(pow(2,i-1)):
    for o in range(10):
        file.write(join_n_value+" "+str(random.randint(1, data_max))+"\n")
    """
    file.write("\n")
    for o in range(pow(2,i-1)):
        file.write(str(o+1)+" "+str(random.randint(1, data_max))+"\n")
    """
    file.close
    print(name + " ", end = "")