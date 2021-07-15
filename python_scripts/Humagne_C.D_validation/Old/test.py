#!/bin/bash

fastq_file_path = "/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/PM-CandD_S25_L001_R2_001.fastq"

def Determine_C_or_D_gRNAs(fastq_file_path):
    with open(fastq_file_path, 'r') as c_or_d:
        data = c_or_d.readlines()

    c_fastq = [] # List for the lines to be written into C
    d_fastq = [] # List for the lines to be written into D

    for gRNA_sequence_Humagne_C in open("Humagne_C.csv"):
        count = -1
        for line in data:
            count = count + 1
            if gRNA_sequence_Humagne_C in line:
                c_fastq.append(data[count - 1])
                c_fastq.append(data[count])
                c_fastq.append(data[count + 1])
                c_fastq.append(data[count + 2])

    for gRNA_sequence_Humagne_D in open("Humagne_D.csv"):
        count = -1
        for line in data:
            count = count + 1
            if gRNA_sequence_Humagne_D in line:
                d_fastq.append(data[count - 1])
                d_fastq.append(data[count])
                d_fastq.append(data[count + 1])
                d_fastq.append(data[count + 2])

    with open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/reads_Humagne_C.fastq","w") as C:
        for line in c_fastq:
            C.write(line) # Write each line from c into C

    with open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/reads_Humagne_D.fastq","w") as D:
        for line in d_fastq:
            D.write(line) # Write each line from d into D

    return

Determine_C_or_D_gRNAs(fastq_file_path)

#ref_Humagne_C_opened = open("Humagne_C.csv")

# same for Humagne D
#ref_Humagne_D_opened = open("Humagne_D.csv")

# the with statement tells python to do something with an object or file in this case.
# below we say that we want to do something with the opened FASTQ file:
#with open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/test_fastq_files/test.fastq") as file_1:
    # define a variable that contains all the lines in the FASTQ file
#    all_lines = file_1.readlines()
#    count = 0
    # Define start and end position for reading every 4 lines. Python is zero based, so its from 0-3 (lines 0,1,2,3)
#    start = 0
#    end = 4

#    for line in all_lines:
#        count = count + 1

#        desired_lines = all_lines[start:end]
        # We want python to look at each four lines, so we call these the desired_lines, as we need to do something with each 4 lines
        # which is comparing them to the Humagen C and D reference database.
        # So for each set of desired_lines (each four lines) in all the lines, do something
#        for line in desired_lines:
            # for each 4 lines add 4 to the start position, so that will go from 0 to 4 to 8 etc
#            start = start + 4
            # we do the same for the end position
#            end = start + 4
            #
#            if "ATTT" in line:
#                print("yes")
#            else:
#                print("no")

    #        for gRNA_sequence in open("Humagne_C.csv"):
    #            if gRNA_sequence == desired_sequence[18:40]:
    #                print("C")
    #            else:
    #                print("maybe D")













c = [] # List for the lines to be written into C
d = [] # List for the lines to be written into D

#with open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/test_fastq_files/test.fastq","r") as test_fastq: # Open the original file
#    lines = test_fastq.readlines() # and store each line inside a list called lines
#    print(lines)
#    print(len(lines))



#index = 0 # Index of the line

#while index <= len(lines)-1:

#    for n in range(4):
#        if index <= len(lines)-1:
#            r.append(lines[index]) # Append line to r
#            index+=1

#    for n in range(4):
#        if index <= len(lines)-1:
#            f.append(lines[index]) # Append line to f
#            index+=1


#with open('file1.txt','w') as R:
#    for line in r:
#        R.write(line) # Write each line from r into R

#with open('file2.txt','w') as F:
#    for line in f:
#        F.write(line) # Write each line from f into F






#import csv

# Sequence present in fastqfile: TGCCTGTGGCCAATGTGGCTAGGA

#with open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/test_fastq_files/test.fastq") as file_1:
    # define a variable that contains all the lines in the FASTQ file
    #all_lines = file_1.readlines()
    # Define start and end position for reading every 4 lines. Python is zero based, so its from 0-3 (lines 0,1,2,3)
    #start = 0
    #end = 3
    #
    #count = 0
    # We want python to look at each four lines, so we call these the desired_lines, as we need to do something with each 4 lines
    # which is comparing them to the Humagen C and D reference database.
    # So for each set of desired_lines (each four lines) in all the lines, do something
    #for desired_lines in all_lines:
        # for each 4 lines add 4 to the start position, so that will go from 0 to 4 to 8 etc
        #start = start + 4
        # we do the same for the end position
        #end = start + 4
        #
        #count = count + 1
        # here we define desired_lines/each four lines, by using the predefined start and end positions to itterate over all_lines
        #desired_lines = all_lines[start:end]
        #print(desired_lines)
        #print(count)
        # For each four lines, we have one line that contains the sequence we want to compare to the Humagne reference database, which is the second line, which is position 1 (zero based)




#sequence1 = "TCTCTCTCTCTCTCTCA"
#sequence2 = "xxxxAAGGGACTAAACGAGCTTGTCGA"

#test_fastq_file = open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/test_fastq_files/test.fastq")

#if sequence1[5:7] == sequence2[5:7]:
#    print("hoi")

#for line in open("Humagne_C.csv"):
#    if line == sequence2[4:27]:
#        print("yes")
#    else:
#        print("no")

#for line in open("/dunnstore/hassan/paul/HumagneC.D_validation/Fastq_files/test_fastq_files/test.fastq"):
#    if line == sequence2[4:27]:
#        print("yes")
#    else:
#        print("no")


#ref_Humagne_C_opened = open("Humagne_C.csv", 'rb')
#ref_Humagne_C = ref_Humagne_C_opened.readline()

#sequence = "GGTCGGAACAAGTCTGCTATTTG"

#for line in ref_Humagne_C_opened:
#    print(line)

#ref_Humagne_C_test = csv.reader("Humagne_C.csv")
#print(ref_Humagne_C_test)

#with open("Humagne_C.csv") as csv_file:
#csv_reader = csv.reader(csv_file, delimiter=',')

#print(csv_reader)
#count = 0

#for line in ref_Humagne_C_opened:
    #print(line)
#    if line == sequence:
#        count = count + 1

#print(count)


#print(ref_Humagne_C)

#for gRNA_sequence in ref_Humagne_C:
#    if gRNA_sequence in desired_sequence:
#        print("C")
#    else:
#        print("no, maybe D")
#"/dunnstore/hassan/paul/HumagneC.D_validation/FastQC_files/PM-CandD_S25_L001_R2_001.fastq"
