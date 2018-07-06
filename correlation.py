#!/usr/bin/python3
#a correlation for ten photos

from scipy.fftpack import dct
import math
import numpy as np


'''#read the input file
p0 = [0.0]*256
p1 = [0.0]*256
p2 = [0.0]*256
p3 = [0.0]*256
p4 = [0.0]*256
p5 = [0.0]*256
p6 = [0.0]*256
p7 = [0.0]*256
p8 = [0.0]*256
p9 = [0.0]*256
for i in range(10):
    x = 0
    with open("C:/Users/alice/Desktop/data_row_in/row_in{0}.txt".format(i), "r") as file:
        for line in file:
            if (i==0):
                p0[x] = line.strip("\n").split()
            elif(i==1):
                p1[x] = line.strip("\n").split()
            elif (i==2):
                p2[x] = line.strip("\n").split()
            elif (i==3):
                p3[x] = line.strip("\n").split()
            elif (i==4):
                p4[x] = line.strip("\n").split()
            elif (i==5):
                p5[x] = line.strip("\n").split()
            elif (i==6):
                p6[x] = line.strip("\n").split()
            elif (i==7):
                p7[x] = line.strip("\n").split()
            elif (i==8):
                p8[x] = line.strip("\n").split()
            elif (i==9):
                p9[x] = line.strip("\n").split()
            x = x + 1


#string to int
for i in range(256):
    for j in range(256):
        p0[i][j] = float(int(p0[i][j]) >> 15)
        p1[i][j] = float(int(p1[i][j]) >> 15)
        p2[i][j] = float(int(p2[i][j]) >> 15)
        p3[i][j] = float(int(p3[i][j]) >> 15)
        p4[i][j] = float(int(p4[i][j]) >> 15)
        p5[i][j] = float(int(p5[i][j]) >> 15)
        p6[i][j] = float(int(p6[i][j]) >> 15)
        p7[i][j] = float(int(p7[i][j]) >> 15)
        p8[i][j] = float(int(p8[i][j]) >> 15)
        p9[i][j] = float(int(p9[i][j]) >> 15)


#list to numpy
p0 = np.asarray(p0)
p1 = np.asarray(p1)
p2 = np.asarray(p2)
p3 = np.asarray(p3)
p4 = np.asarray(p4)
p5 = np.asarray(p5)
p6 = np.asarray(p6)
p7 = np.asarray(p7)
p8 = np.asarray(p8)
p9 = np.asarray(p9)


#normalize
for i in range(256):
    for j in range(256):
        p0[i][j] = p0[i][j]/256/256
        p1[i][j] = p1[i][j]/256/256
        p2[i][j] = p2[i][j]/256/256
        p3[i][j] = p3[i][j]/256/256
        p4[i][j] = p4[i][j]/256/256
        p5[i][j] = p5[i][j]/256/256
        p6[i][j] = p6[i][j]/256/256
        p7[i][j] = p7[i][j]/256/256
        p8[i][j] = p8[i][j]/256/256
        p9[i][j] = p9[i][j]/256/256


#2-D DCT
p0 = dct(dct(np.asarray(p0).T).T)/2/2
p1 = dct(dct(np.asarray(p1).T).T)/2/2
p2 = dct(dct(np.asarray(p2).T).T)/2/2
p3 = dct(dct(np.asarray(p3).T).T)/2/2
p4 = dct(dct(np.asarray(p4).T).T)/2/2
p5 = dct(dct(np.asarray(p5).T).T)/2/2
p6 = dct(dct(np.asarray(p6).T).T)/2/2
p7 = dct(dct(np.asarray(p7).T).T)/2/2
p8 = dct(dct(np.asarray(p8).T).T)/2/2
p9 = dct(dct(np.asarray(p9).T).T)/2/2


#numpy to list
p0 = p0.tolist()
p1 = p1.tolist()
p2 = p2.tolist()
p3 = p3.tolist()
p4 = p4.tolist()
p5 = p5.tolist()
p6 = p6.tolist()
p7 = p7.tolist()
p8 = p8.tolist()
p9 = p9.tolist()'''


