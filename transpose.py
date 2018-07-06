#!/usr/bin/python3

from scipy.fftpack import dct
import math
import numpy as np


for a in range(10):
    #read the verilog row output file, a is number of photo
    x = 0
    v = [0.0]*256
    with open("C:/Users/alice/Desktop/data_row_out/row_out{0}.txt".format(a), "r") as file:
        for line in file:
            v[x] = line.strip("\n").split()
            x = x + 1

    #string to int
    for i in range(256):
        for j in range(256):
            v[i][j] = int(v[i][j])

    #transpose the matrix
    v = np.transpose(v).tolist()

    #write the verilog column input file
    with open("C:/Users/alice/Desktop/data_col_in/col_in{0}.txt".format(a), "w") as f:
        for i in range(256):
            for j in range(256):
                f.write(str(v[i][j]))
                f.write(" ")
            f.write("\n")
