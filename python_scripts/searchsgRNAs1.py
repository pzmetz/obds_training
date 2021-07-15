# This programme aims to search identical sequences from a list in one file inside another file that contains a list of DNA sequencing reads on lines.

# input_file = 'refseqactivation.fasta'
# output_file = 'identicalsgRNAreads.csv'
# /home/paul/Documents/Oxford/Sequencing_Oxford_Nanopore/
# Big_FAK52391.fastq
# f1 = open("/data/volume1/PaulMetz/ActivationDirect/RefAnew3.csv")
# fa = f1.readlines()
# f2 = open("/data/volume1/PaulMetz/ActivationDirect/Big_FAK52391.fastq")

f1 = open("/home/paul/Documents/Oxford/Sequencing_Oxford_Nanopore/RefAnew3.csv")
fa = f1.readlines()
f2 = open("/home/paul/Documents/Oxford/Sequencing_Oxford_Nanopore/test33.csv")
fb = f2.readlines()
for lineread in fb:
    for lineref in fa:
        if lineref.strip() in lineread.strip():
            print (lineref)
f2.close()


# pipe output in command prompt to sort <file> | uniq -c > outputfile.csv
