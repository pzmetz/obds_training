# Converting your CRISPR library excel file to a csv file:
    # on a mac, conversion of excel files to csv files happens with CR (Carriage return; https://leemendelowitz.github.io/blog/remove-carriage-return-control-character.html).
    # You can convert your mac.csv to unix.csv by using this code in the command line: tr '\r' '\n' < DC_Metrorail_Ridership.mac.csv > DC_Metrorail_Ridership.unix.csv
    # now things like head will work, so you can check the file.

import csv

#open and read lines of Humagne C
ref_Humagne_C_opened = open("/Users/paul/Bioinformatics/python_scripts/Humagne_C.D_validation/Humagne_C.csv")
ref_Humagne_C = ref_Humagne_C_opened.readlines()

#open and read lines of Humagne D
ref_Humagne_D_opened = open("/Users/paul/Bioinformatics/python_scripts/Humagne_C.D_validation/Humagne_D.csv")
ref_Humagne_D = ref_Humagne_D_opened.readlines()

print(ref_Humagne_C)



print("hello")
