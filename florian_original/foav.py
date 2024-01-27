#!/usr/bin/python3

import re
import linecache

EXTRACTED_FUNCTION_NAMES = []

#TODO: Convert this to a function with the 64 bit names, that can translate it to all its smaller variants
REGISTER_DICTIONARY =  {
  "%rax": ["%eax", "%ax", "%al"], 
  "%rbx": ["%ebx", "%bx", "%bl"], 
  "%rcx": ["%ecx", "%cx", "%cl"],
  "%rdx": ["%edx", "%dx", "%dl"],
  "%r8" : ["%r8d", "%r8w", "%r8b", "%r8l"], 
  "%r9" : ["%r9d", "%r9w", "%r9b", "%r9l"], 
  "%r10" : ["%r10d", "%r10w", "%r10b", "%r10l"], 
  "%r11" : ["%r11d", "%r11w", "%r11b", "%r11l"], 
  "%r12" : ["%r12d", "%r12w", "%r12b", "%r12l"], 
  "%r13" : ["%r13d", "%r13w", "%r13b", "%r13l"], 
  "%r14" : ["%r14d", "%r14w", "%r14b", "%r14l"], 
  "%r15" : ["%r15d", "%r15w", "%r15b", "%r15l"], 
  "%rbp" : ["%ebp", "%bp", "%bpl"],
  "%rsi" : ["%esi", "%si", "%sil"],
  "%rdi" : ["%edi", "%di", "%dil"],
  "%rsp" : ["%esp", "%sp", "%spl"],
}


#FILE_TO_VERIFY = "../BOS.s"
#FILE_TO_VERIFY = "../WN.s"
#FILE_TO_VERIFY = "../Enclave/asm/TightCompaction/TightCompaction_v2.s"
FILE_TO_VERIFY = "Enclave.s"

conditional_jumps = []
line_num = 1

FLAG_MANIPULATING_OPERATORS = ["cmp", "test", "sub", "dec", "and", "testb"]
MOV_OPERATION = ["mov"]

cond_branch = re.compile('\s*j[a-z]+\s*')
non_cond_branch = re.compile('\s*jmp\s*')
label_re = re.compile('\s*\.L[0-9]+:')

num_cond_branch = 0
num_non_cond_branch = 0

cond_branches_at = []
cond_branches_to_label = []
cond_branches_to_line_num = []
label_to_line_num={}

last_local_jump_line = 0

CloseAnalysisRequired = []

# An lea instruction can utmost use 5 operands in this fashion: c leq(op1, op2, op3), op4
# Above line moves (op1 + (op2 * op3))+c -> op4
# leaParser always gets lines with \t's replaced with ' '
def leaParser(line):
  print("LEAParser:")
  print(line)
  c = ""
  op1 = ""
  op2 = ""
  op3 = ""
  op4 = ""
  line = line.strip()
  words = line.split(' ')
  op4 = words[2]
  # Dropping the trailing comma:
  full_op1 = words[1][:-1]
  new_words = full_op1.split('(')  

  if(len(new_words)==1):
    left_op1 = new_words[0]
  else:
    c=new_words[0]
    left_op1 = new_words[1]


  sub_ops = left_op1.split(',')
  if(len(sub_ops)==3):
    # leading ( already dropped while extracting c
    op1 = sub_ops[0]
    op2 = sub_ops[1]
    #drop trailing )
    op3 = sub_ops[2][:-1]
  elif(len(sub_ops)==2):
    op1 = sub_ops[0]
    op2 = sub_ops[1][:-1]
  else:
    op1 = sub_ops[0][:-1]
  print("Lea extracted operands:") 
  print("c=%s, op1=%s, op2=%s, op3=%s, op4=%s"%(c, op1, op2, op3, op4))
  print(c, op1, op2, op3, op4)
  return c, op1, op2, op3, op4 


def convertRegisterTo64BitName(op):
  for key in REGISTER_DICTIONARY:
    if op in REGISTER_DICTIONARY[key]:
      return key
  return op

