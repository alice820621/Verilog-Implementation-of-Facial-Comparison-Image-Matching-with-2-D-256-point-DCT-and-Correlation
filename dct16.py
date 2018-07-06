#!/usr/bin/python3
#Fast 1-D 16-point DCT. Not used in master project.

from scipy.fftpack import dct
import math
import numpy as np

point16=np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17])

n=16
half=8
i=0
L1_a = [(point16[i] + point16[-(i + 1)]) for i in range(half)]
L1_w = [(point16[i] - point16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

n=8
half=4
L2_a1 = [(L1_a[i] + L1_a[-(i + 1)]) for i in range(half)]
L2_w1 = [(L1_a[i] - L1_a[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L2_a2 = [(L1_w[i] + L1_w[-(i + 1)]) for i in range(half)]
L2_w2 = [(L1_w[i] - L1_w[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

n=4
half=2
L3_a1 = [(L2_a1[i] + L2_a1[-(i + 1)]) for i in range(half)]
L3_w1 = [(L2_a1[i] - L2_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a2 = [(L2_w1[i] + L2_w1[-(i + 1)]) for i in range(half)]
L3_w2 = [(L2_w1[i] - L2_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a3 = [(L2_a2[i] + L2_a2[-(i + 1)]) for i in range(half)]
L3_w3 = [(L2_a2[i] - L2_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a4 = [(L2_w2[i] + L2_w2[-(i + 1)]) for i in range(half)]
L3_w4 = [(L2_w2[i] - L2_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

n=2
half=1
v = [0.0]*16
v[0] = [(L3_a1[i] + L3_a1[-(i + 1)]) for i in range(half)]
v[1] = [(L3_a1[i] - L3_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[2] = [(L3_w1[i] + L3_w1[-(i + 1)]) for i in range(half)]
v[3] = [(L3_w1[i] - L3_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[4] = [(L3_a2[i] + L3_a2[-(i + 1)]) for i in range(half)]
v[5] = [(L3_a2[i] - L3_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[6] = [(L3_w2[i] + L3_w2[-(i + 1)]) for i in range(half)]
v[7] = [(L3_w2[i] - L3_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[8] = [(L3_a3[i] + L3_a3[-(i + 1)]) for i in range(half)]
v[9] = [(L3_a3[i] - L3_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[10] = [(L3_w3[i] + L3_w3[-(i + 1)]) for i in range(half)]
v[11] = [(L3_w3[i] - L3_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[12] = [(L3_a4[i] + L3_a4[-(i + 1)]) for i in range(half)]
v[13] = [(L3_a4[i] - L3_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
v[14] = [(L3_w4[i] + L3_w4[-(i + 1)]) for i in range(half)]
v[15] = [(L3_w4[i] - L3_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

r = [0.0]*16
r[0] = v[0][0]
r[1] = v[8][0] + v[12][0] + v[14][0] + v[15][0]     #add [0] to get item out of the list
r[2] = v[4][0] + v[6][0] + v[7][0]
r[3] = v[10][0] + v[11][0] + v[12][0] + v[14][0] + v[15][0]
r[4] = v[2][0] + v[3][0]
r[5] = v[10][0] + v[11][0] + v[13][0] + v[14][0] + v[15][0]
r[6] = v[5][0] + v[6][0] + v[7][0]
r[7] = v[9][0] + v[13][0] + v[14][0] + v[15][0]
r[8] = v[1][0]
r[9] = v[9][0] + v[13][0] + v[15][0]
r[10] = v[5][0] + v[7][0]
r[11] = v[11][0] + v[13][0] + v[15][0]
r[12] = v[3][0]
r[13] = v[11][0] + v[15][0]
r[14] = v[7][0]
r[15] = v[15][0]

print(r)
print(dct(point16)/2)
