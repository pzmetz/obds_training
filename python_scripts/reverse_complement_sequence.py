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

#complement sequence
def complement_sequence(sequence):
    #define length of provided sequence
    length_sequence = len(sequence)
    #define basis of complement string
    complement = ''
    #for each base in the sequence, return the compliment and add it to the previous complement
    for base in sequence:
        complement += complement_base(base)
        #determine length of complement sequence during building
        length_complemented_sequence = len(complement)
        #if the complemented sequence reaches the same length as the input sequence, print the complemented sequence.
        if length_sequence == length_complemented_sequence:
            return(complement)

#reverses your already complemented sequence
def reverse_string(sequence):
    complemented_sequence = complement_sequence(sequence)
    last_position = len(complemented_sequence) -1
    output = ""
    for base in range(last_position, -1, -1):
        output += complemented_sequence[base]
    print(output)
       
def main():
    reverse_string(sequence="AAAAGGGGG")

if __name__ == "__main__":
    main()
    