#read the verilog output file
v0 = [0.0]*256
v1 = [0.0]*256
v2 = [0.0]*256
v3 = [0.0]*256
v4 = [0.0]*256
v5 = [0.0]*256
v6 = [0.0]*256
v7 = [0.0]*256
v8 = [0.0]*256
v9 = [0.0]*256
for i in range(10):
    x = 0
    with open("C:/Users/alice/Desktop/data_col_out/col_out{0}.txt".format(i), "r") as file:
        for line in file:
            if (i==0):
                v0[x] = line.strip("\n").split()
            elif(i==1):
                v1[x] = line.strip("\n").split()
            elif (i==2):
                v2[x] = line.strip("\n").split()
            elif (i==3):
                v3[x] = line.strip("\n").split()
            elif (i==4):
                v4[x] = line.strip("\n").split()
            elif (i==5):
                v5[x] = line.strip("\n").split()
            elif (i==6):
                v6[x] = line.strip("\n").split()
            elif (i==7):
                v7[x] = line.strip("\n").split()
            elif (i==8):
                v8[x] = line.strip("\n").split()
            elif (i==9):
                v9[x] = line.strip("\n").split()
            x = x + 1


#string to int
for i in range(256):
    for j in range(256):
        v0[i][j] = int(v0[i][j])
        v1[i][j] = int(v1[i][j])
        v2[i][j] = int(v2[i][j])
        v3[i][j] = int(v3[i][j])
        v4[i][j] = int(v4[i][j])
        v5[i][j] = int(v5[i][j])
        v6[i][j] = int(v6[i][j])
        v7[i][j] = int(v7[i][j])
        v8[i][j] = int(v8[i][j])
        v9[i][j] = int(v9[i][j])
        if (v0[i][j] > 2**23):
            v0[i][j] = -(2**25-v0[i][j])/(2**15)
        else:
            v0[i][j] = v0[i][j]/(2**15)
        if (v1[i][j] > 2**23):
            v1[i][j] = -(2**25-v1[i][j])/(2**15)
        else:
            v1[i][j] = v1[i][j]/(2**15)
        if (v2[i][j] > 2**23):
            v2[i][j] = -(2**25-v2[i][j])/(2**15)
        else:
            v2[i][j] = v2[i][j]/(2**15)
        if (v3[i][j] > 2**23):
            v3[i][j] = -(2**25-v3[i][j])/(2**15)
        else:
            v3[i][j] = v3[i][j]/(2**15)
        if (v4[i][j] > 2**23):
            v4[i][j] = -(2**25-v4[i][j])/(2**15)
        else:
            v4[i][j] = v4[i][j]/(2**15)
        if (v5[i][j] > 2**23):
            v5[i][j] = -(2**25-v5[i][j])/(2**15)
        else:
            v5[i][j] = v5[i][j]/(2**15)
        if (v6[i][j] > 2**23):
            v6[i][j] = -(2**25-v6[i][j])/(2**15)
        else:
            v6[i][j] = v6[i][j]/(2**15)
        if (v7[i][j] > 2**23):
            v7[i][j] = -(2**25-v7[i][j])/(2**15)
        else:
            v7[i][j] = v7[i][j]/(2**15)
        if (v8[i][j] > 2**23):
            v8[i][j] = -(2**25-v8[i][j])/(2**15)
        else:
            v8[i][j] = v8[i][j]/(2**15)
        if (v9[i][j] > 2**23):
            v9[i][j] = -(2**25-v9[i][j])/(2**15)
        else:
            v9[i][j] = v9[i][j]/(2**15)


#transpose the verilog output again
v0 = np.transpose(v0).tolist()
v1 = np.transpose(v1).tolist()
v2 = np.transpose(v2).tolist()
v3 = np.transpose(v3).tolist()
v4 = np.transpose(v4).tolist()
v5 = np.transpose(v5).tolist()
v6 = np.transpose(v6).tolist()
v7 = np.transpose(v7).tolist()
v8 = np.transpose(v8).tolist()
v9 = np.transpose(v9).tolist()


