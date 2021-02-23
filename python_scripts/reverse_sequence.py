# -*- coding: utf-8 -*-

"""documentation"""

"""
Created on Mon Jan 25 14:12:21 2021

@author: pzmet
"""

def reverse_string(sequence):
    last_position = len(sequence) -1
    output = ""
    for base in range(last_position, -1, -1):
        output += sequence[base]
    return output

def main():
    reverse_string()

if __name__ == "__main__":
    main()