def stopBacktrack(line):
  words = line.split(' ')
  if(words[0]=="jmp"):
    return True
  else:
    if(len(words)==1):
      if(words[0][:-1] in EXTRACTED_FUNCTION_NAMES):
        return True
  
  return False

'''
  extractmovOperands(line):
  Expects line to be an instruction line with 2 operands.
'''
def extractOperands(line):
  line = line.strip()
  print(line)
  pieces = line.split(",")
  words = pieces[0].split(" ")
  print(words)
  new_words = [x for x in words if x != '']
  print(new_words)
  op1 = new_words[1].strip(",")
  if(len(pieces)>=2):
    op2 = pieces[1].strip(" ")
  else:
    op2 = None
  return op1, op2

def addEquivalents(var_list, equivalence_list, interest_var):
  if(interest_var in equivalence_list):
    for l in equivalence_list[interest_var]:
      var_list.add(l)


def checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index):
  print("FMI_operands:")
  print(fmi_operands)
  print("FMI_equivalents:")
  print(fmi_equivalents)
  print("FOAV_SAFE_locations:")
  print(FOAV_SAFE_locations)
  
  if(fmi_operands.issubset(FOAV_SAFE_locations)):
    COND_BRANCH_STATUS[branch_index] = 1
    print("Close analyses resolved branch at %d" % (cond_branches_at[branch_index]))
    print(fmi_operands)
    print(FOAV_SAFE_locations)
    return True
  elif(fmi_equivalents):
    fmi_set = fmi_operands
    # Replace each element of fmi_set with one of its fmi_equivalents, and check if it's a subset
    # If only one operand
    if(len(fmi_equivalents)==1):
      #Check which of the operands we have in fmi_equivalent
      operand_with_equivalents = list(fmi_equivalents.keys())[0]
      if(len(fmi_operands)==1):
        for i in fmi_equivalents[operand_with_equivalents]:
          test_set = set()
          test_set.add(i)
          if(test_set.issubset(FOAV_SAFE_locations)):
            COND_BRANCH_STATUS[branch_index] = 1
            print("Close analyses resolved branch at %d" % (cond_branches_at[branch_index]))
            print(fmi_operands)
            print(FOAV_SAFE_locations)
            return True
      else:
        #Extract the operand without any other equivalents
        fmi_temp_set = set()
        fmi_temp_set.add(operand_with_equivalents)
        operand_without_equivalents = list(fmi_operands.difference(fmi_temp_set))[0]
        for i in fmi_equivalents[operand_with_equivalents]:
          test_set = set()
          test_set.add(operand_without_equivalents)
          test_set.add(i)
          if(test_set.issubset(FOAV_SAFE_locations)):
            COND_BRANCH_STATUS[branch_index] = 1
            print("Close analyses resolved branch at %d" % (cond_branches_at[branch_index]))
            print(fmi_operands)
            print(FOAV_SAFE_locations)
            return True
    # If 2 operands
    else:
      for i in fmi_equivalents[list(fmi_operands)[0]]:
        for j in fmi_equivalents[list(fmi_operands)[1]]:
          test_set = set()
          test_set.add(i)
          test_set.add(j)
          if(test_set.issubset(FOAV_SAFE_locations)):
            COND_BRANCH_STATUS[branch_index] = 1
            print("Close analyses resolved branch at %d" % (cond_branches_at[branch_index]))
            print(fmi_operands)
            print(FOAV_SAFE_locations)
            return True

  else:
    return False

