#!/usr/bin/python3
#

from scipy.fftpack import dct
import numpy as np


#read the input file
x = 0
p = [0.0]*256
p2 = [0.0]*256
with open("C:/Users/alice/Desktop/col_in1.txt", "r") as file:
    for line in file:
        p[x] = line.strip("\n").split()
        x = x + 1


#string to int
for i in range(256):
    for j in range(256):
        p[i][j] = float(int(p[i][j])>>10)
p2 = np.asarray(p)


#normalize twice
for i in range(256):
    for j in range(256):
        p[i][j] = p[i][j]/256/256


#list to numpy
p = np.asarray(p)


#2D DCT
p = dct(dct(p.T).T)/2/2


#numpy to list
p = p.tolist()


#1D DCT
for i in range(256):
    p2[i] = dct(p2[i]/256)/2

'''
#transpose
p2 = np.transpose(p2)


#1D DCT again
for i in range(256):
    p2[i] = dct(p2[i]/256)/2


#numpy to list
p2 = np.transpose(p2)'''
p2 = p2.tolist()


