import sys

f1 = open("query3_0.txt", "r")
data1 =  f1.readlines()
f1.close()
first_set = set()
second_set = set()

for i in range(2, 360002):
    lst = data1[i].split(" ")
    if not (lst[0] in first_set):
        first_set = first_set | {lst[0]}

print("Length 1 is "+str(len(first_set)))

for i in range(360003, 531461):
    lst = data1[i].split(" ")
    if not (lst[0] in second_set):
        second_set = second_set | {lst[0]}

print("Length 2 is "+str(len(second_set)))