'''
  closeAnalyze: 
  Compilers do weird things.
  We care about figuring out the contents/safety of the values in the fmi_operands list.
  So in closeAnalyze, we follow the variables in the fmi_operand list, starting from the line
  just before the conditonal jump on fmi_operands (or even the comparison line itself?),

  We extract all the mov's that come before this conditional jump, and check if:
    i) A register that FOAV has declared as safe, is being moved from/to a register(R) in the fmi_operands
    ii) A constant is being moved to a register(R) in the fmi_operands
  In both cases we mark R as safe now.
'''
def closeAnalyze(CloseAnalysisRequired, COND_BRANCH_STATUS):
  for record in CloseAnalysisRequired:
   
    non_fmi_equivalents = {} 
    fmi_equivalents = {}
    branch_index = record[0]
    line_start = record[1]
    # NOTE: We may want to go beyond just the last jump! This might needs to be more clever.
    line_end = record[2]
    fmi_operands = record[3]
    FOAV_SAFE_locations = record[4]
    FOAV_SAFE_locations.add("%rsp")
    #FOAV_SAFE_locations.add("%rsi")

    line_num = line_start
    print("Analyzing branch at %d:" % (cond_branches_at[branch_index]))
    print("fmi_operands",)
    print(fmi_operands)
    print("FOAV_SAFE_locations",)
    print(FOAV_SAFE_locations)

    line = linecache.getline(FILE_TO_VERIFY, line_num).strip()
    line = line.replace('\t', ' ') 

    #while(line_num != line_end):
    while(stopBacktrack(line)!=True):
      words = line.split(' ')
      if(len(words)>2):

        if(words[1] == "FOAV"):
          op = (words[4])[1:-1]
          FOAV_SAFE_locations.add(op) 
          FOAV_SAFE_locations.add(convertRegisterTo64BitName(op)) 
          print(line_num, "Added to FOAV_SAFE_locations. FOAV_SAFE_locations:")
          print(FOAV_SAFE_locations)
          if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
            break

        #If a register has been wiped clean, it is SAFE
        if("xor" in words[0]):
          op1, op2 = extractOperands(line)
          op1 = convertRegisterTo64BitName(op1) 
          op2 = convertRegisterTo64BitName(op2)
          if(op1 == op2):
            FOAV_SAFE_locations.add(op1)
            FOAV_SAFE_locations.add(op2)
            FOAV_SAFE_locations.add(convertRegisterTo64BitName(op2))
             
        if("mov" in words[0]):
          # Extract the operands of mov ()
          op1, op2 = extractOperands(line)
          op1 = convertRegisterTo64BitName(op1) 
          op2 = convertRegisterTo64BitName(op2)
          print(line)
          print("Operands = (%s,%s)" %(op1, op2))

          # If we move a constant to a register X, mark X as safe
          if(op1[0]=="$"):
            FOAV_SAFE_locations.add(op2)
            FOAV_SAFE_locations.add(convertRegisterTo64BitName(op2))
            addEquivalents(FOAV_SAFE_locations, non_fmi_equivalents, op2)       
            print("Moved constant to register %s." % (op2))
            print(line_num, FOAV_SAFE_locations)
            if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
              break

          # If we are moving a value from a SAFE register to register X, mark X as safe as well
          # or if we are moving a value from a register X to a SAFE register, mark X as safe as well
          elif ((op2 in FOAV_SAFE_locations) or (op1 in FOAV_SAFE_locations)):
            FOAV_SAFE_locations.add(op1)
            FOAV_SAFE_locations.add(op2)
            addEquivalents(FOAV_SAFE_locations, non_fmi_equivalents, op1)       
            addEquivalents(FOAV_SAFE_locations, non_fmi_equivalents, op2)       
            FOAV_SAFE_locations.add(convertRegisterTo64BitName(op1))
            FOAV_SAFE_locations.add(convertRegisterTo64BitName(op2))
            print("Moving SAFE marked register to another or reverse. Hence marking both %s and %s as safe" % (op1, op2)) 
            print(line_num, FOAV_SAFE_locations)
            if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
              break
          
          # If register X gets moved into one of the fmi_operands, we should track it in case the compiler
          # moves a SAFE value into register X before this, making the fmi_operand safe
          # if the move destination is in FOAV_SAFE_locations
          # then we should move the source to safe_locations as well
          elif ((op2 in fmi_operands)):
            if(op2 in fmi_equivalents):
              fmi_equivalents[op2].append(op1)
            else:
              fmi_equivalents[op2]=[op1]

            if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
              break

          # Reverse of above clause 
          elif ((op1 in fmi_operands)):
            if(op1 in fmi_equivalents):
              fmi_equivalents[op1].append(op1)
            else:
              fmi_equivalents[op1]=[op1]

            if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
              break
          
          # Tracking registers that are not fmi nor SAFE yet
          else:
            if(op2 in non_fmi_equivalents):
              non_fmi_equivalents[op2].append(op1)
            else:
              non_fmi_equivalents[op2] = [op1]

            if(op1 in non_fmi_equivalents):
              non_fmi_equivalents[op1].append(op2)
            else:
              non_fmi_equivalents[op1] = [op2]

            addEquivalents(FOAV_SAFE_locations, non_fmi_equivalents, op1)

            if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
              break

        elif("lea" in words[0]):
          c, op1, op2, op3, op4 = leaParser(line)
          if(op2=='' and op3==''):
            if((op4 in FOAV_SAFE_locations) or (op1 in FOAV_SAFE_locations)):
              FOAV_SAFE_locations.add(op1)
              FOAV_SAFE_locations.add(op4)
            if(op4 in fmi_operands):
              if(op4 in fmi_equivalents):
                fmi_equivalents[op4].append(op1)
              else:
                fmi_equivalents[op4]=[op1]
              print("LEA: fmi_equivalents")
              print(fmi_equivalents)
          if(c=='' and op3==''):
            if(op1 in FOAV_SAFE_locations and op2 in FOAV_SAFE_locations):
              FOAV_SAFE_locations.add(op4) 

          if(checkSAFE(fmi_operands, fmi_equivalents, FOAV_SAFE_locations, branch_index)):
            break
      line_num-=1 
      line = linecache.getline(FILE_TO_VERIFY, line_num).strip()
      line = line.replace('\t', ' ') 
    print("\n\n")      
  return 


