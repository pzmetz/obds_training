from Bio import SeqIO
import csv
from collections import OrderedDict
import numpy as np
import sys
import argparse

fastq_file_path = "/dunnstore/hassan/paul/HumagneC.D_validation/09-21_OxfordGenomics_FASTQ_files/WTCHG_893669_1_Humagne_C_original.fastq"

def count_perfect_matches(fastq_file_path):
    with open(fastq_file_path, 'r') as data_C_original_file:
        data_C_original = data_C_original_file.readlines()
        count = 0
        print(count)
        with open("Humagne_C_ref.csv", mode='rU') as ref_C:
            reader = csv.reader(ref_C)
            dictionary = {rows[0]: 0 for rows in reader}
            for line in data_C_original:
                for gRNA_sequence_Humagne_C in dictionary:
                    if gRNA_sequence_Humagne_C in line:
                        count = count + 1
                        print(count)
    return
count_perfect_matches(fastq_file_path)
