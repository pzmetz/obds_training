# -*- coding: utf-8 -*-

"""documentation"""

"""
Created on Mon Jan 25 14:12:21 2021

@author: pzmet
"""
print("hello")
def complement_base(base):
    output = None
    if base == 'A':
        output = 'T'
    elif base == 'G':
        output = 'C'
    elif base == 'C':
        output = 'G'
    elif base == 'T':
        output = 'A'
    else:
        print("Unknown base")
    return output

def reverse_complement_sequence(sequence):
    reverse_sequence = sequence[::-1]
    length_sequence = len(reverse_sequence)
    complement = ''
    for base in reverse_sequence:
        complement += complement_base(base)
        length_complemented_sequence = len(complement)
        if length_sequence == length_complemented_sequence:
            print(complement)
        
def main():
    reverse_complement_sequence(sequence="ATGTGGTA")
    
if __name__ == "__main__":
    main()
    