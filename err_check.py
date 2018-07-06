#!/usr/bin/python3
#an error checking between build-in DCT and the output of the Verilog device


from scipy.fftpack import dct
import matplotlib.pyplot as plt
import numpy as np


#read the input file
x = 0
p = [0.0]*256
with open("C:/Users/alice/Desktop/data_row_in/row_in0.txt", "r") as file:
    for line in file:
        p[x] = line.strip("\n").split()
        x = x + 1


#string to int
for i in range(256):
    for j in range(256):
        p[i][j] = int(p[i][j])
        #p[i][j] = p[i][j])>>10
        #p[i][j] = float(p[i][j])
        '''if (p[i][j] > 2**18):
            p[i][j] = -(2**20-p[i][j])/1024
        else:
            p[i][j] = p[i][j]/1024'''
        '''if (p[i][j] > 2**38):
            p[i][j] = -(2**40-p[i][j])/(2**30)
        else:
            p[i][j] = p[i][j]/(2**30)'''
        if (p[i][j] > 2**23):
            p[i][j] = -(2**25-p[i][j])/(2**15)
        else:
            p[i][j] = p[i][j]/(2**15)
p = np.asarray(p)


#2D DCT
for i in range(256):
    for j in range(256):
        p[i][j] = p[i][j]/256/256
p = np.asarray(p)
p = dct(dct(p.T).T)/2/2
p = p.tolist()
for i in range(256):
    for j in range(256):
        p[i][j] = round(p[i][j], 4)


'''#1D DCT
for i in range(256):
    for j in range(256):
        p[i][j] = p[i][j]/256
for i in range(256):
    p[i] = dct(p[i])/2
p = p.tolist()
for i in range(256):
    for j in range(256):
        p[i][j] = round(p[i][j], 2)'''


#read the verilog output file
x = 0
v = [0.0]*256
with open("C:/Users/alice/Desktop/data_col_out/col_out0.txt", "r") as file:
    for line in file:
        v[x] = line.strip("\n").split()
        x = x + 1


#string to int
for i in range(256):
    for j in range(256):
        v[i][j] = int(v[i][j])
        '''if (v[i][j] > 2**18):
            v[i][j] = -(2**20-v[i][j])/1024
        else:
            v[i][j] = v[i][j]/1024
        v[i][j] = round(v[i][j], 4)'''
        '''if (v[i][j] > 2**38):
            v[i][j] = -(2**40-v[i][j])/(2**30)
        else:
            v[i][j] = v[i][j]/(2**30)
        v[i][j] = round(v[i][j], 3)'''
        if (v[i][j] > 2**23):
            v[i][j] = -(2**25-v[i][j])/(2**15)
        else:
            v[i][j] = v[i][j]/(2**15)
        v[i][j] = round(v[i][j], 4)


#transpose the verilog output again
v = np.transpose(v).tolist()


#calculate the error
x = 0
r1 = [0.0] * 256 * 256
r2 = [0.0] * 256 * 256
for i in range(256):
    for j in range(256):
        if(max([abs(p[i][j]),abs(v[i][j])]) == 0):
            r1[x] = 0
        else:
            r1[x] = abs(p[i][j]-v[i][j])  / max([abs(p[i][j]),abs(v[i][j])])
        r2[x] = abs(p[i][j]-v[i][j])
        x = x + 1


#plot the error
plt.subplot(2,1,1)
plt.plot(r1[0:2000])
plt.title("percentage")
plt.subplot(2,1,2)
plt.plot(r2[0:2000])
plt.title("absolute")
plt.show()