#rewrite data in a list
x = 0
'''pp0 = [0.0]*256*256
pp1 = [0.0]*256*256
pp2 = [0.0]*256*256
pp3 = [0.0]*256*256
pp4 = [0.0]*256*256
pp5 = [0.0]*256*256
pp6 = [0.0]*256*256
pp7 = [0.0]*256*256
pp8 = [0.0]*256*256
pp9 = [0.0]*256*256'''
vv0 = [0.0]*256*256
vv1 = [0.0]*256*256
vv2 = [0.0]*256*256
vv3 = [0.0]*256*256
vv4 = [0.0]*256*256
vv5 = [0.0]*256*256
vv6 = [0.0]*256*256
vv7 = [0.0]*256*256
vv8 = [0.0]*256*256
vv9 = [0.0]*256*256
for i in range(256):
    for j in range(256):
        '''pp0[x] = p0[i][j]
        pp1[x] = p1[i][j]
        pp2[x] = p2[i][j]
        pp3[x] = p3[i][j]
        pp4[x] = p4[i][j]
        pp5[x] = p5[i][j]
        pp6[x] = p6[i][j]
        pp7[x] = p7[i][j]
        pp8[x] = p8[i][j]
        pp9[x] = p9[i][j]'''
        vv0[x] = v0[i][j]
        vv1[x] = v1[i][j]
        vv2[x] = v2[i][j]
        vv3[x] = v3[i][j]
        vv4[x] = v4[i][j]
        vv5[x] = v5[i][j]
        vv6[x] = v6[i][j]
        vv7[x] = v7[i][j]
        vv8[x] = v8[i][j]
        vv9[x] = v9[i][j]
        x = x + 1


#correlate
corrv01 = round(np.corrcoef(vv0, vv1)[1,0],4)
corrv02 = round(np.corrcoef(vv0, vv2)[1,0],4)
corrv03 = round(np.corrcoef(vv0, vv3)[1,0],4)
corrv04 = round(np.corrcoef(vv0, vv4)[1,0],4)
corrv05 = round(np.corrcoef(vv0, vv5)[1,0],4)
corrv06 = round(np.corrcoef(vv0, vv6)[1,0],4)
corrv07 = round(np.corrcoef(vv0, vv7)[1,0],4)
corrv08 = round(np.corrcoef(vv0, vv8)[1,0],4)
corrv09 = round(np.corrcoef(vv0, vv9)[1,0],4)
corrv12 = round(np.corrcoef(vv1, vv2)[1,0],4)
corrv13 = round(np.corrcoef(vv1, vv3)[1,0],4)
corrv14 = round(np.corrcoef(vv1, vv4)[1,0],4)
corrv15 = round(np.corrcoef(vv1, vv5)[1,0],4)
corrv16 = round(np.corrcoef(vv1, vv6)[1,0],4)
corrv17 = round(np.corrcoef(vv1, vv7)[1,0],4)
corrv18 = round(np.corrcoef(vv1, vv8)[1,0],4)
corrv19 = round(np.corrcoef(vv1, vv9)[1,0],4)
corrv23 = round(np.corrcoef(vv2, vv3)[1,0],4)
corrv24 = round(np.corrcoef(vv2, vv4)[1,0],4)
corrv25 = round(np.corrcoef(vv2, vv5)[1,0],4)
corrv26 = round(np.corrcoef(vv2, vv6)[1,0],4)
corrv27 = round(np.corrcoef(vv2, vv7)[1,0],4)
corrv28 = round(np.corrcoef(vv2, vv8)[1,0],4)
corrv29 = round(np.corrcoef(vv2, vv9)[1,0],4)
corrv34 = round(np.corrcoef(vv3, vv4)[1,0],4)
corrv35 = round(np.corrcoef(vv3, vv5)[1,0],4)
corrv36 = round(np.corrcoef(vv3, vv6)[1,0],4)
corrv37 = round(np.corrcoef(vv3, vv7)[1,0],4)
corrv38 = round(np.corrcoef(vv3, vv8)[1,0],4)
corrv39 = round(np.corrcoef(vv3, vv9)[1,0],4)
corrv45 = round(np.corrcoef(vv4, vv5)[1,0],4)
corrv46 = round(np.corrcoef(vv4, vv6)[1,0],4)
corrv47 = round(np.corrcoef(vv4, vv7)[1,0],4)
corrv48 = round(np.corrcoef(vv4, vv8)[1,0],4)
corrv49 = round(np.corrcoef(vv4, vv9)[1,0],4)
corrv56 = round(np.corrcoef(vv5, vv6)[1,0],4)
corrv57 = round(np.corrcoef(vv5, vv7)[1,0],4)
corrv58 = round(np.corrcoef(vv5, vv8)[1,0],4)
corrv59 = round(np.corrcoef(vv5, vv9)[1,0],4)
corrv67 = round(np.corrcoef(vv6, vv7)[1,0],4)
corrv68 = round(np.corrcoef(vv6, vv8)[1,0],4)
corrv69 = round(np.corrcoef(vv6, vv9)[1,0],4)
corrv78 = round(np.corrcoef(vv7, vv8)[1,0],4)
corrv79 = round(np.corrcoef(vv7, vv9)[1,0],4)
corrv89 = round(np.corrcoef(vv8, vv9)[1,0],4)


