import random
from math import floor

def rand_divisor(input_value):
    if input_value == 3:
        return 1,3
    if input_value == 2:
        return 1,2
    if 4 < floor(input_value // 2):
        rand_factor = floor(input_value // 2)
    else:
        rand_factor = 4
    
    list_ = [rand_factor, 3, 2, 1]
    for factor in list_:
        if input_value % factor == 0:
            return factor, floor(input_value // factor)
            
power_list = [16, 18, 20, 22, 24, 26, 28, 30]
data_max = 100

for i in power_list:
    name = "join_input_power_law_2power_"+str(i)+".txt"
    file = open(name, 'w')
    file.write(str(pow(2,i-1))+" "+str(pow(2,i-1))+"\n")
    file.write("\n")

    num = 0
    unmatch_value_1 = pow(2, i) + 1
    unmatch_value_2 = pow(2, i) + 2
    c = pow(2, i-1) / 4.605170185
    length_ = pow(2, i-1)
    current_size = 0
    num1 = 0
    num2 = 0
    list_a = []
    list_b = []
    o = 1
    while(True):
        if (length_ < o) or (length_ <= current_size):
            break
        
        if (length_ - current_size) < (c * 1 / (o)):
            num = length_ - current_size
        else:
            num = floor(c * 1 / (o))
        
        current_size += num
        num1, num2 = rand_divisor(num)

        for n in range(num1):
            list_a.append(o)

        for n in range(num2):
            list_b.append(o)
        
        o += 1

    for o in list_a:
        file.write(str(o)+" "+str(random.randint(1, data_max))+"\n")
    left_num = length_ - len(list_a)
    for o in range(left_num):
        file.write(str(unmatch_value_1)+" "+str(random.randint(1, data_max))+"\n")
    file.write("\n")

    for o in list_b:
        file.write(str(o)+" "+str(random.randint(1, data_max))+"\n")
    left_num = length_ - len(list_b)
    for o in range(left_num):
        file.write(str(unmatch_value_2)+" "+str(random.randint(1, data_max))+"\n")
    print(name + " ", end = "")