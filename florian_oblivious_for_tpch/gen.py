import random

#power_list = [19]
power_list = [16, 20, 24] # with same length output & power law
#output_times = [4, 16, 64, 256] # with 2^16
output_times = []

# 1 & n : same output input length
for i in power_list:
    name = "1input2power"+str(i)+".txt"
    file = open(name, 'w')
    file.write(str(pow(2,i-1))+" "+str(pow(2,i-1))+"\n")
    file.write("\n")
    file.write(str(8)+" "+str(8)+"\n")
    for o in range(pow(2,i-1) - 1):
        file.write(str(7)+" "+str(7)+"\n")
    file.write("\n")
    for o in range(pow(2,i-1)):
        file.write(str(8)+" "+str(8)+"\n")
    file.close
    print(name + " ", end = "")

# different output

for i in output_times:
    name = "2input2power"+str(i)+"power16.txt"
    file = open(name, 'w')
    file.write(str(pow(2,15))+" "+str(str(pow(2,15)))+"\n")
    file.write("\n")
    file.write(str(8)+" "+str(8)+"\n")
    for o in range(pow(2,15) - 1):
        if (o < i - 1):
            file.write(str(8)+" "+str(8)+"\n")            
        else:
            file.write(str(7)+" "+str(7)+"\n")
    file.write("\n")
    for o in range(pow(2,15)):
        if (o < i * pow(2,15)):
            file.write(str(8)+" "+str(8)+"\n")
        else:
            file.write(str(9)+" "+str(9)+"\n")
    file.close
    print(name + " ", end = "")