'''corrp01 = np.corrcoef(pp0, pp1)[1,0]
corrp02 = np.corrcoef(pp0, pp2)[1,0]
corrp03 = np.corrcoef(pp0, pp3)[1,0]
corrp04 = np.corrcoef(pp0, pp4)[1,0]
corrp05 = np.corrcoef(pp0, pp5)[1,0]
corrp06 = np.corrcoef(pp0, pp6)[1,0]
corrp07 = np.corrcoef(pp0, pp7)[1,0]
corrp08 = np.corrcoef(pp0, pp8)[1,0]
corrp09 = np.corrcoef(pp0, pp9)[1,0]
corrp12 = np.corrcoef(pp1, pp2)[1,0]
corrp13 = np.corrcoef(pp1, pp3)[1,0]
corrp14 = np.corrcoef(pp1, pp4)[1,0]
corrp15 = np.corrcoef(pp1, pp5)[1,0]
corrp16 = np.corrcoef(pp1, pp6)[1,0]
corrp17 = np.corrcoef(pp1, pp7)[1,0]
corrp18 = np.corrcoef(pp1, pp8)[1,0]
corrp19 = np.corrcoef(pp1, pp9)[1,0]
corrp23 = np.corrcoef(pp2, pp3)[1,0]
corrp24 = np.corrcoef(pp2, pp4)[1,0]
corrp25 = np.corrcoef(pp2, pp5)[1,0]
corrp26 = np.corrcoef(pp2, pp6)[1,0]
corrp27 = np.corrcoef(pp2, pp7)[1,0]
corrp28 = np.corrcoef(pp2, pp8)[1,0]
corrp29 = np.corrcoef(pp2, pp9)[1,0]
corrp34 = np.corrcoef(pp3, pp4)[1,0]
corrp35 = np.corrcoef(pp3, pp5)[1,0]
corrp36 = np.corrcoef(pp3, pp6)[1,0]
corrp37 = np.corrcoef(pp3, pp7)[1,0]
corrp38 = np.corrcoef(pp3, pp8)[1,0]
corrp39 = np.corrcoef(pp3, pp9)[1,0]
corrp45 = np.corrcoef(pp4, pp5)[1,0]
corrp46 = np.corrcoef(pp4, pp6)[1,0]
corrp47 = np.corrcoef(pp4, pp7)[1,0]
corrp48 = np.corrcoef(pp4, pp8)[1,0]
corrp49 = np.corrcoef(pp4, pp9)[1,0]
corrp56 = np.corrcoef(pp5, pp6)[1,0]
corrp57 = np.corrcoef(pp5, pp7)[1,0]
corrp58 = np.corrcoef(pp5, pp8)[1,0]
corrp59 = np.corrcoef(pp5, pp9)[1,0]
corrp67 = np.corrcoef(pp6, pp7)[1,0]
corrp68 = np.corrcoef(pp6, pp8)[1,0]
corrp69 = np.corrcoef(pp6, pp9)[1,0]
corrp78 = np.corrcoef(pp7, pp8)[1,0]
corrp79 = np.corrcoef(pp7, pp9)[1,0]
corrp89 = np.corrcoef(pp8, pp9)[1,0]'''


print(corrv01,corrv02,corrv03,corrv04,corrv05,corrv06,corrv07,corrv08,corrv09,
      corrv12,corrv13,corrv14,corrv15,corrv16,corrv17,corrv18,corrv19,
      corrv23,corrv24,corrv25,corrv26,corrv27,corrv28,corrv29,
      corrv34,corrv35,corrv36,corrv37,corrv38,corrv39,
      corrv45,corrv46,corrv47,corrv48,corrv49,
      corrv56,corrv57,corrv58,corrv59,
      corrv67,corrv68,corrv69,
      corrv78,corrv79,corrv89)

'''print(corrp01,corrp02,corrp03,corrp04,corrp05,corrp06,corrp07,corrp08,corrp09,
      corrp12,corrp13,corrp14,corrp15,corrp16,corrp17,corrp18,corrp19,
      corrp23,corrp24,corrp25,corrp26,corrp27,corrp28,corrp29,
      corrp34,corrp35,corrp36,corrp37,corrp38,corrp39,
      corrp45,corrp46,corrp47,corrp48,corrp49,
      corrp56,corrp57,corrp58,corrp59,
      corrp67,corrp68,corrp69,
      corrp78,corrp79,corrp89)'''