# MAIN PROGRAM:

with open(FILE_TO_VERIFY, "r") as f:
  for line in f:
    if(line=="1:\n"):
      last_local_jump_line = line_num
    elif(re.match(label_re, line)!=None):
      label=((line.strip()).split(':'))[0]
      label_to_line_num[label]=line_num
    elif(re.match(cond_branch, line)!=None):
      if(re.match(non_cond_branch, line)==None):
        cond_branches_at.append(line_num)
        line = line.strip()
        # regular expression to extract all words (possibly with '.'s in them)
        words = re.findall(r"[\.\w']+", line)
        #print(words[1])
        cond_branches_to_label.append(words[1])

        if(words[1]=="1b"):
          cond_branches_to_line_num.append(last_local_jump_line)
        else:
          #print(words[1])
          cond_branches_to_line_num.append("?")

        num_cond_branch+=1
      else:
        num_non_cond_branch+=1
    else:
      line=line.strip()
      line = line.replace('\t', ' ')
      words=(line.strip()).split(" ")
      if(words[-1]=="@function"):
        #Found a function
        function_name = words[1].strip(",")
        print("FOUND function: %s"%(function_name))
        EXTRACTED_FUNCTION_NAMES.append(function_name)

    line_num+=1


for i in range(len(cond_branches_to_label)):
  if(cond_branches_to_line_num[i]=='?'):
    label = cond_branches_to_label[i]
    cond_branches_to_line_num[i]=label_to_line_num[label]


print("Num NON-cond_branch = %d" % (num_non_cond_branch))
print("Num cond_branch = %d" % (num_cond_branch))
print("Conditional branches are at:")
print(cond_branches_at)
#print("Those conditional branches jump to:")
#print(cond_branches_to_line_num)

# Now we'll find the FLAG_MANIPULATING_OPERATORS before each of those conditional jumps
line_num = 1
current_branch_index = 0
MAX_CBI = len(cond_branches_at)
current_cond_branch_line = cond_branches_at[current_branch_index]
#current_fmil = current_flag_manipulation_instruction_line
current_fmil = -1
current_fmi = ""
FOAV_LIST=[]

