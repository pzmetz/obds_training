# Converting your CRISPR library excel file to a csv file:
    # on a mac, conversion of excel files to csv files happens with CR (Carriage return; https://leemendelowitz.github.io/blog/remove-carriage-return-control-character.html).
    # You can convert your mac.csv to unix.csv by using this code in the command line: tr '\r' '\n' < DC_Metrorail_Ridership.mac.csv > DC_Metrorail_Ridership.unix.csv
    # now things like head will work, so you can check the file.
#import packages/modules
import sys

#determine the path of the directory you work in at the moment, whether you are in the cluster or somewhere else.
print(sys.path[0])

# Store the reference for Humagne C in the ref_Humagne_C_opened variable. Here you use the previously established path.
ref_Humagne_C_opened = open("/private/var/folders/sz/w01k4kqn0cbdn3wf4j2tly7r0000gt/T/25bca222/waxing.path.ox.ac.uk/dunnstore/hassan/paul/Git_repository/python_scripts/Humagne_C.D_validation/Humagne_C.csv")
ref_Humagne_C = ref_Humagne_C_opened.readlines()
print(ref_Humagne_C)

#open("/private/var/folders/sz/w01k4kqn0cbdn3wf4j2tly7r0000gt/T/25bca222/waxing.path.ox.ac.uk/dunnstore/hassan/paul/Git_repository/python_scripts/Humagne_C.D_validation/Humagne_D.csv")

#ref_Humagne_D_opened = open("/private/var/folders/sz/w01k4kqn0cbdn3wf4j2tly7r0000gt/T/25bca222/waxing.path.ox.ac.uk/dunnstore/hassan/paul/Git_repository/python_scripts/Humagne_C.D_validation/Humagne_D.csv")
#ref_Humagne_D = ref_Humagne_D_opened.readlines()
#print(ref_Humagne_D)

import os

print(os.getcwd())