COND_BRANCH_STATUS = [0] * MAX_CBI

with open(FILE_TO_VERIFY, "r") as f:
  for line in f:
    line = line.strip()
    line = line.replace('\t', ' ')
    words = line.split(" ")
    #print("line_num = %d, current_cond_branch_line = %d, current_branch_index = %d, len(words) = %d" %(line_num, current_cond_branch_line, current_branch_index, len(words)))
 
    #We don't care if the line only had one word or lesser (just labels or empty lines)
    if(len(words)>1):
      for l in FLAG_MANIPULATING_OPERATORS:
        if(l in words[0]):
          current_fmil = line_num
          current_fmi = line
          print("%d: %s" %(current_fmil, current_fmi))

      if(len(words)>=3):
        if(words[1]=="FOAV"):
          FOAV_LIST.append(line)
      
      if(line_num == current_cond_branch_line):
        # Now check that the operands in current_fmi have been labelled by FOAV as safe
        # Extract operands in current_fmi 
        fmi_operands = set()
        print(current_fmi)
        op1, op2 = extractOperands(current_fmi)
        #Skip operands that are constants!
        if(op1[0]!='$'):
          op1 = convertRegisterTo64BitName(op1)
          fmi_operands.add(op1)
        if(op2!=None and op2[0]!='$'):
          op2 = convertRegisterTo64BitName(op2)
          fmi_operands.add(op2)

        # Check if fmi_op1 and fmi_op2 are marked as safe by FOAV lines
        FOAV_SAFE_locations = set()
        print(FOAV_LIST)
        for l in FOAV_LIST:
          l = l.strip()
          foav_words = l.split(" ")
          foav_safe_register = (foav_words[4])[1:-1]
          foav_safe_register = convertRegisterTo64BitName(foav_safe_register)
          FOAV_SAFE_locations.add(foav_safe_register)
        print("For c-branch at %d: FOAV_SAFE_LOCATIONS:" %(line_num))
        print(FOAV_SAFE_locations)
        
        # If all of the fmi_operands are in FOAV_SAFE_locations, this cond_branch is marked SAFE
        branch_is_safe = 1
        for op in fmi_operands:
          if(op not in FOAV_SAFE_locations):
            branch_is_safe=0
        COND_BRANCH_STATUS[current_branch_index]=branch_is_safe
        if(branch_is_safe==0):
          #Looks like we cound't resolve this branch with simple parsing tricks:
          analysis_entry = []
          analysis_entry.append(current_branch_index)
          analysis_entry.append(line_num-1)
          if(current_branch_index>2):
            analysis_entry.append(cond_branches_at[current_branch_index-2])          
          else:
            analysis_entry.append(cond_branches_at[0])
          analysis_entry.append(fmi_operands)          
          analysis_entry.append(FOAV_SAFE_locations)
          CloseAnalysisRequired.append(analysis_entry)
          print("ALARM!")

        #Refresh the FOAV_LIST
        FOAV_LIST=[]

        current_branch_index+=1
        if(current_branch_index < MAX_CBI):
          current_cond_branch_line = cond_branches_at[current_branch_index]       
 
    line_num+=1


'''
print("Things to analyze closely:")
for i in CloseAnalysisRequired:
  print(i)
'''

num_safe = sum(COND_BRANCH_STATUS)
print("%d of %d conditional branches are marked as SAFE" % (num_safe, MAX_CBI))
closeAnalyze(CloseAnalysisRequired, COND_BRANCH_STATUS)

num_safe = sum(COND_BRANCH_STATUS)
print("%d of %d conditional branches are marked as SAFE" % (num_safe, MAX_CBI))

print("Line numbers of unresolved COND_BRANHCES:")
for i in range(len(COND_BRANCH_STATUS)):
  if(COND_BRANCH_STATUS[i]==0):
    print(cond_branches_at[i])    
