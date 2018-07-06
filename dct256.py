#!/usr/bin/python3
#fast 1-D 256-point DCT

from scipy.fftpack import dct
import math
import numpy as np

#import xlwt
#import xlsxwriter
#import pandas

'''point256=np.array([1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,
                   11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,
                   21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0,30.0,
                   31.0,32.0,33.0,34.0,35.0,36.0,37.0,38.0,39.0,40.0,
                   41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,
                   51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,
                   61.0,62.0,63.0,64.0,65.0,66.0,67.0,68.0,69.0,70.0,
                   71.0,72.0,73.0,74.0,75.0,76.0,77.0,78.0,79.0,80.0,
                   81.0,82.0,83.0,84.0,85.0,86.0,87.0,88.0,89.0,90.0,
                   91.0,92.0,93.0,94.0,95.0,96.0,97.0,98.0,99.0,100.0,
                   101.0,102.0,103.0,104.0,105.0,106.0,107.0,108.0,109.0,110.0,
                   111.0,112.0,113.0,114.0,115.0,116.0,117.0,118.0,119.0,120.0,
                   121.0,122.0,123.0,124.0,125.0,126.0,127.0,128.0,129.0,130.0,
                   131.0,132.0,133.0,134.0,135.0,136.0,137.0,138.0,139.0,140.0,
                   141.0,142.0,143.0,144.0,145.0,146.0,147.0,148.0,149.0,150.0,
                   151.0,152.0,153.0,154.0,155.0,156.0,157.0,158.0,159.0,160.0,
                   161.0,162.0,163.0,164.0,165.0,166.0,167.0,168.0,169.0,170.0,
                   171.0,172.0,173.0,174.0,175.0,176.0,177.0,178.0,179.0,180.0,
                   181.0,182.0,183.0,184.0,185.0,186.0,187.0,188.0,189.0,190.0,
                   191.0,192.0,193.0,194.0,195.0,196.0,197.0,198.0,199.0,200.0,
                   201.0,202.0,203.0,204.0,205.0,206.0,207.0,208.0,209.0,210.0,
                   211.0,212.0,213.0,214.0,215.0,216.0,217.0,218.0,219.0,220.0,
                   221.0,222.0,223.0,224.0,225.0,226.0,227.0,228.0,229.0,230.0,
                   231.0,232.0,233.0,234.0,235.0,236.0,237.0,238.0,239.0,240.0,
                   241.0,242.0,243.0,244.0,245.0,246.0,247.0,248.0,249.0,250.0,
                   251.0,252.0,253.0,254.0,255.0,255.0])'''

'''point256=np.array([255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,
                   255.0,255.0,255.0,255.0,255.0,255.0])'''


#point256 = np.array([44.0, 220.0, 251.0, 41.0, 103.0, 9.0, 35.0, 12.0, 58.0, 133.0, 46.0, 174.0, 62.0, 137.0, 28.0, 143.0, 236.0, 89.0, 212.0, 67.0, 135.0, 167.0, 37.0, 68.0, 116.0, 208.0, 251.0, 216.0, 149.0, 7.0, 59.0, 78.0, 250.0, 14.0, 46.0, 88.0, 146.0, 26.0, 225.0, 61.0, 116.0, 136.0, 67.0, 95.0, 235.0, 85.0, 38.0, 168.0, 145.0, 248.0, 27.0, 208.0, 146.0, 189.0, 122.0, 30.0, 239.0, 137.0, 41.0, 115.0, 130.0, 112.0, 58.0, 178.0, 211.0, 103.0, 116.0, 229.0, 88.0, 139.0, 70.0, 73.0, 21.0, 93.0, 100.0, 82.0, 103.0, 4.0, 109.0, 245.0, 108.0, 74.0, 154.0, 103.0, 213.0, 148.0, 47.0, 158.0, 22.0, 32.0, 253.0, 35.0, 43.0, 117.0, 176.0, 66.0, 36.0, 18.0, 98.0, 242.0, 238.0, 12.0, 14.0, 56.0, 50.0, 239.0, 217.0, 167.0, 252.0, 51.0, 120.0, 2.0, 235.0, 39.0, 243.0, 17.0, 73.0, 112.0, 124.0, 151.0, 87.0, 64.0, 248.0, 150.0, 105.0, 47.0, 66.0, 190.0, 125.0, 55.0, 20.0, 243.0, 80.0, 104.0, 201.0, 66.0, 86.0, 83.0, 233.0, 123.0, 219.0, 236.0, 142.0, 136.0, 93.0, 234.0, 93.0, 19.0, 139.0, 145.0, 139.0, 232.0, 124.0, 111.0, 192.0, 119.0, 247.0, 9.0, 39.0, 187.0, 14.0, 202.0, 224.0, 7.0, 35.0, 80.0, 30.0, 9.0, 67.0, 49.0, 250.0, 132.0, 16.0, 199.0, 93.0, 135.0, 9.0, 217.0, 59.0, 252.0, 230.0, 51.0, 159.0, 52.0, 23.0, 164.0, 79.0, 87.0, 201.0, 99.0, 43.0, 147.0, 118.0, 30.0, 82.0, 59.0, 19.0, 132.0, 121.0, 244.0, 188.0, 21.0, 20.0, 148.0, 130.0, 110.0, 18.0, 177.0, 244.0, 62.0, 91.0, 139.0, 127.0, 236.0, 40.0, 206.0, 121.0, 61.0, 222.0, 50.0, 170.0, 192.0, 183.0, 10.0, 138.0, 252.0, 11.0, 10.0, 32.0, 117.0, 246.0, 41.0, 161.0, 38.0, 244.0, 165.0, 188.0, 193.0, 17.0, 24.0, 156.0, 63.0, 170.0, 100.0, 80.0, 23.0, 42.0, 212.0, 90.0, 179.0, 48.0, 144.0, 208.0, 17.0, 189.0, 247.0])

#point256 = np.array([107.0, 140.0, 223.0, 21.0, 250.0, 213.0, 146.0, 86.0, 23.0, 62.0, 153.0, 92.0, 213.0, 15.0, 163.0, 18.0, 227.0, 91.0, 198.0, 100.0, 120.0, 5.0, 251.0, 70.0, 198.0, 220.0, 134.0, 102.0, 227.0, 34.0, 164.0, 43.0, 234.0, 60.0, 93.0, 69.0, 105.0, 111.0, 117.0, 192.0, 154.0, 36.0, 171.0, 43.0, 9.0, 76.0, 94.0, 110.0, 236.0, 77.0, 59.0, 120.0, 217.0, 128.0, 9.0, 201.0, 7.0, 87.0, 137.0, 48.0, 244.0, 224.0, 228.0, 25.0, 184.0, 76.0, 238.0, 157.0, 161.0, 84.0, 188.0, 178.0, 194.0, 42.0, 117.0, 199.0, 161.0, 102.0, 63.0, 123.0, 45.0, 249.0, 16.0, 208.0, 5.0, 19.0, 221.0, 82.0, 24.0, 252.0, 237.0, 235.0, 114.0, 41.0, 83.0, 143.0, 145.0, 128.0, 188.0, 228.0, 242.0, 169.0, 201.0, 20.0, 227.0, 28.0, 163.0, 28.0, 189.0, 145.0, 147.0, 156.0, 45.0, 28.0, 137.0, 141.0, 233.0, 126.0, 203.0, 253.0, 176.0, 241.0, 103.0, 250.0, 162.0, 88.0, 92.0, 119.0, 175.0, 101.0, 38.0, 178.0, 176.0, 102.0, 19.0, 116.0, 18.0, 70.0, 43.0, 175.0, 21.0, 206.0, 109.0, 188.0, 149.0, 50.0, 203.0, 231.0, 67.0, 132.0, 192.0, 250.0, 28.0, 123.0, 9.0, 170.0, 147.0, 66.0, 80.0, 153.0, 53.0, 98.0, 199.0, 174.0, 91.0, 31.0, 223.0, 187.0, 59.0, 41.0, 146.0, 107.0, 247.0, 213.0, 190.0, 214.0, 213.0, 173.0, 240.0, 110.0, 128.0, 243.0, 180.0, 148.0, 234.0, 101.0, 162.0, 17.0, 96.0, 236.0, 188.0, 250.0, 116.0, 160.0, 138.0, 254.0, 35.0, 243.0, 16.0, 159.0, 225.0, 156.0, 137.0, 0.0, 92.0, 131.0, 156.0, 43.0, 134.0, 173.0, 233.0, 242.0, 204.0, 17.0, 134.0, 79.0, 28.0, 117.0, 219.0, 77.0, 24.0, 104.0, 132.0, 194.0, 237.0, 0.0, 128.0, 188.0, 195.0, 19.0, 144.0, 159.0, 47.0, 191.0, 128.0, 46.0, 215.0, 150.0, 186.0, 86.0, 234.0, 218.0, 193.0, 239.0, 87.0, 113.0, 25.0, 69.0, 1.0, 16.0, 221.0, 83.0, 25.0, 164.0, 64.0, 219.0])

#point256 = np.array([106.0, 122.0, 225.0, 71.0, 86.0, 254.0, 12.0, 148.0, 14.0, 48.0, 73.0, 189.0, 184.0, 218.0, 18.0, 13.0, 218.0, 14.0, 75.0, 237.0, 155.0, 130.0, 209.0, 80.0, 61.0, 102.0, 28.0, 155.0, 160.0, 23.0, 83.0, 181.0, 242.0, 64.0, 53.0, 29.0, 16.0, 155.0, 31.0, 236.0, 99.0, 238.0, 47.0, 198.0, 132.0, 49.0, 34.0, 223.0, 182.0, 230.0, 220.0, 184.0, 120.0, 135.0, 132.0, 194.0, 244.0, 29.0, 191.0, 90.0, 90.0, 200.0, 96.0, 115.0, 136.0, 190.0, 33.0, 131.0, 200.0, 35.0, 80.0, 90.0, 99.0, 207.0, 24.0, 47.0, 112.0, 115.0, 54.0, 169.0, 194.0, 230.0, 246.0, 190.0, 235.0, 236.0, 137.0, 72.0, 17.0, 214.0, 30.0, 29.0, 247.0, 169.0, 139.0, 75.0, 167.0, 85.0, 152.0, 184.0, 240.0, 134.0, 145.0, 39.0, 8.0, 4.0, 87.0, 78.0, 156.0, 220.0, 88.0, 83.0, 7.0, 69.0, 138.0, 78.0, 28.0, 237.0, 39.0, 23.0, 165.0, 226.0, 37.0, 182.0, 11.0, 153.0, 147.0, 77.0, 63.0, 224.0, 139.0, 224.0, 85.0, 174.0, 74.0, 152.0, 175.0, 238.0, 216.0, 178.0, 197.0, 163.0, 19.0, 250.0, 97.0, 104.0, 100.0, 245.0, 163.0, 122.0, 116.0, 246.0, 80.0, 252.0, 127.0, 192.0, 204.0, 56.0, 25.0, 200.0, 183.0, 155.0, 5.0, 61.0, 108.0, 229.0, 220.0, 213.0, 70.0, 177.0, 164.0, 166.0, 47.0, 194.0, 174.0, 254.0, 141.0, 65.0, 234.0, 77.0, 71.0, 93.0, 237.0, 141.0, 149.0, 15.0, 103.0, 18.0, 251.0, 161.0, 14.0, 116.0, 223.0, 194.0, 141.0, 18.0, 193.0, 111.0, 238.0, 109.0, 187.0, 177.0, 140.0, 39.0, 137.0, 235.0, 122.0, 133.0, 111.0, 69.0, 222.0, 113.0, 219.0, 128.0, 239.0, 200.0, 139.0, 78.0, 216.0, 75.0, 248.0, 67.0, 11.0, 16.0, 217.0, 63.0, 59.0, 72.0, 27.0, 61.0, 11.0, 132.0, 177.0, 6.0, 187.0, 81.0, 87.0, 163.0, 83.0, 242.0, 64.0, 254.0, 167.0, 77.0, 243.0, 170.0, 41.0, 1.0, 169.0, 254.0, 216.0, 206.0, 111.0, 68.0, 52.0, 135.0])

point256 = np.array([131.0, 86.0, 45.0, 111.0, 130.0, 185.0, 205.0, 97.0, 245.0, 232.0, 130.0, 5.0, 212.0, 158.0, 242.0, 146.0, 18.0, 175.0, 3.0, 245.0, 238.0, 199.0, 138.0, 153.0, 131.0, 81.0, 41.0, 17.0, 18.0, 112.0, 193.0, 13.0, 142.0, 106.0, 176.0, 232.0, 74.0, 40.0, 234.0, 87.0, 73.0, 42.0, 120.0, 168.0, 21.0, 101.0, 44.0, 173.0, 177.0, 16.0, 44.0, 48.0, 214.0, 241.0, 179.0, 44.0, 8.0, 40.0, 245.0, 172.0, 109.0, 27.0, 113.0, 251.0, 214.0, 49.0, 147.0, 41.0, 81.0, 244.0, 23.0, 34.0, 6.0, 226.0, 7.0, 125.0, 126.0, 91.0, 167.0, 84.0, 13.0, 95.0, 218.0, 153.0, 44.0, 92.0, 53.0, 120.0, 45.0, 216.0, 46.0, 75.0, 201.0, 98.0, 251.0, 170.0, 252.0, 28.0, 71.0, 23.0, 236.0, 216.0, 171.0, 231.0, 99.0, 251.0, 151.0, 174.0, 232.0, 205.0, 75.0, 58.0, 116.0, 213.0, 148.0, 210.0, 74.0, 246.0, 113.0, 187.0, 238.0, 128.0, 175.0, 68.0, 65.0, 184.0, 122.0, 20.0, 165.0, 254.0, 92.0, 221.0, 22.0, 65.0, 245.0, 248.0, 145.0, 79.0, 197.0, 12.0, 112.0, 15.0, 224.0, 231.0, 128.0, 151.0, 152.0, 55.0, 81.0, 86.0, 206.0, 180.0, 158.0, 55.0, 104.0, 117.0, 146.0, 217.0, 47.0, 210.0, 213.0, 228.0, 82.0, 27.0, 81.0, 104.0, 86.0, 22.0, 149.0, 145.0, 171.0, 152.0, 160.0, 125.0, 149.0, 208.0, 220.0, 185.0, 151.0, 159.0, 63.0, 207.0, 139.0, 212.0, 137.0, 62.0, 184.0, 58.0, 190.0, 38.0, 226.0, 204.0, 31.0, 188.0, 85.0, 139.0, 222.0, 145.0, 180.0, 33.0, 137.0, 164.0, 67.0, 253.0, 91.0, 134.0, 210.0, 139.0, 125.0, 114.0, 214.0, 243.0, 113.0, 157.0, 176.0, 254.0, 212.0, 67.0, 86.0, 155.0, 71.0, 164.0, 44.0, 59.0, 122.0, 41.0, 58.0, 43.0, 142.0, 158.0, 3.0, 155.0, 14.0, 122.0, 8.0, 40.0, 71.0, 146.0, 131.0, 188.0, 15.0, 40.0, 56.0, 31.0, 0.0, 23.0, 42.0, 129.0, 50.0, 145.0, 181.0, 127.0, 248.0, 233.0, 73.0, 193.0])

'''for i in range(256):
    print(point256[i])'''

#normalized
for i in range(256):
    point256[i] = point256[i]/256

n=256
half=128
i=0
L1_a = [(point256[i] + point256[-(i + 1)]) for i in range(half)]
L1_w = [(point256[i] - point256[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L1_a[i] = round(L1_a[i], 3)
    L1_w[i] = round(L1_w[i], 3)

'''for i in range(half):
    print(L1_a[i])
for i in range(half):
    print(L1_w[-i-1])'''

n=128
half=64
L2_a1 = [(L1_a[i] + L1_a[-(i + 1)]) for i in range(half)]
L2_w1 = [(L1_a[i] - L1_a[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L2_a2 = [(L1_w[i] + L1_w[-(i + 1)]) for i in range(half)]
#L2_w2 = [0.0]*half
#for i in range(half):
#    L2_w2[i] = (L1_w[i] - L1_w[-(i+1)]) / (math.cos((i+0.5)*math.pi/n)*2.0)
#    print(L1_w[i], L1_w[-(i+1)], i, n, 1/(math.cos((i+0.5)*math.pi/n)*2.0), L2_w2[i])
L2_w2 = [(L1_w[i] - L1_w[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L2_a1[i] = round(L2_a1[i], 3)
    L2_w1[i] = round(L2_w1[i], 3)
    L2_a2[i] = round(L2_a2[i], 3)
    L2_w2[i] = round(L2_w2[i], 3)

'''for i in range(half):
    print(L2_a1[i])
for i in range(half):
    print(L2_w1[-i-1])
for i in range(half):
    print(L2_a2[i])
for i in range(half):
    print(L2_w2[-i-1])'''

n=64
half=32
L3_a1 = [(L2_a1[i] + L2_a1[-(i + 1)]) for i in range(half)]
L3_w1 = [(L2_a1[i] - L2_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a2 = [(L2_w1[i] + L2_w1[-(i + 1)]) for i in range(half)]
L3_w2 = [(L2_w1[i] - L2_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a3 = [(L2_a2[i] + L2_a2[-(i + 1)]) for i in range(half)]
L3_w3 = [(L2_a2[i] - L2_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L3_a4 = [(L2_w2[i] + L2_w2[-(i + 1)]) for i in range(half)]
L3_w4 = [(L2_w2[i] - L2_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L3_a1[i] = round(L3_a1[i], 3)
    L3_w1[i] = round(L3_w1[i], 3)
    L3_a2[i] = round(L3_a2[i], 3)
    L3_w2[i] = round(L3_w2[i], 3)
    L3_a3[i] = round(L3_a3[i], 3)
    L3_w3[i] = round(L3_w3[i], 3)
    L3_a4[i] = round(L3_a4[i], 3)
    L3_w4[i] = round(L3_w4[i], 3)

'''for i in range(half):
    print(L3_a1[i])
for i in range(half):
    print(L3_w1[-i-1])
for i in range(half):
    print(L3_a2[i])
for i in range(half):
    print(L3_w2[-i-1])
for i in range(half):
    print(L3_a3[i])
for i in range(half):
    print(L3_w3[-i-1])
for i in range(half):
    print(L3_a4[i])
for i in range(half):
    print(L3_w4[-i-1])'''

n=32
half=16
L4_a1 = [(L3_a1[i] + L3_a1[-(i + 1)]) for i in range(half)]
L4_w1 = [(L3_a1[i] - L3_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a2 = [(L3_w1[i] + L3_w1[-(i + 1)]) for i in range(half)]
L4_w2 = [(L3_w1[i] - L3_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a3 = [(L3_a2[i] + L3_a2[-(i + 1)]) for i in range(half)]
L4_w3 = [(L3_a2[i] - L3_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a4 = [(L3_w2[i] + L3_w2[-(i + 1)]) for i in range(half)]
L4_w4 = [(L3_w2[i] - L3_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a5 = [(L3_a3[i] + L3_a3[-(i + 1)]) for i in range(half)]
L4_w5 = [(L3_a3[i] - L3_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a6 = [(L3_w3[i] + L3_w3[-(i + 1)]) for i in range(half)]
L4_w6 = [(L3_w3[i] - L3_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a7 = [(L3_a4[i] + L3_a4[-(i + 1)]) for i in range(half)]
L4_w7 = [(L3_a4[i] - L3_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L4_a8 = [(L3_w4[i] + L3_w4[-(i + 1)]) for i in range(half)]
L4_w8 = [(L3_w4[i] - L3_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L4_a1[i] = round(L4_a1[i], 3)
    L4_w1[i] = round(L4_w1[i], 3)
    L4_a2[i] = round(L4_a2[i], 3)
    L4_w2[i] = round(L4_w2[i], 3)
    L4_a3[i] = round(L4_a3[i], 3)
    L4_w3[i] = round(L4_w3[i], 3)
    L4_a4[i] = round(L4_a4[i], 3)
    L4_w4[i] = round(L4_w4[i], 3)
    L4_a5[i] = round(L4_a5[i], 3)
    L4_w5[i] = round(L4_w5[i], 3)
    L4_a6[i] = round(L4_a6[i], 3)
    L4_w6[i] = round(L4_w6[i], 3)
    L4_a7[i] = round(L4_a7[i], 3)
    L4_w7[i] = round(L4_w7[i], 3)
    L4_a8[i] = round(L4_a8[i], 3)
    L4_w8[i] = round(L4_w8[i], 3)

'''for i in range(half):
    print(L4_a1[i])
for i in range(half):
    print(L4_w1[-i-1])
for i in range(half):
    print(L4_a2[i])
for i in range(half):
    print(L4_w2[-i-1])
for i in range(half):
    print(L4_a3[i])
for i in range(half):
    print(L4_w3[-i-1])
for i in range(half):
    print(L4_a4[i])
for i in range(half):
    print(L4_w4[-i-1])
for i in range(half):
    print(L4_a5[i])
for i in range(half):
    print(L4_w5[-i-1])
for i in range(half):
    print(L4_a6[i])
for i in range(half):
    print(L4_w6[-i-1])
for i in range(half):
    print(L4_a7[i])
for i in range(half):
    print(L4_w7[-i-1])
for i in range(half):
    print(L4_a8[i])
for i in range(half):
    print(L4_w8[-i-1])'''

n=16
half=8
L5_a1 = [(L4_a1[i] + L4_a1[-(i + 1)]) for i in range(half)]
L5_w1 = [(L4_a1[i] - L4_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a2 = [(L4_w1[i] + L4_w1[-(i + 1)]) for i in range(half)]
L5_w2 = [(L4_w1[i] - L4_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a3 = [(L4_a2[i] + L4_a2[-(i + 1)]) for i in range(half)]
L5_w3 = [(L4_a2[i] - L4_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a4 = [(L4_w2[i] + L4_w2[-(i + 1)]) for i in range(half)]
L5_w4 = [(L4_w2[i] - L4_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a5 = [(L4_a3[i] + L4_a3[-(i + 1)]) for i in range(half)]
L5_w5 = [(L4_a3[i] - L4_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a6 = [(L4_w3[i] + L4_w3[-(i + 1)]) for i in range(half)]
L5_w6 = [(L4_w3[i] - L4_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a7 = [(L4_a4[i] + L4_a4[-(i + 1)]) for i in range(half)]
L5_w7 = [(L4_a4[i] - L4_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a8 = [(L4_w4[i] + L4_w4[-(i + 1)]) for i in range(half)]
L5_w8 = [(L4_w4[i] - L4_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a9 = [(L4_a5[i] + L4_a5[-(i + 1)]) for i in range(half)]
L5_w9 = [(L4_a5[i] - L4_a5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a10 = [(L4_w5[i] + L4_w5[-(i + 1)]) for i in range(half)]
L5_w10 = [(L4_w5[i] - L4_w5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a11 = [(L4_a6[i] + L4_a6[-(i + 1)]) for i in range(half)]
L5_w11 = [(L4_a6[i] - L4_a6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a12 = [(L4_w6[i] + L4_w6[-(i + 1)]) for i in range(half)]
L5_w12 = [(L4_w6[i] - L4_w6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a13 = [(L4_a7[i] + L4_a7[-(i + 1)]) for i in range(half)]
L5_w13 = [(L4_a7[i] - L4_a7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a14 = [(L4_w7[i] + L4_w7[-(i + 1)]) for i in range(half)]
L5_w14 = [(L4_w7[i] - L4_w7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a15 = [(L4_a8[i] + L4_a8[-(i + 1)]) for i in range(half)]
L5_w15 = [(L4_a8[i] - L4_a8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L5_a16 = [(L4_w8[i] + L4_w8[-(i + 1)]) for i in range(half)]
L5_w16 = [(L4_w8[i] - L4_w8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L5_a1[i] = round(L5_a1[i], 3)
    L5_w1[i] = round(L5_w1[i], 3)
    L5_a2[i] = round(L5_a2[i], 3)
    L5_w2[i] = round(L5_w2[i], 3)
    L5_a3[i] = round(L5_a3[i], 3)
    L5_w3[i] = round(L5_w3[i], 3)
    L5_a4[i] = round(L5_a4[i], 3)
    L5_w4[i] = round(L5_w4[i], 3)
    L5_a5[i] = round(L5_a5[i], 3)
    L5_w5[i] = round(L5_w5[i], 3)
    L5_a6[i] = round(L5_a6[i], 3)
    L5_w6[i] = round(L5_w6[i], 3)
    L5_a7[i] = round(L5_a7[i], 3)
    L5_w7[i] = round(L5_w7[i], 3)
    L5_a8[i] = round(L5_a8[i], 3)
    L5_w8[i] = round(L5_w8[i], 3)
    L5_a9[i] = round(L5_a9[i], 3)
    L5_w9[i] = round(L5_w9[i], 3)
    L5_a10[i] = round(L5_a10[i], 3)
    L5_w10[i] = round(L5_w10[i], 3)
    L5_a11[i] = round(L5_a11[i], 3)
    L5_w11[i] = round(L5_w11[i], 3)
    L5_a12[i] = round(L5_a12[i], 3)
    L5_w12[i] = round(L5_w12[i], 3)
    L5_a13[i] = round(L5_a13[i], 3)
    L5_w13[i] = round(L5_w13[i], 3)
    L5_a14[i] = round(L5_a14[i], 3)
    L5_w14[i] = round(L5_w14[i], 3)
    L5_a15[i] = round(L5_a15[i], 3)
    L5_w15[i] = round(L5_w15[i], 3)
    L5_a16[i] = round(L5_a16[i], 3)
    L5_w16[i] = round(L5_w16[i], 3)

'''for i in range(half):
    print(L5_a1[i])
for i in range(half):
    print(L5_w1[-i-1])
for i in range(half):
    print(L5_a2[i])
for i in range(half):
    print(L5_w2[-i-1])
for i in range(half):
    print(L5_a3[i])
for i in range(half):
    print(L5_w3[-i-1])
for i in range(half):
    print(L5_a4[i])
for i in range(half):
    print(L5_w4[-i-1])
for i in range(half):
    print(L5_a5[i])
for i in range(half):
    print(L5_w5[-i-1])
for i in range(half):
    print(L5_a6[i])
for i in range(half):
    print(L5_w6[-i-1])
for i in range(half):
    print(L5_a7[i])
for i in range(half):
    print(L5_w7[-i-1])
for i in range(half):
    print(L5_a8[i])
for i in range(half):
    print(L5_w8[-i-1])
for i in range(half):
    print(L5_a9[i])
for i in range(half):
    print(L5_w9[-i-1])
for i in range(half):
    print(L5_a10[i])
for i in range(half):
    print(L5_w10[-i-1])
for i in range(half):
    print(L5_a11[i])
for i in range(half):
    print(L5_w11[-i-1])
for i in range(half):
    print(L5_a12[i])
for i in range(half):
    print(L5_w12[-i-1])
for i in range(half):
    print(L5_a13[i])
for i in range(half):
    print(L5_w13[-i-1])
for i in range(half):
    print(L5_a14[i])
for i in range(half):
    print(L5_w14[-i-1])
for i in range(half):
    print(L5_a15[i])
for i in range(half):
    print(L5_w15[-i-1])
for i in range(half):
    print(L5_a16[i])
for i in range(half):
    print(L5_w16[-i-1])'''

n=8
half=4
L6_a1 = [(L5_a1[i] + L5_a1[-(i + 1)]) for i in range(half)]
L6_w1 = [(L5_a1[i] - L5_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a2 = [(L5_w1[i] + L5_w1[-(i + 1)]) for i in range(half)]
L6_w2 = [(L5_w1[i] - L5_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a3 = [(L5_a2[i] + L5_a2[-(i + 1)]) for i in range(half)]
L6_w3 = [(L5_a2[i] - L5_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a4 = [(L5_w2[i] + L5_w2[-(i + 1)]) for i in range(half)]
L6_w4 = [(L5_w2[i] - L5_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a5 = [(L5_a3[i] + L5_a3[-(i + 1)]) for i in range(half)]
L6_w5 = [(L5_a3[i] - L5_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a6 = [(L5_w3[i] + L5_w3[-(i + 1)]) for i in range(half)]
L6_w6 = [(L5_w3[i] - L5_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a7 = [(L5_a4[i] + L5_a4[-(i + 1)]) for i in range(half)]
L6_w7 = [(L5_a4[i] - L5_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a8 = [(L5_w4[i] + L5_w4[-(i + 1)]) for i in range(half)]
L6_w8 = [(L5_w4[i] - L5_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a9 = [(L5_a5[i] + L5_a5[-(i + 1)]) for i in range(half)]
L6_w9 = [(L5_a5[i] - L5_a5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a10 = [(L5_w5[i] + L5_w5[-(i + 1)]) for i in range(half)]
L6_w10 = [(L5_w5[i] - L5_w5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a11 = [(L5_a6[i] + L5_a6[-(i + 1)]) for i in range(half)]
L6_w11 = [(L5_a6[i] - L5_a6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a12 = [(L5_w6[i] + L5_w6[-(i + 1)]) for i in range(half)]
L6_w12 = [(L5_w6[i] - L5_w6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a13 = [(L5_a7[i] + L5_a7[-(i + 1)]) for i in range(half)]
L6_w13 = [(L5_a7[i] - L5_a7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a14 = [(L5_w7[i] + L5_w7[-(i + 1)]) for i in range(half)]
L6_w14 = [(L5_w7[i] - L5_w7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a15 = [(L5_a8[i] + L5_a8[-(i + 1)]) for i in range(half)]
L6_w15 = [(L5_a8[i] - L5_a8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a16 = [(L5_w8[i] + L5_w8[-(i + 1)]) for i in range(half)]
L6_w16 = [(L5_w8[i] - L5_w8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a17 = [(L5_a9[i] + L5_a9[-(i + 1)]) for i in range(half)]
L6_w17 = [(L5_a9[i] - L5_a9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a18 = [(L5_w9[i] + L5_w9[-(i + 1)]) for i in range(half)]
L6_w18 = [(L5_w9[i] - L5_w9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a19 = [(L5_a10[i] + L5_a10[-(i + 1)]) for i in range(half)]
L6_w19 = [(L5_a10[i] - L5_a10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a20 = [(L5_w10[i] + L5_w10[-(i + 1)]) for i in range(half)]
L6_w20 = [(L5_w10[i] - L5_w10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a21 = [(L5_a11[i] + L5_a11[-(i + 1)]) for i in range(half)]
L6_w21 = [(L5_a11[i] - L5_a11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a22 = [(L5_w11[i] + L5_w11[-(i + 1)]) for i in range(half)]
L6_w22 = [(L5_w11[i] - L5_w11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a23 = [(L5_a12[i] + L5_a12[-(i + 1)]) for i in range(half)]
L6_w23 = [(L5_a12[i] - L5_a12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a24 = [(L5_w12[i] + L5_w12[-(i + 1)]) for i in range(half)]
L6_w24 = [(L5_w12[i] - L5_w12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a25 = [(L5_a13[i] + L5_a13[-(i + 1)]) for i in range(half)]
L6_w25 = [(L5_a13[i] - L5_a13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a26 = [(L5_w13[i] + L5_w13[-(i + 1)]) for i in range(half)]
L6_w26 = [(L5_w13[i] - L5_w13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a27 = [(L5_a14[i] + L5_a14[-(i + 1)]) for i in range(half)]
L6_w27 = [(L5_a14[i] - L5_a14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a28 = [(L5_w14[i] + L5_w14[-(i + 1)]) for i in range(half)]
L6_w28 = [(L5_w14[i] - L5_w14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a29 = [(L5_a15[i] + L5_a15[-(i + 1)]) for i in range(half)]
L6_w29 = [(L5_a15[i] - L5_a15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a30 = [(L5_w15[i] + L5_w15[-(i + 1)]) for i in range(half)]
L6_w30 = [(L5_w15[i] - L5_w15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a31 = [(L5_a16[i] + L5_a16[-(i + 1)]) for i in range(half)]
L6_w31 = [(L5_a16[i] - L5_a16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L6_a32 = [(L5_w16[i] + L5_w16[-(i + 1)]) for i in range(half)]
L6_w32 = [(L5_w16[i] - L5_w16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L6_a1[i] = round(L6_a1[i], 3)
    L6_w1[i] = round(L6_w1[i], 3)
    L6_a2[i] = round(L6_a2[i], 3)
    L6_w2[i] = round(L6_w2[i], 3)
    L6_a3[i] = round(L6_a3[i], 3)
    L6_w3[i] = round(L6_w3[i], 3)
    L6_a4[i] = round(L6_a4[i], 3)
    L6_w4[i] = round(L6_w4[i], 3)
    L6_a5[i] = round(L6_a5[i], 3)
    L6_w5[i] = round(L6_w5[i], 3)
    L6_a6[i] = round(L6_a6[i], 3)
    L6_w6[i] = round(L6_w6[i], 3)
    L6_a7[i] = round(L6_a7[i], 3)
    L6_w7[i] = round(L6_w7[i], 3)
    L6_a8[i] = round(L6_a8[i], 3)
    L6_w8[i] = round(L6_w8[i], 3)
    L6_a9[i] = round(L6_a9[i], 3)
    L6_w9[i] = round(L6_w9[i], 3)
    L6_a10[i] = round(L6_a10[i], 3)
    L6_w10[i] = round(L6_w10[i], 3)
    L6_a11[i] = round(L6_a11[i], 3)
    L6_w11[i] = round(L6_w11[i], 3)
    L6_a12[i] = round(L6_a12[i], 3)
    L6_w12[i] = round(L6_w12[i], 3)
    L6_a13[i] = round(L6_a13[i], 3)
    L6_w13[i] = round(L6_w13[i], 3)
    L6_a14[i] = round(L6_a14[i], 3)
    L6_w14[i] = round(L6_w14[i], 3)
    L6_a15[i] = round(L6_a15[i], 3)
    L6_w15[i] = round(L6_w15[i], 3)
    L6_a16[i] = round(L6_a16[i], 3)
    L6_w16[i] = round(L6_w16[i], 3)
    L6_a17[i] = round(L6_a17[i], 3)
    L6_w17[i] = round(L6_w17[i], 3)
    L6_a18[i] = round(L6_a18[i], 3)
    L6_w18[i] = round(L6_w18[i], 3)
    L6_a19[i] = round(L6_a19[i], 3)
    L6_w19[i] = round(L6_w19[i], 3)
    L6_a20[i] = round(L6_a20[i], 3)
    L6_w20[i] = round(L6_w20[i], 3)
    L6_a21[i] = round(L6_a21[i], 3)
    L6_w21[i] = round(L6_w21[i], 3)
    L6_a22[i] = round(L6_a22[i], 3)
    L6_w22[i] = round(L6_w22[i], 3)
    L6_a23[i] = round(L6_a23[i], 3)
    L6_w23[i] = round(L6_w23[i], 3)
    L6_a24[i] = round(L6_a24[i], 3)
    L6_w24[i] = round(L6_w24[i], 3)
    L6_a25[i] = round(L6_a25[i], 3)
    L6_w25[i] = round(L6_w25[i], 3)
    L6_a26[i] = round(L6_a26[i], 3)
    L6_w26[i] = round(L6_w26[i], 3)
    L6_a27[i] = round(L6_a27[i], 3)
    L6_w27[i] = round(L6_w27[i], 3)
    L6_a28[i] = round(L6_a28[i], 3)
    L6_w28[i] = round(L6_w28[i], 3)
    L6_a29[i] = round(L6_a29[i], 3)
    L6_w29[i] = round(L6_w29[i], 3)
    L6_a30[i] = round(L6_a30[i], 3)
    L6_w30[i] = round(L6_w30[i], 3)
    L6_a31[i] = round(L6_a31[i], 3)
    L6_w31[i] = round(L6_w31[i], 3)
    L6_a32[i] = round(L6_a32[i], 3)
    L6_w32[i] = round(L6_w32[i], 3)

'''for i in range(half):
    print(L6_a1[i])
for i in range(half):
    print(L6_w1[-i-1])
for i in range(half):
    print(L6_a2[i])
for i in range(half):
    print(L6_w2[-i-1])
for i in range(half):
    print(L6_a3[i])
for i in range(half):
    print(L6_w3[-i-1])
for i in range(half):
    print(L6_a4[i])
for i in range(half):
    print(L6_w4[-i-1])
for i in range(half):
    print(L6_a5[i])
for i in range(half):
    print(L6_w5[-i-1])
for i in range(half):
    print(L6_a6[i])
for i in range(half):
    print(L6_w6[-i-1])
for i in range(half):
    print(L6_a7[i])
for i in range(half):
    print(L6_w7[-i-1])
for i in range(half):
    print(L6_a8[i])
for i in range(half):
    print(L6_w8[-i-1])
for i in range(half):
    print(L6_a9[i])
for i in range(half):
    print(L6_w9[-i-1])
for i in range(half):
    print(L6_a10[i])
for i in range(half):
    print(L6_w10[-i-1])
for i in range(half):
    print(L6_a11[i])
for i in range(half):
    print(L6_w11[-i-1])
for i in range(half):
    print(L6_a12[i])
for i in range(half):
    print(L6_w12[-i-1])
for i in range(half):
    print(L6_a13[i])
for i in range(half):
    print(L6_w13[-i-1])
for i in range(half):
    print(L6_a14[i])
for i in range(half):
    print(L6_w14[-i-1])
for i in range(half):
    print(L6_a15[i])
for i in range(half):
    print(L6_w15[-i-1])
for i in range(half):
    print(L6_a16[i])
for i in range(half):
    print(L6_w16[-i-1])
for i in range(half):
    print(L6_a17[i])
for i in range(half):
    print(L6_w17[-i-1])
for i in range(half):
    print(L6_a18[i])
for i in range(half):
    print(L6_w18[-i-1])
for i in range(half):
    print(L6_a19[i])
for i in range(half):
    print(L6_w19[-i-1])
for i in range(half):
    print(L6_a20[i])
for i in range(half):
    print(L6_w20[-i-1])
for i in range(half):
    print(L6_a21[i])
for i in range(half):
    print(L6_w21[-i-1])
for i in range(half):
    print(L6_a22[i])
for i in range(half):
    print(L6_w22[-i-1])
for i in range(half):
    print(L6_a23[i])
for i in range(half):
    print(L6_w23[-i-1])
for i in range(half):
    print(L6_a24[i])
for i in range(half):
    print(L6_w24[-i-1])
for i in range(half):
    print(L6_a25[i])
for i in range(half):
    print(L6_w25[-i-1])
for i in range(half):
    print(L6_a26[i])
for i in range(half):
    print(L6_w26[-i-1])
for i in range(half):
    print(L6_a27[i])
for i in range(half):
    print(L6_w27[-i-1])
for i in range(half):
    print(L6_a28[i])
for i in range(half):
    print(L6_w28[-i-1])
for i in range(half):
    print(L6_a29[i])
for i in range(half):
    print(L6_w29[-i-1])
for i in range(half):
    print(L6_a30[i])
for i in range(half):
    print(L6_w30[-i-1])
for i in range(half):
    print(L6_a31[i])
for i in range(half):
    print(L6_w31[-i-1])
for i in range(half):
    print(L6_a32[i])
for i in range(half):
    print(L6_w32[-i-1])'''

n=4
half=2
L7_a1 = [(L6_a1[i] + L6_a1[-(i + 1)]) for i in range(half)]
L7_w1 = [(L6_a1[i] - L6_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a2 = [(L6_w1[i] + L6_w1[-(i + 1)]) for i in range(half)]
L7_w2 = [(L6_w1[i] - L6_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a3 = [(L6_a2[i] + L6_a2[-(i + 1)]) for i in range(half)]
L7_w3 = [(L6_a2[i] - L6_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a4 = [(L6_w2[i] + L6_w2[-(i + 1)]) for i in range(half)]
L7_w4 = [(L6_w2[i] - L6_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a5 = [(L6_a3[i] + L6_a3[-(i + 1)]) for i in range(half)]
L7_w5 = [(L6_a3[i] - L6_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a6 = [(L6_w3[i] + L6_w3[-(i + 1)]) for i in range(half)]
L7_w6 = [(L6_w3[i] - L6_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a7 = [(L6_a4[i] + L6_a4[-(i + 1)]) for i in range(half)]
L7_w7 = [(L6_a4[i] - L6_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a8 = [(L6_w4[i] + L6_w4[-(i + 1)]) for i in range(half)]
L7_w8 = [(L6_w4[i] - L6_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a9 = [(L6_a5[i] + L6_a5[-(i + 1)]) for i in range(half)]
L7_w9 = [(L6_a5[i] - L6_a5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a10 = [(L6_w5[i] + L6_w5[-(i + 1)]) for i in range(half)]
L7_w10 = [(L6_w5[i] - L6_w5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a11 = [(L6_a6[i] + L6_a6[-(i + 1)]) for i in range(half)]
L7_w11 = [(L6_a6[i] - L6_a6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a12 = [(L6_w6[i] + L6_w6[-(i + 1)]) for i in range(half)]
L7_w12 = [(L6_w6[i] - L6_w6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a13 = [(L6_a7[i] + L6_a7[-(i + 1)]) for i in range(half)]
L7_w13 = [(L6_a7[i] - L6_a7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a14 = [(L6_w7[i] + L6_w7[-(i + 1)]) for i in range(half)]
L7_w14 = [(L6_w7[i] - L6_w7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a15 = [(L6_a8[i] + L6_a8[-(i + 1)]) for i in range(half)]
L7_w15 = [(L6_a8[i] - L6_a8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a16 = [(L6_w8[i] + L6_w8[-(i + 1)]) for i in range(half)]
L7_w16 = [(L6_w8[i] - L6_w8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a17 = [(L6_a9[i] + L6_a9[-(i + 1)]) for i in range(half)]
L7_w17 = [(L6_a9[i] - L6_a9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a18 = [(L6_w9[i] + L6_w9[-(i + 1)]) for i in range(half)]
L7_w18 = [(L6_w9[i] - L6_w9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a19 = [(L6_a10[i] + L6_a10[-(i + 1)]) for i in range(half)]
L7_w19 = [(L6_a10[i] - L6_a10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a20 = [(L6_w10[i] + L6_w10[-(i + 1)]) for i in range(half)]
L7_w20 = [(L6_w10[i] - L6_w10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a21 = [(L6_a11[i] + L6_a11[-(i + 1)]) for i in range(half)]
L7_w21 = [(L6_a11[i] - L6_a11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a22 = [(L6_w11[i] + L6_w11[-(i + 1)]) for i in range(half)]
L7_w22 = [(L6_w11[i] - L6_w11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a23 = [(L6_a12[i] + L6_a12[-(i + 1)]) for i in range(half)]
L7_w23 = [(L6_a12[i] - L6_a12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a24 = [(L6_w12[i] + L6_w12[-(i + 1)]) for i in range(half)]
L7_w24 = [(L6_w12[i] - L6_w12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a25 = [(L6_a13[i] + L6_a13[-(i + 1)]) for i in range(half)]
L7_w25 = [(L6_a13[i] - L6_a13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a26 = [(L6_w13[i] + L6_w13[-(i + 1)]) for i in range(half)]
L7_w26 = [(L6_w13[i] - L6_w13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a27 = [(L6_a14[i] + L6_a14[-(i + 1)]) for i in range(half)]
L7_w27 = [(L6_a14[i] - L6_a14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a28 = [(L6_w14[i] + L6_w14[-(i + 1)]) for i in range(half)]
L7_w28 = [(L6_w14[i] - L6_w14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a29 = [(L6_a15[i] + L6_a15[-(i + 1)]) for i in range(half)]
L7_w29 = [(L6_a15[i] - L6_a15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a30 = [(L6_w15[i] + L6_w15[-(i + 1)]) for i in range(half)]
L7_w30 = [(L6_w15[i] - L6_w15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a31 = [(L6_a16[i] + L6_a16[-(i + 1)]) for i in range(half)]
L7_w31 = [(L6_a16[i] - L6_a16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a32 = [(L6_w16[i] + L6_w16[-(i + 1)]) for i in range(half)]
L7_w32 = [(L6_w16[i] - L6_w16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a33 = [(L6_a17[i] + L6_a17[-(i + 1)]) for i in range(half)]
L7_w33 = [(L6_a17[i] - L6_a17[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a34 = [(L6_w17[i] + L6_w17[-(i + 1)]) for i in range(half)]
L7_w34 = [(L6_w17[i] - L6_w17[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a35 = [(L6_a18[i] + L6_a18[-(i + 1)]) for i in range(half)]
L7_w35 = [(L6_a18[i] - L6_a18[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a36 = [(L6_w18[i] + L6_w18[-(i + 1)]) for i in range(half)]
L7_w36 = [(L6_w18[i] - L6_w18[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a37 = [(L6_a19[i] + L6_a19[-(i + 1)]) for i in range(half)]
L7_w37 = [(L6_a19[i] - L6_a19[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a38 = [(L6_w19[i] + L6_w19[-(i + 1)]) for i in range(half)]
L7_w38 = [(L6_w19[i] - L6_w19[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a39 = [(L6_a20[i] + L6_a20[-(i + 1)]) for i in range(half)]
L7_w39 = [(L6_a20[i] - L6_a20[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a40 = [(L6_w20[i] + L6_w20[-(i + 1)]) for i in range(half)]
L7_w40 = [(L6_w20[i] - L6_w20[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a41 = [(L6_a21[i] + L6_a21[-(i + 1)]) for i in range(half)]
L7_w41 = [(L6_a21[i] - L6_a21[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a42 = [(L6_w21[i] + L6_w21[-(i + 1)]) for i in range(half)]
L7_w42 = [(L6_w21[i] - L6_w21[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a43 = [(L6_a22[i] + L6_a22[-(i + 1)]) for i in range(half)]
L7_w43 = [(L6_a22[i] - L6_a22[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a44 = [(L6_w22[i] + L6_w22[-(i + 1)]) for i in range(half)]
L7_w44 = [(L6_w22[i] - L6_w22[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a45 = [(L6_a23[i] + L6_a23[-(i + 1)]) for i in range(half)]
L7_w45 = [(L6_a23[i] - L6_a23[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a46 = [(L6_w23[i] + L6_w23[-(i + 1)]) for i in range(half)]
L7_w46 = [(L6_w23[i] - L6_w23[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a47 = [(L6_a24[i] + L6_a24[-(i + 1)]) for i in range(half)]
L7_w47 = [(L6_a24[i] - L6_a24[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a48 = [(L6_w24[i] + L6_w24[-(i + 1)]) for i in range(half)]
L7_w48 = [(L6_w24[i] - L6_w24[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a49 = [(L6_a25[i] + L6_a25[-(i + 1)]) for i in range(half)]
L7_w49 = [(L6_a25[i] - L6_a25[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a50 = [(L6_w25[i] + L6_w25[-(i + 1)]) for i in range(half)]
L7_w50 = [(L6_w25[i] - L6_w25[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a51 = [(L6_a26[i] + L6_a26[-(i + 1)]) for i in range(half)]
L7_w51 = [(L6_a26[i] - L6_a26[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a52 = [(L6_w26[i] + L6_w26[-(i + 1)]) for i in range(half)]
L7_w52 = [(L6_w26[i] - L6_w26[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a53 = [(L6_a27[i] + L6_a27[-(i + 1)]) for i in range(half)]
L7_w53 = [(L6_a27[i] - L6_a27[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a54 = [(L6_w27[i] + L6_w27[-(i + 1)]) for i in range(half)]
L7_w54 = [(L6_w27[i] - L6_w27[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a55 = [(L6_a28[i] + L6_a28[-(i + 1)]) for i in range(half)]
L7_w55 = [(L6_a28[i] - L6_a28[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a56 = [(L6_w28[i] + L6_w28[-(i + 1)]) for i in range(half)]
L7_w56 = [(L6_w28[i] - L6_w28[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a57 = [(L6_a29[i] + L6_a29[-(i + 1)]) for i in range(half)]
L7_w57 = [(L6_a29[i] - L6_a29[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a58 = [(L6_w29[i] + L6_w29[-(i + 1)]) for i in range(half)]
L7_w58 = [(L6_w29[i] - L6_w29[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a59 = [(L6_a30[i] + L6_a30[-(i + 1)]) for i in range(half)]
L7_w59 = [(L6_a30[i] - L6_a30[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a60 = [(L6_w30[i] + L6_w30[-(i + 1)]) for i in range(half)]
L7_w60 = [(L6_w30[i] - L6_w30[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a61 = [(L6_a31[i] + L6_a31[-(i + 1)]) for i in range(half)]
L7_w61 = [(L6_a31[i] - L6_a31[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a62 = [(L6_w31[i] + L6_w31[-(i + 1)]) for i in range(half)]
L7_w62 = [(L6_w31[i] - L6_w31[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a63 = [(L6_a32[i] + L6_a32[-(i + 1)]) for i in range(half)]
L7_w63 = [(L6_a32[i] - L6_a32[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L7_a64 = [(L6_w32[i] + L6_w32[-(i + 1)]) for i in range(half)]
L7_w64 = [(L6_w32[i] - L6_w32[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range(half):
    L7_a1[i] = round(L7_a1[i], 3)
    L7_w1[i] = round(L7_w1[i], 3)
    L7_a2[i] = round(L7_a2[i], 3)
    L7_w2[i] = round(L7_w2[i], 3)
    L7_a3[i] = round(L7_a3[i], 3)
    L7_w3[i] = round(L7_w3[i], 3)
    L7_a4[i] = round(L7_a4[i], 3)
    L7_w4[i] = round(L7_w4[i], 3)
    L7_a5[i] = round(L7_a5[i], 3)
    L7_w5[i] = round(L7_w5[i], 3)
    L7_a6[i] = round(L7_a6[i], 3)
    L7_w6[i] = round(L7_w6[i], 3)
    L7_a7[i] = round(L7_a7[i], 3)
    L7_w7[i] = round(L7_w7[i], 3)
    L7_a8[i] = round(L7_a8[i], 3)
    L7_w8[i] = round(L7_w8[i], 3)
    L7_a9[i] = round(L7_a9[i], 3)
    L7_w9[i] = round(L7_w9[i], 3)
    L7_a10[i] = round(L7_a10[i], 3)
    L7_w10[i] = round(L7_w10[i], 3)
    L7_a11[i] = round(L7_a11[i], 3)
    L7_w11[i] = round(L7_w11[i], 3)
    L7_a12[i] = round(L7_a12[i], 3)
    L7_w12[i] = round(L7_w12[i], 3)
    L7_a13[i] = round(L7_a13[i], 3)
    L7_w13[i] = round(L7_w13[i], 3)
    L7_a14[i] = round(L7_a14[i], 3)
    L7_w14[i] = round(L7_w14[i], 3)
    L7_a15[i] = round(L7_a15[i], 3)
    L7_w15[i] = round(L7_w15[i], 3)
    L7_a16[i] = round(L7_a16[i], 3)
    L7_w16[i] = round(L7_w16[i], 3)
    L7_a17[i] = round(L7_a17[i], 3)
    L7_w17[i] = round(L7_w17[i], 3)
    L7_a18[i] = round(L7_a18[i], 3)
    L7_w18[i] = round(L7_w18[i], 3)
    L7_a19[i] = round(L7_a19[i], 3)
    L7_w19[i] = round(L7_w19[i], 3)
    L7_a20[i] = round(L7_a20[i], 3)
    L7_w20[i] = round(L7_w20[i], 3)
    L7_a21[i] = round(L7_a21[i], 3)
    L7_w21[i] = round(L7_w21[i], 3)
    L7_a22[i] = round(L7_a22[i], 3)
    L7_w22[i] = round(L7_w22[i], 3)
    L7_a23[i] = round(L7_a23[i], 3)
    L7_w23[i] = round(L7_w23[i], 3)
    L7_a24[i] = round(L7_a24[i], 3)
    L7_w24[i] = round(L7_w24[i], 3)
    L7_a25[i] = round(L7_a25[i], 3)
    L7_w25[i] = round(L7_w25[i], 3)
    L7_a26[i] = round(L7_a26[i], 3)
    L7_w26[i] = round(L7_w26[i], 3)
    L7_a27[i] = round(L7_a27[i], 3)
    L7_w27[i] = round(L7_w27[i], 3)
    L7_a28[i] = round(L7_a28[i], 3)
    L7_w28[i] = round(L7_w28[i], 3)
    L7_a29[i] = round(L7_a29[i], 3)
    L7_w29[i] = round(L7_w29[i], 3)
    L7_a30[i] = round(L7_a30[i], 3)
    L7_w30[i] = round(L7_w30[i], 3)
    L7_a31[i] = round(L7_a31[i], 3)
    L7_w31[i] = round(L7_w31[i], 3)
    L7_a32[i] = round(L7_a32[i], 3)
    L7_w32[i] = round(L7_w32[i], 3)
    L7_a33[i] = round(L7_a33[i], 3)
    L7_w33[i] = round(L7_w33[i], 3)
    L7_a34[i] = round(L7_a34[i], 3)
    L7_w34[i] = round(L7_w34[i], 3)
    L7_a35[i] = round(L7_a35[i], 3)
    L7_w35[i] = round(L7_w35[i], 3)
    L7_a36[i] = round(L7_a36[i], 3)
    L7_w36[i] = round(L7_w36[i], 3)
    L7_a37[i] = round(L7_a37[i], 3)
    L7_w37[i] = round(L7_w37[i], 3)
    L7_a38[i] = round(L7_a38[i], 3)
    L7_w38[i] = round(L7_w38[i], 3)
    L7_a39[i] = round(L7_a39[i], 3)
    L7_w39[i] = round(L7_w39[i], 3)
    L7_a40[i] = round(L7_a40[i], 3)
    L7_w40[i] = round(L7_w40[i], 3)
    L7_a41[i] = round(L7_a41[i], 3)
    L7_w41[i] = round(L7_w41[i], 3)
    L7_a42[i] = round(L7_a42[i], 3)
    L7_w42[i] = round(L7_w42[i], 3)
    L7_a43[i] = round(L7_a43[i], 3)
    L7_w43[i] = round(L7_w43[i], 3)
    L7_a44[i] = round(L7_a44[i], 3)
    L7_w44[i] = round(L7_w44[i], 3)
    L7_a45[i] = round(L7_a45[i], 3)
    L7_w45[i] = round(L7_w45[i], 3)
    L7_a46[i] = round(L7_a46[i], 3)
    L7_w46[i] = round(L7_w46[i], 3)
    L7_a47[i] = round(L7_a47[i], 3)
    L7_w47[i] = round(L7_w47[i], 3)
    L7_a48[i] = round(L7_a48[i], 3)
    L7_w48[i] = round(L7_w48[i], 3)
    L7_a49[i] = round(L7_a49[i], 3)
    L7_w49[i] = round(L7_w49[i], 3)
    L7_a50[i] = round(L7_a50[i], 3)
    L7_w50[i] = round(L7_w50[i], 3)
    L7_a51[i] = round(L7_a51[i], 3)
    L7_w51[i] = round(L7_w51[i], 3)
    L7_a52[i] = round(L7_a52[i], 3)
    L7_w52[i] = round(L7_w52[i], 3)
    L7_a53[i] = round(L7_a53[i], 3)
    L7_w53[i] = round(L7_w53[i], 3)
    L7_a54[i] = round(L7_a54[i], 3)
    L7_w54[i] = round(L7_w54[i], 3)
    L7_a55[i] = round(L7_a55[i], 3)
    L7_w55[i] = round(L7_w55[i], 3)
    L7_a56[i] = round(L7_a56[i], 3)
    L7_w56[i] = round(L7_w56[i], 3)
    L7_a57[i] = round(L7_a57[i], 3)
    L7_w57[i] = round(L7_w57[i], 3)
    L7_a58[i] = round(L7_a58[i], 3)
    L7_w58[i] = round(L7_w58[i], 3)
    L7_a59[i] = round(L7_a59[i], 3)
    L7_w59[i] = round(L7_w59[i], 3)
    L7_a60[i] = round(L7_a60[i], 3)
    L7_w60[i] = round(L7_w60[i], 3)
    L7_a61[i] = round(L7_a61[i], 3)
    L7_w61[i] = round(L7_w61[i], 3)
    L7_a62[i] = round(L7_a62[i], 3)
    L7_w62[i] = round(L7_w62[i], 3)
    L7_a63[i] = round(L7_a63[i], 3)
    L7_w63[i] = round(L7_w63[i], 3)
    L7_a64[i] = round(L7_a64[i], 3)
    L7_w64[i] = round(L7_w64[i], 3)

'''for i in range(half):
    print(L7_a1[i])
for i in range(half):
    print(L7_w1[-i-1])
for i in range(half):
    print(L7_a2[i])
for i in range(half):
    print(L7_w2[-i-1])
for i in range(half):
    print(L7_a3[i])
for i in range(half):
    print(L7_w3[-i-1])
for i in range(half):
    print(L7_a4[i])
for i in range(half):
    print(L7_w4[-i-1])
for i in range(half):
    print(L7_a5[i])
for i in range(half):
    print(L7_w5[-i-1])
for i in range(half):
    print(L7_a6[i])
for i in range(half):
    print(L7_w6[-i-1])
for i in range(half):
    print(L7_a7[i])
for i in range(half):
    print(L7_w7[-i-1])
for i in range(half):
    print(L7_a8[i])
for i in range(half):
    print(L7_w8[-i-1])
for i in range(half):
    print(L7_a9[i])
for i in range(half):
    print(L7_w9[-i-1])
for i in range(half):
    print(L7_a10[i])
for i in range(half):
    print(L7_w10[-i-1])
for i in range(half):
    print(L7_a11[i])
for i in range(half):
    print(L7_w11[-i-1])
for i in range(half):
    print(L7_a12[i])
for i in range(half):
    print(L7_w12[-i-1])
for i in range(half):
    print(L7_a13[i])
for i in range(half):
    print(L7_w13[-i-1])
for i in range(half):
    print(L7_a14[i])
for i in range(half):
    print(L7_w14[-i-1])
for i in range(half):
    print(L7_a15[i])
for i in range(half):
    print(L7_w15[-i-1])
for i in range(half):
    print(L7_a16[i])
for i in range(half):
    print(L7_w16[-i-1])
for i in range(half):
    print(L7_a17[i])
for i in range(half):
    print(L7_w17[-i-1])
for i in range(half):
    print(L7_a18[i])
for i in range(half):
    print(L7_w18[-i-1])
for i in range(half):
    print(L7_a19[i])
for i in range(half):
    print(L7_w19[-i-1])
for i in range(half):
    print(L7_a20[i])
for i in range(half):
    print(L7_w20[-i-1])
for i in range(half):
    print(L7_a21[i])
for i in range(half):
    print(L7_w21[-i-1])
for i in range(half):
    print(L7_a22[i])
for i in range(half):
    print(L7_w22[-i-1])
for i in range(half):
    print(L7_a23[i])
for i in range(half):
    print(L7_w23[-i-1])
for i in range(half):
    print(L7_a24[i])
for i in range(half):
    print(L7_w24[-i-1])
for i in range(half):
    print(L7_a25[i])
for i in range(half):
    print(L7_w25[-i-1])
for i in range(half):
    print(L7_a26[i])
for i in range(half):
    print(L7_w26[-i-1])
for i in range(half):
    print(L7_a27[i])
for i in range(half):
    print(L7_w27[-i-1])
for i in range(half):
    print(L7_a28[i])
for i in range(half):
    print(L7_w28[-i-1])
for i in range(half):
    print(L7_a29[i])
for i in range(half):
    print(L7_w29[-i-1])
for i in range(half):
    print(L7_a30[i])
for i in range(half):
    print(L7_w30[-i-1])
for i in range(half):
    print(L7_a31[i])
for i in range(half):
    print(L7_w31[-i-1])
for i in range(half):
    print(L7_a32[i])
for i in range(half):
    print(L7_w32[-i-1])
for i in range(half):
    print(L7_a33[i])
for i in range(half):
    print(L7_w33[-i-1])
for i in range(half):
    print(L7_a34[i])
for i in range(half):
    print(L7_w34[-i-1])
for i in range(half):
    print(L7_a35[i])
for i in range(half):
    print(L7_w35[-i-1])
for i in range(half):
    print(L7_a36[i])
for i in range(half):
    print(L7_w36[-i-1])
for i in range(half):
    print(L7_a37[i])
for i in range(half):
    print(L7_w37[-i-1])
for i in range(half):
    print(L7_a38[i])
for i in range(half):
    print(L7_w38[-i-1])
for i in range(half):
    print(L7_a39[i])
for i in range(half):
    print(L7_w39[-i-1])
for i in range(half):
    print(L7_a40[i])
for i in range(half):
    print(L7_w40[-i-1])
for i in range(half):
    print(L7_a41[i])
for i in range(half):
    print(L7_w41[-i-1])
for i in range(half):
    print(L7_a42[i])
for i in range(half):
    print(L7_w42[-i-1])
for i in range(half):
    print(L7_a43[i])
for i in range(half):
    print(L7_w43[-i-1])
for i in range(half):
    print(L7_a44[i])
for i in range(half):
    print(L7_w44[-i-1])
for i in range(half):
    print(L7_a45[i])
for i in range(half):
    print(L7_w45[-i-1])
for i in range(half):
    print(L7_a46[i])
for i in range(half):
    print(L7_w46[-i-1])
for i in range(half):
    print(L7_a47[i])
for i in range(half):
    print(L7_w47[-i-1])
for i in range(half):
    print(L7_a48[i])
for i in range(half):
    print(L7_w48[-i-1])
for i in range(half):
    print(L7_a49[i])
for i in range(half):
    print(L7_w49[-i-1])
for i in range(half):
    print(L7_a50[i])
for i in range(half):
    print(L7_w50[-i-1])
for i in range(half):
    print(L7_a51[i])
for i in range(half):
    print(L7_w51[-i-1])
for i in range(half):
    print(L7_a52[i])
for i in range(half):
    print(L7_w52[-i-1])
for i in range(half):
    print(L7_a53[i])
for i in range(half):
    print(L7_w53[-i-1])
for i in range(half):
    print(L7_a54[i])
for i in range(half):
    print(L7_w54[-i-1])
for i in range(half):
    print(L7_a55[i])
for i in range(half):
    print(L7_w55[-i-1])
for i in range(half):
    print(L7_a56[i])
for i in range(half):
    print(L7_w56[-i-1])
for i in range(half):
    print(L7_a57[i])
for i in range(half):
    print(L7_w57[-i-1])
for i in range(half):
    print(L7_a58[i])
for i in range(half):
    print(L7_w58[-i-1])
for i in range(half):
    print(L7_a59[i])
for i in range(half):
    print(L7_w59[-i-1])
for i in range(half):
    print(L7_a60[i])
for i in range(half):
    print(L7_w60[-i-1])
for i in range(half):
    print(L7_a61[i])
for i in range(half):
    print(L7_w61[-i-1])
for i in range(half):
    print(L7_a62[i])
for i in range(half):
    print(L7_w62[-i-1])
for i in range(half):
    print(L7_a63[i])
for i in range(half):
    print(L7_w63[-i-1])
for i in range(half):
    print(L7_a64[i])
for i in range(half):
    print(L7_w64[-i-1])'''

n=2
half=1
L8 = [0.0] *256
L8[0] = [(L7_a1[i] + L7_a1[-(i + 1)]) for i in range(half)]
L8[1] = [(L7_a1[i] - L7_a1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[2] = [(L7_w1[i] + L7_w1[-(i + 1)]) for i in range(half)]
L8[3] = [(L7_w1[i] - L7_w1[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[4] = [(L7_a2[i] + L7_a2[-(i + 1)]) for i in range(half)]
L8[5] = [(L7_a2[i] - L7_a2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[6] = [(L7_w2[i] + L7_w2[-(i + 1)]) for i in range(half)]
L8[7] = [(L7_w2[i] - L7_w2[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[8] = [(L7_a3[i] + L7_a3[-(i + 1)]) for i in range(half)]
L8[9] = [(L7_a3[i] - L7_a3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[10] = [(L7_w3[i] + L7_w3[-(i + 1)]) for i in range(half)]
L8[11] = [(L7_w3[i] - L7_w3[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[12] = [(L7_a4[i] + L7_a4[-(i + 1)]) for i in range(half)]
L8[13] = [(L7_a4[i] - L7_a4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[14] = [(L7_w4[i] + L7_w4[-(i + 1)]) for i in range(half)]
L8[15] = [(L7_w4[i] - L7_w4[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[16] = [(L7_a5[i] + L7_a5[-(i + 1)]) for i in range(half)]
L8[17] = [(L7_a5[i] - L7_a5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[18] = [(L7_w5[i] + L7_w5[-(i + 1)]) for i in range(half)]
L8[19] = [(L7_w5[i] - L7_w5[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[20] = [(L7_a6[i] + L7_a6[-(i + 1)]) for i in range(half)]
L8[21] = [(L7_a6[i] - L7_a6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[22] = [(L7_w6[i] + L7_w6[-(i + 1)]) for i in range(half)]
L8[23] = [(L7_w6[i] - L7_w6[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[24] = [(L7_a7[i] + L7_a7[-(i + 1)]) for i in range(half)]
L8[25] = [(L7_a7[i] - L7_a7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[26] = [(L7_w7[i] + L7_w7[-(i + 1)]) for i in range(half)]
L8[27] = [(L7_w7[i] - L7_w7[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[28] = [(L7_a8[i] + L7_a8[-(i + 1)]) for i in range(half)]
L8[29] = [(L7_a8[i] - L7_a8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[30] = [(L7_w8[i] + L7_w8[-(i + 1)]) for i in range(half)]
L8[31] = [(L7_w8[i] - L7_w8[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[32] = [(L7_a9[i] + L7_a9[-(i + 1)]) for i in range(half)]
L8[33] = [(L7_a9[i] - L7_a9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[34] = [(L7_w9[i] + L7_w9[-(i + 1)]) for i in range(half)]
L8[35] = [(L7_w9[i] - L7_w9[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[36] = [(L7_a10[i] + L7_a10[-(i + 1)]) for i in range(half)]
L8[37] = [(L7_a10[i] - L7_a10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[38] = [(L7_w10[i] + L7_w10[-(i + 1)]) for i in range(half)]
L8[39] = [(L7_w10[i] - L7_w10[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[40] = [(L7_a11[i] + L7_a11[-(i + 1)]) for i in range(half)]
L8[41] = [(L7_a11[i] - L7_a11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[42] = [(L7_w11[i] + L7_w11[-(i + 1)]) for i in range(half)]
L8[43] = [(L7_w11[i] - L7_w11[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[44] = [(L7_a12[i] + L7_a12[-(i + 1)]) for i in range(half)]
L8[45] = [(L7_a12[i] - L7_a12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[46] = [(L7_w12[i] + L7_w12[-(i + 1)]) for i in range(half)]
L8[47] = [(L7_w12[i] - L7_w12[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[48] = [(L7_a13[i] + L7_a13[-(i + 1)]) for i in range(half)]
L8[49] = [(L7_a13[i] - L7_a13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[50] = [(L7_w13[i] + L7_w13[-(i + 1)]) for i in range(half)]
L8[51] = [(L7_w13[i] - L7_w13[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[52] = [(L7_a14[i] + L7_a14[-(i + 1)]) for i in range(half)]
L8[53] = [(L7_a14[i] - L7_a14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[54] = [(L7_w14[i] + L7_w14[-(i + 1)]) for i in range(half)]
L8[55] = [(L7_w14[i] - L7_w14[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[56] = [(L7_a15[i] + L7_a15[-(i + 1)]) for i in range(half)]
L8[57] = [(L7_a15[i] - L7_a15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[58] = [(L7_w15[i] + L7_w15[-(i + 1)]) for i in range(half)]
L8[59] = [(L7_w15[i] - L7_w15[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[60] = [(L7_a16[i] + L7_a16[-(i + 1)]) for i in range(half)]
L8[61] = [(L7_a16[i] - L7_a16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[62] = [(L7_w16[i] + L7_w16[-(i + 1)]) for i in range(half)]
L8[63] = [(L7_w16[i] - L7_w16[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[64] = [(L7_a17[i] + L7_a17[-(i + 1)]) for i in range(half)]
L8[65] = [(L7_a17[i] - L7_a17[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[66] = [(L7_w17[i] + L7_w17[-(i + 1)]) for i in range(half)]
L8[67] = [(L7_w17[i] - L7_w17[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[68] = [(L7_a18[i] + L7_a18[-(i + 1)]) for i in range(half)]
L8[69] = [(L7_a18[i] - L7_a18[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[70] = [(L7_w18[i] + L7_w18[-(i + 1)]) for i in range(half)]
L8[71] = [(L7_w18[i] - L7_w18[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[72] = [(L7_a19[i] + L7_a19[-(i + 1)]) for i in range(half)]
L8[73] = [(L7_a19[i] - L7_a19[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[74] = [(L7_w19[i] + L7_w19[-(i + 1)]) for i in range(half)]
L8[75] = [(L7_w19[i] - L7_w19[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[76] = [(L7_a20[i] + L7_a20[-(i + 1)]) for i in range(half)]
L8[77] = [(L7_a20[i] - L7_a20[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[78] = [(L7_w20[i] + L7_w20[-(i + 1)]) for i in range(half)]
L8[79] = [(L7_w20[i] - L7_w20[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[80] = [(L7_a21[i] + L7_a21[-(i + 1)]) for i in range(half)]
L8[81] = [(L7_a21[i] - L7_a21[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[82] = [(L7_w21[i] + L7_w21[-(i + 1)]) for i in range(half)]
L8[83] = [(L7_w21[i] - L7_w21[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[84] = [(L7_a22[i] + L7_a22[-(i + 1)]) for i in range(half)]
L8[85] = [(L7_a22[i] - L7_a22[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[86] = [(L7_w22[i] + L7_w22[-(i + 1)]) for i in range(half)]
L8[87] = [(L7_w22[i] - L7_w22[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[88] = [(L7_a23[i] + L7_a23[-(i + 1)]) for i in range(half)]
L8[89] = [(L7_a23[i] - L7_a23[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[90] = [(L7_w23[i] + L7_w23[-(i + 1)]) for i in range(half)]
L8[91] = [(L7_w23[i] - L7_w23[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[92] = [(L7_a24[i] + L7_a24[-(i + 1)]) for i in range(half)]
L8[93] = [(L7_a24[i] - L7_a24[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[94] = [(L7_w24[i] + L7_w24[-(i + 1)]) for i in range(half)]
L8[95] = [(L7_w24[i] - L7_w24[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[96] = [(L7_a25[i] + L7_a25[-(i + 1)]) for i in range(half)]
L8[97] = [(L7_a25[i] - L7_a25[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[98] = [(L7_w25[i] + L7_w25[-(i + 1)]) for i in range(half)]
L8[99] = [(L7_w25[i] - L7_w25[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[100] = [(L7_a26[i] + L7_a26[-(i + 1)]) for i in range(half)]
L8[101] = [(L7_a26[i] - L7_a26[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[102] = [(L7_w26[i] + L7_w26[-(i + 1)]) for i in range(half)]
L8[103] = [(L7_w26[i] - L7_w26[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[104] = [(L7_a27[i] + L7_a27[-(i + 1)]) for i in range(half)]
L8[105] = [(L7_a27[i] - L7_a27[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[106] = [(L7_w27[i] + L7_w27[-(i + 1)]) for i in range(half)]
L8[107] = [(L7_w27[i] - L7_w27[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[108] = [(L7_a28[i] + L7_a28[-(i + 1)]) for i in range(half)]
L8[109] = [(L7_a28[i] - L7_a28[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[110] = [(L7_w28[i] + L7_w28[-(i + 1)]) for i in range(half)]
L8[111] = [(L7_w28[i] - L7_w28[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[112] = [(L7_a29[i] + L7_a29[-(i + 1)]) for i in range(half)]
L8[113] = [(L7_a29[i] - L7_a29[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[114] = [(L7_w29[i] + L7_w29[-(i + 1)]) for i in range(half)]
L8[115] = [(L7_w29[i] - L7_w29[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[116] = [(L7_a30[i] + L7_a30[-(i + 1)]) for i in range(half)]
L8[117] = [(L7_a30[i] - L7_a30[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[118] = [(L7_w30[i] + L7_w30[-(i + 1)]) for i in range(half)]
L8[119] = [(L7_w30[i] - L7_w30[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[120] = [(L7_a31[i] + L7_a31[-(i + 1)]) for i in range(half)]
L8[121] = [(L7_a31[i] - L7_a31[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[122] = [(L7_w31[i] + L7_w31[-(i + 1)]) for i in range(half)]
L8[123] = [(L7_w31[i] - L7_w31[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[124] = [(L7_a32[i] + L7_a32[-(i + 1)]) for i in range(half)]
L8[125] = [(L7_a32[i] - L7_a32[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[126] = [(L7_w32[i] + L7_w32[-(i + 1)]) for i in range(half)]
L8[127] = [(L7_w32[i] - L7_w32[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[128] = [(L7_a33[i] + L7_a33[-(i + 1)]) for i in range(half)]
L8[129] = [(L7_a33[i] - L7_a33[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[130] = [(L7_w33[i] + L7_w33[-(i + 1)]) for i in range(half)]
L8[131] = [(L7_w33[i] - L7_w33[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[132] = [(L7_a34[i] + L7_a34[-(i + 1)]) for i in range(half)]
L8[133] = [(L7_a34[i] - L7_a34[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[134] = [(L7_w34[i] + L7_w34[-(i + 1)]) for i in range(half)]
L8[135] = [(L7_w34[i] - L7_w34[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[136] = [(L7_a35[i] + L7_a35[-(i + 1)]) for i in range(half)]
L8[137] = [(L7_a35[i] - L7_a35[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[138] = [(L7_w35[i] + L7_w35[-(i + 1)]) for i in range(half)]
L8[139] = [(L7_w35[i] - L7_w35[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[140] = [(L7_a36[i] + L7_a36[-(i + 1)]) for i in range(half)]
L8[141] = [(L7_a36[i] - L7_a36[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[142] = [(L7_w36[i] + L7_w36[-(i + 1)]) for i in range(half)]
L8[143] = [(L7_w36[i] - L7_w36[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[144] = [(L7_a37[i] + L7_a37[-(i + 1)]) for i in range(half)]
L8[145] = [(L7_a37[i] - L7_a37[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[146] = [(L7_w37[i] + L7_w37[-(i + 1)]) for i in range(half)]
L8[147] = [(L7_w37[i] - L7_w37[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[148] = [(L7_a38[i] + L7_a38[-(i + 1)]) for i in range(half)]
L8[149] = [(L7_a38[i] - L7_a38[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[150] = [(L7_w38[i] + L7_w38[-(i + 1)]) for i in range(half)]
L8[151] = [(L7_w38[i] - L7_w38[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[152] = [(L7_a39[i] + L7_a39[-(i + 1)]) for i in range(half)]
L8[153] = [(L7_a39[i] - L7_a39[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[154] = [(L7_w39[i] + L7_w39[-(i + 1)]) for i in range(half)]
L8[155] = [(L7_w39[i] - L7_w39[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[156] = [(L7_a40[i] + L7_a40[-(i + 1)]) for i in range(half)]
L8[157] = [(L7_a40[i] - L7_a40[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[158] = [(L7_w40[i] + L7_w40[-(i + 1)]) for i in range(half)]
L8[159] = [(L7_w40[i] - L7_w40[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[160] = [(L7_a41[i] + L7_a41[-(i + 1)]) for i in range(half)]
L8[161] = [(L7_a41[i] - L7_a41[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[162] = [(L7_w41[i] + L7_w41[-(i + 1)]) for i in range(half)]
L8[163] = [(L7_w41[i] - L7_w41[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[164] = [(L7_a42[i] + L7_a42[-(i + 1)]) for i in range(half)]
L8[165] = [(L7_a42[i] - L7_a42[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[166] = [(L7_w42[i] + L7_w42[-(i + 1)]) for i in range(half)]
L8[167] = [(L7_w42[i] - L7_w42[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[168] = [(L7_a43[i] + L7_a43[-(i + 1)]) for i in range(half)]
L8[169] = [(L7_a43[i] - L7_a43[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[170] = [(L7_w43[i] + L7_w43[-(i + 1)]) for i in range(half)]
L8[171] = [(L7_w43[i] - L7_w43[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[172] = [(L7_a44[i] + L7_a44[-(i + 1)]) for i in range(half)]
L8[173] = [(L7_a44[i] - L7_a44[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[174] = [(L7_w44[i] + L7_w44[-(i + 1)]) for i in range(half)]
L8[175] = [(L7_w44[i] - L7_w44[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[176] = [(L7_a45[i] + L7_a45[-(i + 1)]) for i in range(half)]
L8[177] = [(L7_a45[i] - L7_a45[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[178] = [(L7_w45[i] + L7_w45[-(i + 1)]) for i in range(half)]
L8[179] = [(L7_w45[i] - L7_w45[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[180] = [(L7_a46[i] + L7_a46[-(i + 1)]) for i in range(half)]
L8[181] = [(L7_a46[i] - L7_a46[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[182] = [(L7_w46[i] + L7_w46[-(i + 1)]) for i in range(half)]
L8[183] = [(L7_w46[i] - L7_w46[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[184] = [(L7_a47[i] + L7_a47[-(i + 1)]) for i in range(half)]
L8[185] = [(L7_a47[i] - L7_a47[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[186] = [(L7_w47[i] + L7_w47[-(i + 1)]) for i in range(half)]
L8[187] = [(L7_w47[i] - L7_w47[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[188] = [(L7_a48[i] + L7_a48[-(i + 1)]) for i in range(half)]
L8[189] = [(L7_a48[i] - L7_a48[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[190] = [(L7_w48[i] + L7_w48[-(i + 1)]) for i in range(half)]
L8[191] = [(L7_w48[i] - L7_w48[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[192] = [(L7_a49[i] + L7_a49[-(i + 1)]) for i in range(half)]
L8[193] = [(L7_a49[i] - L7_a49[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[194] = [(L7_w49[i] + L7_w49[-(i + 1)]) for i in range(half)]
L8[195] = [(L7_w49[i] - L7_w49[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[196] = [(L7_a50[i] + L7_a50[-(i + 1)]) for i in range(half)]
L8[197] = [(L7_a50[i] - L7_a50[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[198] = [(L7_w50[i] + L7_w50[-(i + 1)]) for i in range(half)]
L8[199] = [(L7_w50[i] - L7_w50[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[200] = [(L7_a51[i] + L7_a51[-(i + 1)]) for i in range(half)]
L8[201] = [(L7_a51[i] - L7_a51[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[202] = [(L7_w51[i] + L7_w51[-(i + 1)]) for i in range(half)]
L8[203] = [(L7_w51[i] - L7_w51[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[204] = [(L7_a52[i] + L7_a52[-(i + 1)]) for i in range(half)]
L8[205] = [(L7_a52[i] - L7_a52[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[206] = [(L7_w52[i] + L7_w52[-(i + 1)]) for i in range(half)]
L8[207] = [(L7_w52[i] - L7_w52[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[208] = [(L7_a53[i] + L7_a53[-(i + 1)]) for i in range(half)]
L8[209] = [(L7_a53[i] - L7_a53[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[210] = [(L7_w53[i] + L7_w53[-(i + 1)]) for i in range(half)]
L8[211] = [(L7_w53[i] - L7_w53[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[212] = [(L7_a54[i] + L7_a54[-(i + 1)]) for i in range(half)]
L8[213] = [(L7_a54[i] - L7_a54[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[214] = [(L7_w54[i] + L7_w54[-(i + 1)]) for i in range(half)]
L8[215] = [(L7_w54[i] - L7_w54[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[216] = [(L7_a55[i] + L7_a55[-(i + 1)]) for i in range(half)]
L8[217] = [(L7_a55[i] - L7_a55[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[218] = [(L7_w55[i] + L7_w55[-(i + 1)]) for i in range(half)]
L8[219] = [(L7_w55[i] - L7_w55[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[220] = [(L7_a56[i] + L7_a56[-(i + 1)]) for i in range(half)]
L8[221] = [(L7_a56[i] - L7_a56[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[222] = [(L7_w56[i] + L7_w56[-(i + 1)]) for i in range(half)]
L8[223] = [(L7_w56[i] - L7_w56[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[224] = [(L7_a57[i] + L7_a57[-(i + 1)]) for i in range(half)]
L8[225] = [(L7_a57[i] - L7_a57[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[226] = [(L7_w57[i] + L7_w57[-(i + 1)]) for i in range(half)]
L8[227] = [(L7_w57[i] - L7_w57[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[228] = [(L7_a58[i] + L7_a58[-(i + 1)]) for i in range(half)]
L8[229] = [(L7_a58[i] - L7_a58[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[230] = [(L7_w58[i] + L7_w58[-(i + 1)]) for i in range(half)]
L8[231] = [(L7_w58[i] - L7_w58[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[232] = [(L7_a59[i] + L7_a59[-(i + 1)]) for i in range(half)]
L8[233] = [(L7_a59[i] - L7_a59[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[234] = [(L7_w59[i] + L7_w59[-(i + 1)]) for i in range(half)]
L8[235] = [(L7_w59[i] - L7_w59[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[236] = [(L7_a60[i] + L7_a60[-(i + 1)]) for i in range(half)]
L8[237] = [(L7_a60[i] - L7_a60[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[238] = [(L7_w60[i] + L7_w60[-(i + 1)]) for i in range(half)]
L8[239] = [(L7_w60[i] - L7_w60[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[240] = [(L7_a61[i] + L7_a61[-(i + 1)]) for i in range(half)]
L8[241] = [(L7_a61[i] - L7_a61[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[242] = [(L7_w61[i] + L7_w61[-(i + 1)]) for i in range(half)]
L8[243] = [(L7_w61[i] - L7_w61[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[244] = [(L7_a62[i] + L7_a62[-(i + 1)]) for i in range(half)]
L8[245] = [(L7_a62[i] - L7_a62[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[246] = [(L7_w62[i] + L7_w62[-(i + 1)]) for i in range(half)]
L8[247] = [(L7_w62[i] - L7_w62[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[248] = [(L7_a63[i] + L7_a63[-(i + 1)]) for i in range(half)]
L8[249] = [(L7_a63[i] - L7_a63[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[250] = [(L7_w63[i] + L7_w63[-(i + 1)]) for i in range(half)]
L8[251] = [(L7_w63[i] - L7_w63[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[252] = [(L7_a64[i] + L7_a64[-(i + 1)]) for i in range(half)]
L8[253] = [(L7_a64[i] - L7_a64[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]
L8[254] = [(L7_w64[i] + L7_w64[-(i + 1)]) for i in range(half)]
L8[255] = [(L7_w64[i] - L7_w64[-(i + 1)]) / (math.cos((i + 0.5) * math.pi / n) * 2.0) for i in range(half)]

for i in range (256):
    L8[i][0] = round(L8[i][0], 3)
    #print("{0}".format(L8[i][0]))

R7 = [0.0]*256
R7[ 0]=L8[ 0][0];
R7[ 1]=L8[ 1][0];
R7[ 2]=L8[ 2][0];
R7[ 3]=L8[ 3][0];
R7[ 4]=L8[ 4][0];
R7[ 5]=L8[ 5][0];
R7[ 6]=L8[ 6][0];
R7[ 7]=L8[ 7][0];
R7[ 8]=L8[ 8][0];
R7[ 9]=L8[ 9][0];
R7[100]=L8[100][0];
R7[101]=L8[101][0];
R7[102]=L8[102][0];
R7[103]=L8[103][0];
R7[104]=L8[104][0];
R7[105]=L8[105][0];
R7[106]=L8[106][0];
R7[107]=L8[107][0];
R7[108]=L8[108][0];
R7[109]=L8[109][0];
R7[10]=L8[10][0];
R7[110]=L8[110][0];
R7[111]=L8[111][0];
R7[112]=L8[112][0];
R7[113]=L8[113][0];
R7[114]=L8[114][0];
R7[115]=L8[115][0];
R7[116]=L8[116][0];
R7[117]=L8[117][0];
R7[118]=L8[118][0];
R7[119]=L8[119][0];
R7[11]=L8[11][0];
R7[120]=L8[120][0];
R7[121]=L8[121][0];
R7[122]=L8[122][0];
R7[123]=L8[123][0];
R7[124]=L8[124][0];
R7[125]=L8[125][0];
R7[126]=L8[126][0];
R7[127]=L8[127][0];
R7[128]=L8[128][0];
R7[129]=L8[129][0];
R7[12]=L8[12][0];
R7[130]=L8[130][0];
R7[131]=L8[131][0];
R7[132]=L8[132][0];
R7[133]=L8[133][0];
R7[134]=L8[134][0];
R7[135]=L8[135][0];
R7[136]=L8[136][0];
R7[137]=L8[137][0];
R7[138]=L8[138][0];
R7[139]=L8[139][0];
R7[13]=L8[13][0];
R7[140]=L8[140][0];
R7[141]=L8[141][0];
R7[142]=L8[142][0];
R7[143]=L8[143][0];
R7[144]=L8[144][0];
R7[145]=L8[145][0];
R7[146]=L8[146][0];
R7[147]=L8[147][0];
R7[148]=L8[148][0];
R7[149]=L8[149][0];
R7[14]=L8[14][0];
R7[150]=L8[150][0];
R7[151]=L8[151][0];
R7[152]=L8[152][0];
R7[153]=L8[153][0];
R7[154]=L8[154][0];
R7[155]=L8[155][0];
R7[156]=L8[156][0];
R7[157]=L8[157][0];
R7[158]=L8[158][0];
R7[159]=L8[159][0];
R7[15]=L8[15][0];
R7[160]=L8[160][0];
R7[161]=L8[161][0];
R7[162]=L8[162][0];
R7[163]=L8[163][0];
R7[164]=L8[164][0];
R7[165]=L8[165][0];
R7[166]=L8[166][0];
R7[167]=L8[167][0];
R7[168]=L8[168][0];
R7[169]=L8[169][0];
R7[16]=L8[16][0];
R7[170]=L8[170][0];
R7[171]=L8[171][0];
R7[172]=L8[172][0];
R7[173]=L8[173][0];
R7[174]=L8[174][0];
R7[175]=L8[175][0];
R7[176]=L8[176][0];
R7[177]=L8[177][0];
R7[178]=L8[178][0];
R7[179]=L8[179][0];
R7[17]=L8[17][0];
R7[180]=L8[180][0];
R7[181]=L8[181][0];
R7[182]=L8[182][0];
R7[183]=L8[183][0];
R7[184]=L8[184][0];
R7[185]=L8[185][0];
R7[186]=L8[186][0];
R7[187]=L8[187][0];
R7[188]=L8[188][0];
R7[189]=L8[189][0];
R7[18]=L8[18][0];
R7[190]=L8[190][0];
R7[191]=L8[191][0];
R7[192]=L8[192][0];
R7[193]=L8[193][0];
R7[194]=L8[194][0];
R7[195]=L8[195][0];
R7[196]=L8[196][0];
R7[197]=L8[197][0];
R7[198]=L8[198][0];
R7[199]=L8[199][0];
R7[19]=L8[19][0];
R7[200]=L8[200][0];
R7[201]=L8[201][0];
R7[202]=L8[202][0];
R7[203]=L8[203][0];
R7[204]=L8[204][0];
R7[205]=L8[205][0];
R7[206]=L8[206][0];
R7[207]=L8[207][0];
R7[208]=L8[208][0];
R7[209]=L8[209][0];
R7[20]=L8[20][0];
R7[210]=L8[210][0];
R7[211]=L8[211][0];
R7[212]=L8[212][0];
R7[213]=L8[213][0];
R7[214]=L8[214][0];
R7[215]=L8[215][0];
R7[216]=L8[216][0];
R7[217]=L8[217][0];
R7[218]=L8[218][0];
R7[219]=L8[219][0];
R7[21]=L8[21][0];
R7[220]=L8[220][0];
R7[221]=L8[221][0];
R7[222]=L8[222][0];
R7[223]=L8[223][0];
R7[224]=L8[224][0];
R7[225]=L8[225][0];
R7[226]=L8[226][0];
R7[227]=L8[227][0];
R7[228]=L8[228][0];
R7[229]=L8[229][0];
R7[22]=L8[22][0];
R7[230]=L8[230][0];
R7[231]=L8[231][0];
R7[232]=L8[232][0];
R7[233]=L8[233][0];
R7[234]=L8[234][0];
R7[235]=L8[235][0];
R7[236]=L8[236][0];
R7[237]=L8[237][0];
R7[238]=L8[238][0];
R7[239]=L8[239][0];
R7[23]=L8[23][0];
R7[240]=L8[240][0];
R7[241]=L8[241][0];
R7[242]=L8[242][0];
R7[243]=L8[243][0];
R7[244]=L8[244][0];
R7[245]=L8[245][0];
R7[246]=L8[246][0];
R7[247]=L8[247][0];
R7[248]=L8[248][0];
R7[249]=L8[249][0];
R7[24]=L8[24][0];
R7[250]=L8[250][0];
R7[251]=L8[251][0];
R7[252]=L8[252][0];
R7[253]=L8[253][0];
R7[254]=L8[254][0];
R7[255]=L8[255][0];
R7[25]=L8[25][0];
R7[26]=L8[26][0];
R7[27]=L8[27][0];
R7[28]=L8[28][0];
R7[29]=L8[29][0];
R7[30]=L8[30][0];
R7[31]=L8[31][0];
R7[32]=L8[32][0];
R7[33]=L8[33][0];
R7[34]=L8[34][0];
R7[35]=L8[35][0];
R7[36]=L8[36][0];
R7[37]=L8[37][0];
R7[38]=L8[38][0];
R7[39]=L8[39][0];
R7[40]=L8[40][0];
R7[41]=L8[41][0];
R7[42]=L8[42][0];
R7[43]=L8[43][0];
R7[44]=L8[44][0];
R7[45]=L8[45][0];
R7[46]=L8[46][0];
R7[47]=L8[47][0];
R7[48]=L8[48][0];
R7[49]=L8[49][0];
R7[50]=L8[50][0];
R7[51]=L8[51][0];
R7[52]=L8[52][0];
R7[53]=L8[53][0];
R7[54]=L8[54][0];
R7[55]=L8[55][0];
R7[56]=L8[56][0];
R7[57]=L8[57][0];
R7[58]=L8[58][0];
R7[59]=L8[59][0];
R7[60]=L8[60][0];
R7[61]=L8[61][0];
R7[62]=L8[62][0];
R7[63]=L8[63][0];
R7[64]=L8[64][0];
R7[65]=L8[65][0];
R7[66]=L8[66][0];
R7[67]=L8[67][0];
R7[68]=L8[68][0];
R7[69]=L8[69][0];
R7[70]=L8[70][0];
R7[71]=L8[71][0];
R7[72]=L8[72][0];
R7[73]=L8[73][0];
R7[74]=L8[74][0];
R7[75]=L8[75][0];
R7[76]=L8[76][0];
R7[77]=L8[77][0];
R7[78]=L8[78][0];
R7[79]=L8[79][0];
R7[80]=L8[80][0];
R7[81]=L8[81][0];
R7[82]=L8[82][0];
R7[83]=L8[83][0];
R7[84]=L8[84][0];
R7[85]=L8[85][0];
R7[86]=L8[86][0];
R7[87]=L8[87][0];
R7[88]=L8[88][0];
R7[89]=L8[89][0];
R7[90]=L8[90][0];
R7[91]=L8[91][0];
R7[92]=L8[92][0];
R7[93]=L8[93][0];
R7[94]=L8[94][0];
R7[95]=L8[95][0];
R7[96]=L8[96][0];
R7[97]=L8[97][0];
R7[98]=L8[98][0];
R7[99]=L8[99][0];

R6 = [0.0]*256
R6[ 0]=R7[ 0];
R6[ 1]=R7[ 2]+R7[ 3];
R6[ 2]=R7[ 1];
R6[ 3]=R7[ 3];
R6[ 4]=R7[ 4];
R6[ 5]=R7[ 6]+R7[ 7];
R6[ 6]=R7[ 5];
R6[ 7]=R7[ 7];
R6[ 8]=R7[ 8];
R6[ 9]=R7[10]+R7[11];
R6[100]=R7[100];
R6[101]=R7[102]+R7[103];
R6[102]=R7[101];
R6[103]=R7[103];
R6[104]=R7[104];
R6[105]=R7[106]+R7[107];
R6[106]=R7[105];
R6[107]=R7[107];
R6[108]=R7[108];
R6[109]=R7[110]+R7[111];
R6[10]=R7[ 9];
R6[110]=R7[109];
R6[111]=R7[111];
R6[112]=R7[112];
R6[113]=R7[114]+R7[115];
R6[114]=R7[113];
R6[115]=R7[115];
R6[116]=R7[116];
R6[117]=R7[118]+R7[119];
R6[118]=R7[117];
R6[119]=R7[119];
R6[11]=R7[11];
R6[120]=R7[120];
R6[121]=R7[122]+R7[123];
R6[122]=R7[121];
R6[123]=R7[123];
R6[124]=R7[124];
R6[125]=R7[126]+R7[127];
R6[126]=R7[125];
R6[127]=R7[127];
R6[128]=R7[128];
R6[129]=R7[130]+R7[131];
R6[12]=R7[12];
R6[130]=R7[129];
R6[131]=R7[131];
R6[132]=R7[132];
R6[133]=R7[134]+R7[135];
R6[134]=R7[133];
R6[135]=R7[135];
R6[136]=R7[136];
R6[137]=R7[138]+R7[139];
R6[138]=R7[137];
R6[139]=R7[139];
R6[13]=R7[14]+R7[15];
R6[140]=R7[140];
R6[141]=R7[142]+R7[143];
R6[142]=R7[141];
R6[143]=R7[143];
R6[144]=R7[144];
R6[145]=R7[146]+R7[147];
R6[146]=R7[145];
R6[147]=R7[147];
R6[148]=R7[148];
R6[149]=R7[150]+R7[151];
R6[14]=R7[13];
R6[150]=R7[149];
R6[151]=R7[151];
R6[152]=R7[152];
R6[153]=R7[154]+R7[155];
R6[154]=R7[153];
R6[155]=R7[155];
R6[156]=R7[156];
R6[157]=R7[158]+R7[159];
R6[158]=R7[157];
R6[159]=R7[159];
R6[15]=R7[15];
R6[160]=R7[160];
R6[161]=R7[162]+R7[163];
R6[162]=R7[161];
R6[163]=R7[163];
R6[164]=R7[164];
R6[165]=R7[166]+R7[167];
R6[166]=R7[165];
R6[167]=R7[167];
R6[168]=R7[168];
R6[169]=R7[170]+R7[171];
R6[16]=R7[16];
R6[170]=R7[169];
R6[171]=R7[171];
R6[172]=R7[172];
R6[173]=R7[174]+R7[175];
R6[174]=R7[173];
R6[175]=R7[175];
R6[176]=R7[176];
R6[177]=R7[178]+R7[179];
R6[178]=R7[177];
R6[179]=R7[179];
R6[17]=R7[18]+R7[19];
R6[180]=R7[180];
R6[181]=R7[182]+R7[183];
R6[182]=R7[181];
R6[183]=R7[183];
R6[184]=R7[184];
R6[185]=R7[186]+R7[187];
R6[186]=R7[185];
R6[187]=R7[187];
R6[188]=R7[188];
R6[189]=R7[190]+R7[191];
R6[18]=R7[17];
R6[190]=R7[189];
R6[191]=R7[191];
R6[192]=R7[192];
R6[193]=R7[194]+R7[195];
R6[194]=R7[193];
R6[195]=R7[195];
R6[196]=R7[196];
R6[197]=R7[198]+R7[199];
R6[198]=R7[197];
R6[199]=R7[199];
R6[19]=R7[19];
R6[200]=R7[200];
R6[201]=R7[202]+R7[203];
R6[202]=R7[201];
R6[203]=R7[203];
R6[204]=R7[204];
R6[205]=R7[206]+R7[207];
R6[206]=R7[205];
R6[207]=R7[207];
R6[208]=R7[208];
R6[209]=R7[210]+R7[211];
R6[20]=R7[20];
R6[210]=R7[209];
R6[211]=R7[211];
R6[212]=R7[212];
R6[213]=R7[214]+R7[215];
R6[214]=R7[213];
R6[215]=R7[215];
R6[216]=R7[216];
R6[217]=R7[218]+R7[219];
R6[218]=R7[217];
R6[219]=R7[219];
R6[21]=R7[22]+R7[23];
R6[220]=R7[220];
R6[221]=R7[222]+R7[223];
R6[222]=R7[221];
R6[223]=R7[223];
R6[224]=R7[224];
R6[225]=R7[226]+R7[227];
R6[226]=R7[225];
R6[227]=R7[227];
R6[228]=R7[228];
R6[229]=R7[230]+R7[231];
R6[22]=R7[21];
R6[230]=R7[229];
R6[231]=R7[231];
R6[232]=R7[232];
R6[233]=R7[234]+R7[235];
R6[234]=R7[233];
R6[235]=R7[235];
R6[236]=R7[236];
R6[237]=R7[238]+R7[239];
R6[238]=R7[237];
R6[239]=R7[239];
R6[23]=R7[23];
R6[240]=R7[240];
R6[241]=R7[242]+R7[243];
R6[242]=R7[241];
R6[243]=R7[243];
R6[244]=R7[244];
R6[245]=R7[246]+R7[247];
R6[246]=R7[245];
R6[247]=R7[247];
R6[248]=R7[248];
R6[249]=R7[250]+R7[251];
R6[24]=R7[24];
R6[250]=R7[249];
R6[251]=R7[251];
R6[252]=R7[252];
R6[253]=R7[254]+R7[255];
R6[254]=R7[253];
R6[255]=R7[255];
R6[25]=R7[26]+R7[27];
R6[26]=R7[25];
R6[27]=R7[27];
R6[28]=R7[28];
R6[29]=R7[30]+R7[31];
R6[30]=R7[29];
R6[31]=R7[31];
R6[32]=R7[32];
R6[33]=R7[34]+R7[35];
R6[34]=R7[33];
R6[35]=R7[35];
R6[36]=R7[36];
R6[37]=R7[38]+R7[39];
R6[38]=R7[37];
R6[39]=R7[39];
R6[40]=R7[40];
R6[41]=R7[42]+R7[43];
R6[42]=R7[41];
R6[43]=R7[43];
R6[44]=R7[44];
R6[45]=R7[46]+R7[47];
R6[46]=R7[45];
R6[47]=R7[47];
R6[48]=R7[48];
R6[49]=R7[50]+R7[51];
R6[50]=R7[49];
R6[51]=R7[51];
R6[52]=R7[52];
R6[53]=R7[54]+R7[55];
R6[54]=R7[53];
R6[55]=R7[55];
R6[56]=R7[56];
R6[57]=R7[58]+R7[59];
R6[58]=R7[57];
R6[59]=R7[59];
R6[60]=R7[60];
R6[61]=R7[62]+R7[63];
R6[62]=R7[61];
R6[63]=R7[63];
R6[64]=R7[64];
R6[65]=R7[66]+R7[67];
R6[66]=R7[65];
R6[67]=R7[67];
R6[68]=R7[68];
R6[69]=R7[70]+R7[71];
R6[70]=R7[69];
R6[71]=R7[71];
R6[72]=R7[72];
R6[73]=R7[74]+R7[75];
R6[74]=R7[73];
R6[75]=R7[75];
R6[76]=R7[76];
R6[77]=R7[78]+R7[79];
R6[78]=R7[77];
R6[79]=R7[79];
R6[80]=R7[80];
R6[81]=R7[82]+R7[83];
R6[82]=R7[81];
R6[83]=R7[83];
R6[84]=R7[84];
R6[85]=R7[86]+R7[87];
R6[86]=R7[85];
R6[87]=R7[87];
R6[88]=R7[88];
R6[89]=R7[90]+R7[91];
R6[90]=R7[89];
R6[91]=R7[91];
R6[92]=R7[92];
R6[93]=R7[94]+R7[95];
R6[94]=R7[93];
R6[95]=R7[95];
R6[96]=R7[96];
R6[97]=R7[98]+R7[99];
R6[98]=R7[97];
R6[99]=R7[99];

R5 = [0.0]*256
R5[ 0]=R6[ 0];
R5[ 1]=R6[ 4]+R6[ 5];
R5[ 2]=R6[ 1];
R5[ 3]=R6[ 5]+R6[ 6];
R5[ 4]=R6[ 2];
R5[ 5]=R6[ 6]+R6[ 7];
R5[ 6]=R6[ 3];
R5[ 7]=R6[ 7];
R5[ 8]=R6[ 8];
R5[ 9]=R6[12]+R6[13];
R5[100]=R6[98];
R5[101]=R6[102]+R6[103];
R5[102]=R6[99];
R5[103]=R6[103];
R5[104]=R6[104];
R5[105]=R6[108]+R6[109];
R5[106]=R6[105];
R5[107]=R6[109]+R6[110];
R5[108]=R6[106];
R5[109]=R6[110]+R6[111];
R5[10]=R6[ 9];
R5[110]=R6[107];
R5[111]=R6[111];
R5[112]=R6[112];
R5[113]=R6[116]+R6[117];
R5[114]=R6[113];
R5[115]=R6[117]+R6[118];
R5[116]=R6[114];
R5[117]=R6[118]+R6[119];
R5[118]=R6[115];
R5[119]=R6[119];
R5[11]=R6[13]+R6[14];
R5[120]=R6[120];
R5[121]=R6[124]+R6[125];
R5[122]=R6[121];
R5[123]=R6[125]+R6[126];
R5[124]=R6[122];
R5[125]=R6[126]+R6[127];
R5[126]=R6[123];
R5[127]=R6[127];
R5[128]=R6[128];
R5[129]=R6[132]+R6[133];
R5[12]=R6[10];
R5[130]=R6[129];
R5[131]=R6[133]+R6[134];
R5[132]=R6[130];
R5[133]=R6[134]+R6[135];
R5[134]=R6[131];
R5[135]=R6[135];
R5[136]=R6[136];
R5[137]=R6[140]+R6[141];
R5[138]=R6[137];
R5[139]=R6[141]+R6[142];
R5[13]=R6[14]+R6[15];
R5[140]=R6[138];
R5[141]=R6[142]+R6[143];
R5[142]=R6[139];
R5[143]=R6[143];
R5[144]=R6[144];
R5[145]=R6[148]+R6[149];
R5[146]=R6[145];
R5[147]=R6[149]+R6[150];
R5[148]=R6[146];
R5[149]=R6[150]+R6[151];
R5[14]=R6[11];
R5[150]=R6[147];
R5[151]=R6[151];
R5[152]=R6[152];
R5[153]=R6[156]+R6[157];
R5[154]=R6[153];
R5[155]=R6[157]+R6[158];
R5[156]=R6[154];
R5[157]=R6[158]+R6[159];
R5[158]=R6[155];
R5[159]=R6[159];
R5[15]=R6[15];
R5[160]=R6[160];
R5[161]=R6[164]+R6[165];
R5[162]=R6[161];
R5[163]=R6[165]+R6[166];
R5[164]=R6[162];
R5[165]=R6[166]+R6[167];
R5[166]=R6[163];
R5[167]=R6[167];
R5[168]=R6[168];
R5[169]=R6[172]+R6[173];
R5[16]=R6[16];
R5[170]=R6[169];
R5[171]=R6[173]+R6[174];
R5[172]=R6[170];
R5[173]=R6[174]+R6[175];
R5[174]=R6[171];
R5[175]=R6[175];
R5[176]=R6[176];
R5[177]=R6[180]+R6[181];
R5[178]=R6[177];
R5[179]=R6[181]+R6[182];
R5[17]=R6[20]+R6[21];
R5[180]=R6[178];
R5[181]=R6[182]+R6[183];
R5[182]=R6[179];
R5[183]=R6[183];
R5[184]=R6[184];
R5[185]=R6[188]+R6[189];
R5[186]=R6[185];
R5[187]=R6[189]+R6[190];
R5[188]=R6[186];
R5[189]=R6[190]+R6[191];
R5[18]=R6[17];
R5[190]=R6[187];
R5[191]=R6[191];
R5[192]=R6[192];
R5[193]=R6[196]+R6[197];
R5[194]=R6[193];
R5[195]=R6[197]+R6[198];
R5[196]=R6[194];
R5[197]=R6[198]+R6[199];
R5[198]=R6[195];
R5[199]=R6[199];
R5[19]=R6[21]+R6[22];
R5[200]=R6[200];
R5[201]=R6[204]+R6[205];
R5[202]=R6[201];
R5[203]=R6[205]+R6[206];
R5[204]=R6[202];
R5[205]=R6[206]+R6[207];
R5[206]=R6[203];
R5[207]=R6[207];
R5[208]=R6[208];
R5[209]=R6[212]+R6[213];
R5[20]=R6[18];
R5[210]=R6[209];
R5[211]=R6[213]+R6[214];
R5[212]=R6[210];
R5[213]=R6[214]+R6[215];
R5[214]=R6[211];
R5[215]=R6[215];
R5[216]=R6[216];
R5[217]=R6[220]+R6[221];
R5[218]=R6[217];
R5[219]=R6[221]+R6[222];
R5[21]=R6[22]+R6[23];
R5[220]=R6[218];
R5[221]=R6[222]+R6[223];
R5[222]=R6[219];
R5[223]=R6[223];
R5[224]=R6[224];
R5[225]=R6[228]+R6[229];
R5[226]=R6[225];
R5[227]=R6[229]+R6[230];
R5[228]=R6[226];
R5[229]=R6[230]+R6[231];
R5[22]=R6[19];
R5[230]=R6[227];
R5[231]=R6[231];
R5[232]=R6[232];
R5[233]=R6[236]+R6[237];
R5[234]=R6[233];
R5[235]=R6[237]+R6[238];
R5[236]=R6[234];
R5[237]=R6[238]+R6[239];
R5[238]=R6[235];
R5[239]=R6[239];
R5[23]=R6[23];
R5[240]=R6[240];
R5[241]=R6[244]+R6[245];
R5[242]=R6[241];
R5[243]=R6[245]+R6[246];
R5[244]=R6[242];
R5[245]=R6[246]+R6[247];
R5[246]=R6[243];
R5[247]=R6[247];
R5[248]=R6[248];
R5[249]=R6[252]+R6[253];
R5[24]=R6[24];
R5[250]=R6[249];
R5[251]=R6[253]+R6[254];
R5[252]=R6[250];
R5[253]=R6[254]+R6[255];
R5[254]=R6[251];
R5[255]=R6[255];
R5[25]=R6[28]+R6[29];
R5[26]=R6[25];
R5[27]=R6[29]+R6[30];
R5[28]=R6[26];
R5[29]=R6[30]+R6[31];
R5[30]=R6[27];
R5[31]=R6[31];
R5[32]=R6[32];
R5[33]=R6[36]+R6[37];
R5[34]=R6[33];
R5[35]=R6[37]+R6[38];
R5[36]=R6[34];
R5[37]=R6[38]+R6[39];
R5[38]=R6[35];
R5[39]=R6[39];
R5[40]=R6[40];
R5[41]=R6[44]+R6[45];
R5[42]=R6[41];
R5[43]=R6[45]+R6[46];
R5[44]=R6[42];
R5[45]=R6[46]+R6[47];
R5[46]=R6[43];
R5[47]=R6[47];
R5[48]=R6[48];
R5[49]=R6[52]+R6[53];
R5[50]=R6[49];
R5[51]=R6[53]+R6[54];
R5[52]=R6[50];
R5[53]=R6[54]+R6[55];
R5[54]=R6[51];
R5[55]=R6[55];
R5[56]=R6[56];
R5[57]=R6[60]+R6[61];
R5[58]=R6[57];
R5[59]=R6[61]+R6[62];
R5[60]=R6[58];
R5[61]=R6[62]+R6[63];
R5[62]=R6[59];
R5[63]=R6[63];
R5[64]=R6[64];
R5[65]=R6[68]+R6[69];
R5[66]=R6[65];
R5[67]=R6[69]+R6[70];
R5[68]=R6[66];
R5[69]=R6[70]+R6[71];
R5[70]=R6[67];
R5[71]=R6[71];
R5[72]=R6[72];
R5[73]=R6[76]+R6[77];
R5[74]=R6[73];
R5[75]=R6[77]+R6[78];
R5[76]=R6[74];
R5[77]=R6[78]+R6[79];
R5[78]=R6[75];
R5[79]=R6[79];
R5[80]=R6[80];
R5[81]=R6[84]+R6[85];
R5[82]=R6[81];
R5[83]=R6[85]+R6[86];
R5[84]=R6[82];
R5[85]=R6[86]+R6[87];
R5[86]=R6[83];
R5[87]=R6[87];
R5[88]=R6[88];
R5[89]=R6[92]+R6[93];
R5[90]=R6[89];
R5[91]=R6[93]+R6[94];
R5[92]=R6[90];
R5[93]=R6[94]+R6[95];
R5[94]=R6[91];
R5[95]=R6[95];
R5[96]=R6[96];
R5[97]=R6[100]+R6[101];
R5[98]=R6[97];
R5[99]=R6[101]+R6[102];

R4 = [0.0]*256
R4[ 0]=R5[ 0];
R4[ 1]=R5[ 8]+R5[ 9];
R4[ 2]=R5[ 1];
R4[ 3]=R5[ 9]+R5[10];
R4[ 4]=R5[ 2];
R4[ 5]=R5[10]+R5[11];
R4[ 6]=R5[ 3];
R4[ 7]=R5[11]+R5[12];
R4[ 8]=R5[ 4];
R4[ 9]=R5[12]+R5[13];
R4[100]=R5[98];
R4[101]=R5[106]+R5[107];
R4[102]=R5[99];
R4[103]=R5[107]+R5[108];
R4[104]=R5[100];
R4[105]=R5[108]+R5[109];
R4[106]=R5[101];
R4[107]=R5[109]+R5[110];
R4[108]=R5[102];
R4[109]=R5[110]+R5[111];
R4[10]=R5[ 5];
R4[110]=R5[103];
R4[111]=R5[111];
R4[112]=R5[112];
R4[113]=R5[120]+R5[121];
R4[114]=R5[113];
R4[115]=R5[121]+R5[122];
R4[116]=R5[114];
R4[117]=R5[122]+R5[123];
R4[118]=R5[115];
R4[119]=R5[123]+R5[124];
R4[11]=R5[13]+R5[14];
R4[120]=R5[116];
R4[121]=R5[124]+R5[125];
R4[122]=R5[117];
R4[123]=R5[125]+R5[126];
R4[124]=R5[118];
R4[125]=R5[126]+R5[127];
R4[126]=R5[119];
R4[127]=R5[127];
R4[128]=R5[128];
R4[129]=R5[136]+R5[137];
R4[12]=R5[ 6];
R4[130]=R5[129];
R4[131]=R5[137]+R5[138];
R4[132]=R5[130];
R4[133]=R5[138]+R5[139];
R4[134]=R5[131];
R4[135]=R5[139]+R5[140];
R4[136]=R5[132];
R4[137]=R5[140]+R5[141];
R4[138]=R5[133];
R4[139]=R5[141]+R5[142];
R4[13]=R5[14]+R5[15];
R4[140]=R5[134];
R4[141]=R5[142]+R5[143];
R4[142]=R5[135];
R4[143]=R5[143];
R4[144]=R5[144];
R4[145]=R5[152]+R5[153];
R4[146]=R5[145];
R4[147]=R5[153]+R5[154];
R4[148]=R5[146];
R4[149]=R5[154]+R5[155];
R4[14]=R5[ 7];
R4[150]=R5[147];
R4[151]=R5[155]+R5[156];
R4[152]=R5[148];
R4[153]=R5[156]+R5[157];
R4[154]=R5[149];
R4[155]=R5[157]+R5[158];
R4[156]=R5[150];
R4[157]=R5[158]+R5[159];
R4[158]=R5[151];
R4[159]=R5[159];
R4[15]=R5[15];
R4[160]=R5[160];
R4[161]=R5[168]+R5[169];
R4[162]=R5[161];
R4[163]=R5[169]+R5[170];
R4[164]=R5[162];
R4[165]=R5[170]+R5[171];
R4[166]=R5[163];
R4[167]=R5[171]+R5[172];
R4[168]=R5[164];
R4[169]=R5[172]+R5[173];
R4[16]=R5[16];
R4[170]=R5[165];
R4[171]=R5[173]+R5[174];
R4[172]=R5[166];
R4[173]=R5[174]+R5[175];
R4[174]=R5[167];
R4[175]=R5[175];
R4[176]=R5[176];
R4[177]=R5[184]+R5[185];
R4[178]=R5[177];
R4[179]=R5[185]+R5[186];
R4[17]=R5[24]+R5[25];
R4[180]=R5[178];
R4[181]=R5[186]+R5[187];
R4[182]=R5[179];
R4[183]=R5[187]+R5[188];
R4[184]=R5[180];
R4[185]=R5[188]+R5[189];
R4[186]=R5[181];
R4[187]=R5[189]+R5[190];
R4[188]=R5[182];
R4[189]=R5[190]+R5[191];
R4[18]=R5[17];
R4[190]=R5[183];
R4[191]=R5[191];
R4[192]=R5[192];
R4[193]=R5[200]+R5[201];
R4[194]=R5[193];
R4[195]=R5[201]+R5[202];
R4[196]=R5[194];
R4[197]=R5[202]+R5[203];
R4[198]=R5[195];
R4[199]=R5[203]+R5[204];
R4[19]=R5[25]+R5[26];
R4[200]=R5[196];
R4[201]=R5[204]+R5[205];
R4[202]=R5[197];
R4[203]=R5[205]+R5[206];
R4[204]=R5[198];
R4[205]=R5[206]+R5[207];
R4[206]=R5[199];
R4[207]=R5[207];
R4[208]=R5[208];
R4[209]=R5[216]+R5[217];
R4[20]=R5[18];
R4[210]=R5[209];
R4[211]=R5[217]+R5[218];
R4[212]=R5[210];
R4[213]=R5[218]+R5[219];
R4[214]=R5[211];
R4[215]=R5[219]+R5[220];
R4[216]=R5[212];
R4[217]=R5[220]+R5[221];
R4[218]=R5[213];
R4[219]=R5[221]+R5[222];
R4[21]=R5[26]+R5[27];
R4[220]=R5[214];
R4[221]=R5[222]+R5[223];
R4[222]=R5[215];
R4[223]=R5[223];
R4[224]=R5[224];
R4[225]=R5[232]+R5[233];
R4[226]=R5[225];
R4[227]=R5[233]+R5[234];
R4[228]=R5[226];
R4[229]=R5[234]+R5[235];
R4[22]=R5[19];
R4[230]=R5[227];
R4[231]=R5[235]+R5[236];
R4[232]=R5[228];
R4[233]=R5[236]+R5[237];
R4[234]=R5[229];
R4[235]=R5[237]+R5[238];
R4[236]=R5[230];
R4[237]=R5[238]+R5[239];
R4[238]=R5[231];
R4[239]=R5[239];
R4[23]=R5[27]+R5[28];
R4[240]=R5[240];
R4[241]=R5[248]+R5[249];
R4[242]=R5[241];
R4[243]=R5[249]+R5[250];
R4[244]=R5[242];
R4[245]=R5[250]+R5[251];
R4[246]=R5[243];
R4[247]=R5[251]+R5[252];
R4[248]=R5[244];
R4[249]=R5[252]+R5[253];
R4[24]=R5[20];
R4[250]=R5[245];
R4[251]=R5[253]+R5[254];
R4[252]=R5[246];
R4[253]=R5[254]+R5[255];
R4[254]=R5[247];
R4[255]=R5[255];
R4[25]=R5[28]+R5[29];
R4[26]=R5[21];
R4[27]=R5[29]+R5[30];
R4[28]=R5[22];
R4[29]=R5[30]+R5[31];
R4[30]=R5[23];
R4[31]=R5[31];
R4[32]=R5[32];
R4[33]=R5[40]+R5[41];
R4[34]=R5[33];
R4[35]=R5[41]+R5[42];
R4[36]=R5[34];
R4[37]=R5[42]+R5[43];
R4[38]=R5[35];
R4[39]=R5[43]+R5[44];
R4[40]=R5[36];
R4[41]=R5[44]+R5[45];
R4[42]=R5[37];
R4[43]=R5[45]+R5[46];
R4[44]=R5[38];
R4[45]=R5[46]+R5[47];
R4[46]=R5[39];
R4[47]=R5[47];
R4[48]=R5[48];
R4[49]=R5[56]+R5[57];
R4[50]=R5[49];
R4[51]=R5[57]+R5[58];
R4[52]=R5[50];
R4[53]=R5[58]+R5[59];
R4[54]=R5[51];
R4[55]=R5[59]+R5[60];
R4[56]=R5[52];
R4[57]=R5[60]+R5[61];
R4[58]=R5[53];
R4[59]=R5[61]+R5[62];
R4[60]=R5[54];
R4[61]=R5[62]+R5[63];
R4[62]=R5[55];
R4[63]=R5[63];
R4[64]=R5[64];
R4[65]=R5[72]+R5[73];
R4[66]=R5[65];
R4[67]=R5[73]+R5[74];
R4[68]=R5[66];
R4[69]=R5[74]+R5[75];
R4[70]=R5[67];
R4[71]=R5[75]+R5[76];
R4[72]=R5[68];
R4[73]=R5[76]+R5[77];
R4[74]=R5[69];
R4[75]=R5[77]+R5[78];
R4[76]=R5[70];
R4[77]=R5[78]+R5[79];
R4[78]=R5[71];
R4[79]=R5[79];
R4[80]=R5[80];
R4[81]=R5[88]+R5[89];
R4[82]=R5[81];
R4[83]=R5[89]+R5[90];
R4[84]=R5[82];
R4[85]=R5[90]+R5[91];
R4[86]=R5[83];
R4[87]=R5[91]+R5[92];
R4[88]=R5[84];
R4[89]=R5[92]+R5[93];
R4[90]=R5[85];
R4[91]=R5[93]+R5[94];
R4[92]=R5[86];
R4[93]=R5[94]+R5[95];
R4[94]=R5[87];
R4[95]=R5[95];
R4[96]=R5[96];
R4[97]=R5[104]+R5[105];
R4[98]=R5[97];
R4[99]=R5[105]+R5[106];

R3 = [0.0]*256
R3[ 0]=R4[ 0];
R3[ 1]=R4[16]+R4[17];
R3[ 2]=R4[ 1];
R3[ 3]=R4[17]+R4[18];
R3[ 4]=R4[ 2];
R3[ 5]=R4[18]+R4[19];
R3[ 6]=R4[ 3];
R3[ 7]=R4[19]+R4[20];
R3[ 8]=R4[ 4];
R3[ 9]=R4[20]+R4[21];
R3[100]=R4[98];
R3[101]=R4[114]+R4[115];
R3[102]=R4[99];
R3[103]=R4[115]+R4[116];
R3[104]=R4[100];
R3[105]=R4[116]+R4[117];
R3[106]=R4[101];
R3[107]=R4[117]+R4[118];
R3[108]=R4[102];
R3[109]=R4[118]+R4[119];
R3[10]=R4[ 5];
R3[110]=R4[103];
R3[111]=R4[119]+R4[120];
R3[112]=R4[104];
R3[113]=R4[120]+R4[121];
R3[114]=R4[105];
R3[115]=R4[121]+R4[122];
R3[116]=R4[106];
R3[117]=R4[122]+R4[123];
R3[118]=R4[107];
R3[119]=R4[123]+R4[124];
R3[11]=R4[21]+R4[22];
R3[120]=R4[108];
R3[121]=R4[124]+R4[125];
R3[122]=R4[109];
R3[123]=R4[125]+R4[126];
R3[124]=R4[110];
R3[125]=R4[126]+R4[127];
R3[126]=R4[111];
R3[127]=R4[127];
R3[128]=R4[128];
R3[129]=R4[144]+R4[145];
R3[12]=R4[ 6];
R3[130]=R4[129];
R3[131]=R4[145]+R4[146];
R3[132]=R4[130];
R3[133]=R4[146]+R4[147];
R3[134]=R4[131];
R3[135]=R4[147]+R4[148];
R3[136]=R4[132];
R3[137]=R4[148]+R4[149];
R3[138]=R4[133];
R3[139]=R4[149]+R4[150];
R3[13]=R4[22]+R4[23];
R3[140]=R4[134];
R3[141]=R4[150]+R4[151];
R3[142]=R4[135];
R3[143]=R4[151]+R4[152];
R3[144]=R4[136];
R3[145]=R4[152]+R4[153];
R3[146]=R4[137];
R3[147]=R4[153]+R4[154];
R3[148]=R4[138];
R3[149]=R4[154]+R4[155];
R3[14]=R4[ 7];
R3[150]=R4[139];
R3[151]=R4[155]+R4[156];
R3[152]=R4[140];
R3[153]=R4[156]+R4[157];
R3[154]=R4[141];
R3[155]=R4[157]+R4[158];
R3[156]=R4[142];
R3[157]=R4[158]+R4[159];
R3[158]=R4[143];
R3[159]=R4[159];
R3[15]=R4[23]+R4[24];
R3[160]=R4[160];
R3[161]=R4[176]+R4[177];
R3[162]=R4[161];
R3[163]=R4[177]+R4[178];
R3[164]=R4[162];
R3[165]=R4[178]+R4[179];
R3[166]=R4[163];
R3[167]=R4[179]+R4[180];
R3[168]=R4[164];
R3[169]=R4[180]+R4[181];
R3[16]=R4[ 8];
R3[170]=R4[165];
R3[171]=R4[181]+R4[182];
R3[172]=R4[166];
R3[173]=R4[182]+R4[183];
R3[174]=R4[167];
R3[175]=R4[183]+R4[184];
R3[176]=R4[168];
R3[177]=R4[184]+R4[185];
R3[178]=R4[169];
R3[179]=R4[185]+R4[186];
R3[17]=R4[24]+R4[25];
R3[180]=R4[170];
R3[181]=R4[186]+R4[187];
R3[182]=R4[171];
R3[183]=R4[187]+R4[188];
R3[184]=R4[172];
R3[185]=R4[188]+R4[189];
R3[186]=R4[173];
R3[187]=R4[189]+R4[190];
R3[188]=R4[174];
R3[189]=R4[190]+R4[191];
R3[18]=R4[ 9];
R3[190]=R4[175];
R3[191]=R4[191];
R3[192]=R4[192];
R3[193]=R4[208]+R4[209];
R3[194]=R4[193];
R3[195]=R4[209]+R4[210];
R3[196]=R4[194];
R3[197]=R4[210]+R4[211];
R3[198]=R4[195];
R3[199]=R4[211]+R4[212];
R3[19]=R4[25]+R4[26];
R3[200]=R4[196];
R3[201]=R4[212]+R4[213];
R3[202]=R4[197];
R3[203]=R4[213]+R4[214];
R3[204]=R4[198];
R3[205]=R4[214]+R4[215];
R3[206]=R4[199];
R3[207]=R4[215]+R4[216];
R3[208]=R4[200];
R3[209]=R4[216]+R4[217];
R3[20]=R4[10];
R3[210]=R4[201];
R3[211]=R4[217]+R4[218];
R3[212]=R4[202];
R3[213]=R4[218]+R4[219];
R3[214]=R4[203];
R3[215]=R4[219]+R4[220];
R3[216]=R4[204];
R3[217]=R4[220]+R4[221];
R3[218]=R4[205];
R3[219]=R4[221]+R4[222];
R3[21]=R4[26]+R4[27];
R3[220]=R4[206];
R3[221]=R4[222]+R4[223];
R3[222]=R4[207];
R3[223]=R4[223];
R3[224]=R4[224];
R3[225]=R4[240]+R4[241];
R3[226]=R4[225];
R3[227]=R4[241]+R4[242];
R3[228]=R4[226];
R3[229]=R4[242]+R4[243];
R3[22]=R4[11];
R3[230]=R4[227];
R3[231]=R4[243]+R4[244];
R3[232]=R4[228];
R3[233]=R4[244]+R4[245];
R3[234]=R4[229];
R3[235]=R4[245]+R4[246];
R3[236]=R4[230];
R3[237]=R4[246]+R4[247];
R3[238]=R4[231];
R3[239]=R4[247]+R4[248];
R3[23]=R4[27]+R4[28];
R3[240]=R4[232];
R3[241]=R4[248]+R4[249];
R3[242]=R4[233];
R3[243]=R4[249]+R4[250];
R3[244]=R4[234];
R3[245]=R4[250]+R4[251];
R3[246]=R4[235];
R3[247]=R4[251]+R4[252];
R3[248]=R4[236];
R3[249]=R4[252]+R4[253];
R3[24]=R4[12];
R3[250]=R4[237];
R3[251]=R4[253]+R4[254];
R3[252]=R4[238];
R3[253]=R4[254]+R4[255];
R3[254]=R4[239];
R3[255]=R4[255];
R3[25]=R4[28]+R4[29];
R3[26]=R4[13];
R3[27]=R4[29]+R4[30];
R3[28]=R4[14];
R3[29]=R4[30]+R4[31];
R3[30]=R4[15];
R3[31]=R4[31];
R3[32]=R4[32];
R3[33]=R4[48]+R4[49];
R3[34]=R4[33];
R3[35]=R4[49]+R4[50];
R3[36]=R4[34];
R3[37]=R4[50]+R4[51];
R3[38]=R4[35];
R3[39]=R4[51]+R4[52];
R3[40]=R4[36];
R3[41]=R4[52]+R4[53];
R3[42]=R4[37];
R3[43]=R4[53]+R4[54];
R3[44]=R4[38];
R3[45]=R4[54]+R4[55];
R3[46]=R4[39];
R3[47]=R4[55]+R4[56];
R3[48]=R4[40];
R3[49]=R4[56]+R4[57];
R3[50]=R4[41];
R3[51]=R4[57]+R4[58];
R3[52]=R4[42];
R3[53]=R4[58]+R4[59];
R3[54]=R4[43];
R3[55]=R4[59]+R4[60];
R3[56]=R4[44];
R3[57]=R4[60]+R4[61];
R3[58]=R4[45];
R3[59]=R4[61]+R4[62];
R3[60]=R4[46];
R3[61]=R4[62]+R4[63];
R3[62]=R4[47];
R3[63]=R4[63];
R3[64]=R4[64];
R3[65]=R4[80]+R4[81];
R3[66]=R4[65];
R3[67]=R4[81]+R4[82];
R3[68]=R4[66];
R3[69]=R4[82]+R4[83];
R3[70]=R4[67];
R3[71]=R4[83]+R4[84];
R3[72]=R4[68];
R3[73]=R4[84]+R4[85];
R3[74]=R4[69];
R3[75]=R4[85]+R4[86];
R3[76]=R4[70];
R3[77]=R4[86]+R4[87];
R3[78]=R4[71];
R3[79]=R4[87]+R4[88];
R3[80]=R4[72];
R3[81]=R4[88]+R4[89];
R3[82]=R4[73];
R3[83]=R4[89]+R4[90];
R3[84]=R4[74];
R3[85]=R4[90]+R4[91];
R3[86]=R4[75];
R3[87]=R4[91]+R4[92];
R3[88]=R4[76];
R3[89]=R4[92]+R4[93];
R3[90]=R4[77];
R3[91]=R4[93]+R4[94];
R3[92]=R4[78];
R3[93]=R4[94]+R4[95];
R3[94]=R4[79];
R3[95]=R4[95];
R3[96]=R4[96];
R3[97]=R4[112]+R4[113];
R3[98]=R4[97];
R3[99]=R4[113]+R4[114];

R2 = [0.0] *256
R2[ 0]=R3[ 0];
R2[ 1]=R3[32]+R3[33];
R2[ 2]=R3[ 1];
R2[ 3]=R3[33]+R3[34];
R2[ 4]=R3[ 2];
R2[ 5]=R3[34]+R3[35];
R2[ 6]=R3[ 3];
R2[ 7]=R3[35]+R3[36];
R2[ 8]=R3[ 4];
R2[ 9]=R3[36]+R3[37];
R2[100]=R3[82];
R2[101]=R3[114]+R3[115];
R2[102]=R3[83];
R2[103]=R3[115]+R3[116];
R2[104]=R3[84];
R2[105]=R3[116]+R3[117];
R2[106]=R3[85];
R2[107]=R3[117]+R3[118];
R2[108]=R3[86];
R2[109]=R3[118]+R3[119];
R2[10]=R3[ 5];
R2[110]=R3[87];
R2[111]=R3[119]+R3[120];
R2[112]=R3[88];
R2[113]=R3[120]+R3[121];
R2[114]=R3[89];
R2[115]=R3[121]+R3[122];
R2[116]=R3[90];
R2[117]=R3[122]+R3[123];
R2[118]=R3[91];
R2[119]=R3[123]+R3[124];
R2[11]=R3[37]+R3[38];
R2[120]=R3[92];
R2[121]=R3[124]+R3[125];
R2[122]=R3[93];
R2[123]=R3[125]+R3[126];
R2[124]=R3[94];
R2[125]=R3[126]+R3[127];
R2[126]=R3[95];
R2[127]=R3[127];
R2[128]=R3[128];
R2[129]=R3[160]+R3[161];
R2[12]=R3[ 6];
R2[130]=R3[129];
R2[131]=R3[161]+R3[162];
R2[132]=R3[130];
R2[133]=R3[162]+R3[163];
R2[134]=R3[131];
R2[135]=R3[163]+R3[164];
R2[136]=R3[132];
R2[137]=R3[164]+R3[165];
R2[138]=R3[133];
R2[139]=R3[165]+R3[166];
R2[13]=R3[38]+R3[39];
R2[140]=R3[134];
R2[141]=R3[166]+R3[167];
R2[142]=R3[135];
R2[143]=R3[167]+R3[168];
R2[144]=R3[136];
R2[145]=R3[168]+R3[169];
R2[146]=R3[137];
R2[147]=R3[169]+R3[170];
R2[148]=R3[138];
R2[149]=R3[170]+R3[171];
R2[14]=R3[ 7];
R2[150]=R3[139];
R2[151]=R3[171]+R3[172];
R2[152]=R3[140];
R2[153]=R3[172]+R3[173];
R2[154]=R3[141];
R2[155]=R3[173]+R3[174];
R2[156]=R3[142];
R2[157]=R3[174]+R3[175];
R2[158]=R3[143];
R2[159]=R3[175]+R3[176];
R2[15]=R3[39]+R3[40];
R2[160]=R3[144];
R2[161]=R3[176]+R3[177];
R2[162]=R3[145];
R2[163]=R3[177]+R3[178];
R2[164]=R3[146];
R2[165]=R3[178]+R3[179];
R2[166]=R3[147];
R2[167]=R3[179]+R3[180];
R2[168]=R3[148];
R2[169]=R3[180]+R3[181];
R2[16]=R3[ 8];
R2[170]=R3[149];
R2[171]=R3[181]+R3[182];
R2[172]=R3[150];
R2[173]=R3[182]+R3[183];
R2[174]=R3[151];
R2[175]=R3[183]+R3[184];
R2[176]=R3[152];
R2[177]=R3[184]+R3[185];
R2[178]=R3[153];
R2[179]=R3[185]+R3[186];
R2[17]=R3[40]+R3[41];
R2[180]=R3[154];
R2[181]=R3[186]+R3[187];
R2[182]=R3[155];
R2[183]=R3[187]+R3[188];
R2[184]=R3[156];
R2[185]=R3[188]+R3[189];
R2[186]=R3[157];
R2[187]=R3[189]+R3[190];
R2[188]=R3[158];
R2[189]=R3[190]+R3[191];
R2[18]=R3[ 9];
R2[190]=R3[159];
R2[191]=R3[191];
R2[192]=R3[192];
R2[193]=R3[224]+R3[225];
R2[194]=R3[193];
R2[195]=R3[225]+R3[226];
R2[196]=R3[194];
R2[197]=R3[226]+R3[227];
R2[198]=R3[195];
R2[199]=R3[227]+R3[228];
R2[19]=R3[41]+R3[42];
R2[200]=R3[196];
R2[201]=R3[228]+R3[229];
R2[202]=R3[197];
R2[203]=R3[229]+R3[230];
R2[204]=R3[198];
R2[205]=R3[230]+R3[231];
R2[206]=R3[199];
R2[207]=R3[231]+R3[232];
R2[208]=R3[200];
R2[209]=R3[232]+R3[233];
R2[20]=R3[10];
R2[210]=R3[201];
R2[211]=R3[233]+R3[234];
R2[212]=R3[202];
R2[213]=R3[234]+R3[235];
R2[214]=R3[203];
R2[215]=R3[235]+R3[236];
R2[216]=R3[204];
R2[217]=R3[236]+R3[237];
R2[218]=R3[205];
R2[219]=R3[237]+R3[238];
R2[21]=R3[42]+R3[43];
R2[220]=R3[206];
R2[221]=R3[238]+R3[239];
R2[222]=R3[207];
R2[223]=R3[239]+R3[240];
R2[224]=R3[208];
R2[225]=R3[240]+R3[241];
R2[226]=R3[209];
R2[227]=R3[241]+R3[242];
R2[228]=R3[210];
R2[229]=R3[242]+R3[243];
R2[22]=R3[11];
R2[230]=R3[211];
R2[231]=R3[243]+R3[244];
R2[232]=R3[212];
R2[233]=R3[244]+R3[245];
R2[234]=R3[213];
R2[235]=R3[245]+R3[246];
R2[236]=R3[214];
R2[237]=R3[246]+R3[247];
R2[238]=R3[215];
R2[239]=R3[247]+R3[248];
R2[23]=R3[43]+R3[44];
R2[240]=R3[216];
R2[241]=R3[248]+R3[249];
R2[242]=R3[217];
R2[243]=R3[249]+R3[250];
R2[244]=R3[218];
R2[245]=R3[250]+R3[251];
R2[246]=R3[219];
R2[247]=R3[251]+R3[252];
R2[248]=R3[220];
R2[249]=R3[252]+R3[253];
R2[24]=R3[12];
R2[250]=R3[221];
R2[251]=R3[253]+R3[254];
R2[252]=R3[222];
R2[253]=R3[254]+R3[255];
R2[254]=R3[223];
R2[255]=R3[255];
R2[25]=R3[44]+R3[45];
R2[26]=R3[13];
R2[27]=R3[45]+R3[46];
R2[28]=R3[14];
R2[29]=R3[46]+R3[47];
R2[30]=R3[15];
R2[31]=R3[47]+R3[48];
R2[32]=R3[16];
R2[33]=R3[48]+R3[49];
R2[34]=R3[17];
R2[35]=R3[49]+R3[50];
R2[36]=R3[18];
R2[37]=R3[50]+R3[51];
R2[38]=R3[19];
R2[39]=R3[51]+R3[52];
R2[40]=R3[20];
R2[41]=R3[52]+R3[53];
R2[42]=R3[21];
R2[43]=R3[53]+R3[54];
R2[44]=R3[22];
R2[45]=R3[54]+R3[55];
R2[46]=R3[23];
R2[47]=R3[55]+R3[56];
R2[48]=R3[24];
R2[49]=R3[56]+R3[57];
R2[50]=R3[25];
R2[51]=R3[57]+R3[58];
R2[52]=R3[26];
R2[53]=R3[58]+R3[59];
R2[54]=R3[27];
R2[55]=R3[59]+R3[60];
R2[56]=R3[28];
R2[57]=R3[60]+R3[61];
R2[58]=R3[29];
R2[59]=R3[61]+R3[62];
R2[60]=R3[30];
R2[61]=R3[62]+R3[63];
R2[62]=R3[31];
R2[63]=R3[63];
R2[64]=R3[64];
R2[65]=R3[96]+R3[97];
R2[66]=R3[65];
R2[67]=R3[97]+R3[98];
R2[68]=R3[66];
R2[69]=R3[98]+R3[99];
R2[70]=R3[67];
R2[71]=R3[99]+R3[100];
R2[72]=R3[68];
R2[73]=R3[100]+R3[101];
R2[74]=R3[69];
R2[75]=R3[101]+R3[102];
R2[76]=R3[70];
R2[77]=R3[102]+R3[103];
R2[78]=R3[71];
R2[79]=R3[103]+R3[104];
R2[80]=R3[72];
R2[81]=R3[104]+R3[105];
R2[82]=R3[73];
R2[83]=R3[105]+R3[106];
R2[84]=R3[74];
R2[85]=R3[106]+R3[107];
R2[86]=R3[75];
R2[87]=R3[107]+R3[108];
R2[88]=R3[76];
R2[89]=R3[108]+R3[109];
R2[90]=R3[77];
R2[91]=R3[109]+R3[110];
R2[92]=R3[78];
R2[93]=R3[110]+R3[111];
R2[94]=R3[79];
R2[95]=R3[111]+R3[112];
R2[96]=R3[80];
R2[97]=R3[112]+R3[113];
R2[98]=R3[81];
R2[99]=R3[113]+R3[114];

R1 = [0.0]*256
R1[ 0]=R2[ 0];
R1[ 1]=R2[64]+R2[65];
R1[ 2]=R2[ 1];
R1[ 3]=R2[65]+R2[66];
R1[ 4]=R2[ 2];
R1[ 5]=R2[66]+R2[67];
R1[ 6]=R2[ 3];
R1[ 7]=R2[67]+R2[68];
R1[ 8]=R2[ 4];
R1[ 9]=R2[68]+R2[69];
R1[100]=R2[50];
R1[101]=R2[114]+R2[115];
R1[102]=R2[51];
R1[103]=R2[115]+R2[116];
R1[104]=R2[52];
R1[105]=R2[116]+R2[117];
R1[106]=R2[53];
R1[107]=R2[117]+R2[118];
R1[108]=R2[54];
R1[109]=R2[118]+R2[119];
R1[10]=R2[ 5];
R1[110]=R2[55];
R1[111]=R2[119]+R2[120];
R1[112]=R2[56];
R1[113]=R2[120]+R2[121];
R1[114]=R2[57];
R1[115]=R2[121]+R2[122];
R1[116]=R2[58];
R1[117]=R2[122]+R2[123];
R1[118]=R2[59];
R1[119]=R2[123]+R2[124];
R1[11]=R2[69]+R2[70];
R1[120]=R2[60];
R1[121]=R2[124]+R2[125];
R1[122]=R2[61];
R1[123]=R2[125]+R2[126];
R1[124]=R2[62];
R1[125]=R2[126]+R2[127];
R1[126]=R2[63];
R1[127]=R2[127];
R1[128]=R2[128];
R1[129]=R2[192]+R2[193];
R1[12]=R2[ 6];
R1[130]=R2[129];
R1[131]=R2[193]+R2[194];
R1[132]=R2[130];
R1[133]=R2[194]+R2[195];
R1[134]=R2[131];
R1[135]=R2[195]+R2[196];
R1[136]=R2[132];
R1[137]=R2[196]+R2[197];
R1[138]=R2[133];
R1[139]=R2[197]+R2[198];
R1[13]=R2[70]+R2[71];
R1[140]=R2[134];
R1[141]=R2[198]+R2[199];
R1[142]=R2[135];
R1[143]=R2[199]+R2[200];
R1[144]=R2[136];
R1[145]=R2[200]+R2[201];
R1[146]=R2[137];
R1[147]=R2[201]+R2[202];
R1[148]=R2[138];
R1[149]=R2[202]+R2[203];
R1[14]=R2[ 7];
R1[150]=R2[139];
R1[151]=R2[203]+R2[204];
R1[152]=R2[140];
R1[153]=R2[204]+R2[205];
R1[154]=R2[141];
R1[155]=R2[205]+R2[206];
R1[156]=R2[142];
R1[157]=R2[206]+R2[207];
R1[158]=R2[143];
R1[159]=R2[207]+R2[208];
R1[15]=R2[71]+R2[72];
R1[160]=R2[144];
R1[161]=R2[208]+R2[209];
R1[162]=R2[145];
R1[163]=R2[209]+R2[210];
R1[164]=R2[146];
R1[165]=R2[210]+R2[211];
R1[166]=R2[147];
R1[167]=R2[211]+R2[212];
R1[168]=R2[148];
R1[169]=R2[212]+R2[213];
R1[16]=R2[ 8];
R1[170]=R2[149];
R1[171]=R2[213]+R2[214];
R1[172]=R2[150];
R1[173]=R2[214]+R2[215];
R1[174]=R2[151];
R1[175]=R2[215]+R2[216];
R1[176]=R2[152];
R1[177]=R2[216]+R2[217];
R1[178]=R2[153];
R1[179]=R2[217]+R2[218];
R1[17]=R2[72]+R2[73];
R1[180]=R2[154];
R1[181]=R2[218]+R2[219];
R1[182]=R2[155];
R1[183]=R2[219]+R2[220];
R1[184]=R2[156];
R1[185]=R2[220]+R2[221];
R1[186]=R2[157];
R1[187]=R2[221]+R2[222];
R1[188]=R2[158];
R1[189]=R2[222]+R2[223];
R1[18]=R2[ 9];
R1[190]=R2[159];
R1[191]=R2[223]+R2[224];
R1[192]=R2[160];
R1[193]=R2[224]+R2[225];
R1[194]=R2[161];
R1[195]=R2[225]+R2[226];
R1[196]=R2[162];
R1[197]=R2[226]+R2[227];
R1[198]=R2[163];
R1[199]=R2[227]+R2[228];
R1[19]=R2[73]+R2[74];
R1[200]=R2[164];
R1[201]=R2[228]+R2[229];
R1[202]=R2[165];
R1[203]=R2[229]+R2[230];
R1[204]=R2[166];
R1[205]=R2[230]+R2[231];
R1[206]=R2[167];
R1[207]=R2[231]+R2[232];
R1[208]=R2[168];
R1[209]=R2[232]+R2[233];
R1[20]=R2[10];
R1[210]=R2[169];
R1[211]=R2[233]+R2[234];
R1[212]=R2[170];
R1[213]=R2[234]+R2[235];
R1[214]=R2[171];
R1[215]=R2[235]+R2[236];
R1[216]=R2[172];
R1[217]=R2[236]+R2[237];
R1[218]=R2[173];
R1[219]=R2[237]+R2[238];
R1[21]=R2[74]+R2[75];
R1[220]=R2[174];
R1[221]=R2[238]+R2[239];
R1[222]=R2[175];
R1[223]=R2[239]+R2[240];
R1[224]=R2[176];
R1[225]=R2[240]+R2[241];
R1[226]=R2[177];
R1[227]=R2[241]+R2[242];
R1[228]=R2[178];
R1[229]=R2[242]+R2[243];
R1[22]=R2[11];
R1[230]=R2[179];
R1[231]=R2[243]+R2[244];
R1[232]=R2[180];
R1[233]=R2[244]+R2[245];
R1[234]=R2[181];
R1[235]=R2[245]+R2[246];
R1[236]=R2[182];
R1[237]=R2[246]+R2[247];
R1[238]=R2[183];
R1[239]=R2[247]+R2[248];
R1[23]=R2[75]+R2[76];
R1[240]=R2[184];
R1[241]=R2[248]+R2[249];
R1[242]=R2[185];
R1[243]=R2[249]+R2[250];
R1[244]=R2[186];
R1[245]=R2[250]+R2[251];
R1[246]=R2[187];
R1[247]=R2[251]+R2[252];
R1[248]=R2[188];
R1[249]=R2[252]+R2[253];
R1[24]=R2[12];
R1[250]=R2[189];
R1[251]=R2[253]+R2[254];
R1[252]=R2[190];
R1[253]=R2[254]+R2[255];
R1[254]=R2[191];
R1[255]=R2[255];
R1[25]=R2[76]+R2[77];
R1[26]=R2[13];
R1[27]=R2[77]+R2[78];
R1[28]=R2[14];
R1[29]=R2[78]+R2[79];
R1[30]=R2[15];
R1[31]=R2[79]+R2[80];
R1[32]=R2[16];
R1[33]=R2[80]+R2[81];
R1[34]=R2[17];
R1[35]=R2[81]+R2[82];
R1[36]=R2[18];
R1[37]=R2[82]+R2[83];
R1[38]=R2[19];
R1[39]=R2[83]+R2[84];
R1[40]=R2[20];
R1[41]=R2[84]+R2[85];
R1[42]=R2[21];
R1[43]=R2[85]+R2[86];
R1[44]=R2[22];
R1[45]=R2[86]+R2[87];
R1[46]=R2[23];
R1[47]=R2[87]+R2[88];
R1[48]=R2[24];
R1[49]=R2[88]+R2[89];
R1[50]=R2[25];
R1[51]=R2[89]+R2[90];
R1[52]=R2[26];
R1[53]=R2[90]+R2[91];
R1[54]=R2[27];
R1[55]=R2[91]+R2[92];
R1[56]=R2[28];
R1[57]=R2[92]+R2[93];
R1[58]=R2[29];
R1[59]=R2[93]+R2[94];
R1[60]=R2[30];
R1[61]=R2[94]+R2[95];
R1[62]=R2[31];
R1[63]=R2[95]+R2[96];
R1[64]=R2[32];
R1[65]=R2[96]+R2[97];
R1[66]=R2[33];
R1[67]=R2[97]+R2[98];
R1[68]=R2[34];
R1[69]=R2[98]+R2[99];
R1[70]=R2[35];
R1[71]=R2[99]+R2[100];
R1[72]=R2[36];
R1[73]=R2[100]+R2[101];
R1[74]=R2[37];
R1[75]=R2[101]+R2[102];
R1[76]=R2[38];
R1[77]=R2[102]+R2[103];
R1[78]=R2[39];
R1[79]=R2[103]+R2[104];
R1[80]=R2[40];
R1[81]=R2[104]+R2[105];
R1[82]=R2[41];
R1[83]=R2[105]+R2[106];
R1[84]=R2[42];
R1[85]=R2[106]+R2[107];
R1[86]=R2[43];
R1[87]=R2[107]+R2[108];
R1[88]=R2[44];
R1[89]=R2[108]+R2[109];
R1[90]=R2[45];
R1[91]=R2[109]+R2[110];
R1[92]=R2[46];
R1[93]=R2[110]+R2[111];
R1[94]=R2[47];
R1[95]=R2[111]+R2[112];
R1[96]=R2[48];
R1[97]=R2[112]+R2[113];
R1[98]=R2[49];
R1[99]=R2[113]+R2[114];

R0 = [0.0]*256
R0[ 0]=R1[ 0];
R0[ 1]=R1[128]+R1[129];
R0[ 2]=R1[ 1];
R0[ 3]=R1[129]+R1[130];
R0[ 4]=R1[ 2];
R0[ 5]=R1[130]+R1[131];
R0[ 6]=R1[ 3];
R0[ 7]=R1[131]+R1[132];
R0[ 8]=R1[ 4];
R0[ 9]=R1[132]+R1[133];
R0[100]=R1[50];
R0[101]=R1[178]+R1[179];
R0[102]=R1[51];
R0[103]=R1[179]+R1[180];
R0[104]=R1[52];
R0[105]=R1[180]+R1[181];
R0[106]=R1[53];
R0[107]=R1[181]+R1[182];
R0[108]=R1[54];
R0[109]=R1[182]+R1[183];
R0[10]=R1[ 5];
R0[110]=R1[55];
R0[111]=R1[183]+R1[184];
R0[112]=R1[56];
R0[113]=R1[184]+R1[185];
R0[114]=R1[57];
R0[115]=R1[185]+R1[186];
R0[116]=R1[58];
R0[117]=R1[186]+R1[187];
R0[118]=R1[59];
R0[119]=R1[187]+R1[188];
R0[11]=R1[133]+R1[134];
R0[120]=R1[60];
R0[121]=R1[188]+R1[189];
R0[122]=R1[61];
R0[123]=R1[189]+R1[190];
R0[124]=R1[62];
R0[125]=R1[190]+R1[191];
R0[126]=R1[63];
R0[127]=R1[191]+R1[192];
R0[128]=R1[64];
R0[129]=R1[192]+R1[193];
R0[12]=R1[ 6];
R0[130]=R1[65];
R0[131]=R1[193]+R1[194];
R0[132]=R1[66];
R0[133]=R1[194]+R1[195];
R0[134]=R1[67];
R0[135]=R1[195]+R1[196];
R0[136]=R1[68];
R0[137]=R1[196]+R1[197];
R0[138]=R1[69];
R0[139]=R1[197]+R1[198];
R0[13]=R1[134]+R1[135];
R0[140]=R1[70];
R0[141]=R1[198]+R1[199];
R0[142]=R1[71];
R0[143]=R1[199]+R1[200];
R0[144]=R1[72];
R0[145]=R1[200]+R1[201];
R0[146]=R1[73];
R0[147]=R1[201]+R1[202];
R0[148]=R1[74];
R0[149]=R1[202]+R1[203];
R0[14]=R1[ 7];
R0[150]=R1[75];
R0[151]=R1[203]+R1[204];
R0[152]=R1[76];
R0[153]=R1[204]+R1[205];
R0[154]=R1[77];
R0[155]=R1[205]+R1[206];
R0[156]=R1[78];
R0[157]=R1[206]+R1[207];
R0[158]=R1[79];
R0[159]=R1[207]+R1[208];
R0[15]=R1[135]+R1[136];
R0[160]=R1[80];
R0[161]=R1[208]+R1[209];
R0[162]=R1[81];
R0[163]=R1[209]+R1[210];
R0[164]=R1[82];
R0[165]=R1[210]+R1[211];
R0[166]=R1[83];
R0[167]=R1[211]+R1[212];
R0[168]=R1[84];
R0[169]=R1[212]+R1[213];
R0[16]=R1[ 8];
R0[170]=R1[85];
R0[171]=R1[213]+R1[214];
R0[172]=R1[86];
R0[173]=R1[214]+R1[215];
R0[174]=R1[87];
R0[175]=R1[215]+R1[216];
R0[176]=R1[88];
R0[177]=R1[216]+R1[217];
R0[178]=R1[89];
R0[179]=R1[217]+R1[218];
R0[17]=R1[136]+R1[137];
R0[180]=R1[90];
R0[181]=R1[218]+R1[219];
R0[182]=R1[91];
R0[183]=R1[219]+R1[220];
R0[184]=R1[92];
R0[185]=R1[220]+R1[221];
R0[186]=R1[93];
R0[187]=R1[221]+R1[222];
R0[188]=R1[94];
R0[189]=R1[222]+R1[223];
R0[18]=R1[ 9];
R0[190]=R1[95];
R0[191]=R1[223]+R1[224];
R0[192]=R1[96];
R0[193]=R1[224]+R1[225];
R0[194]=R1[97];
R0[195]=R1[225]+R1[226];
R0[196]=R1[98];
R0[197]=R1[226]+R1[227];
R0[198]=R1[99];
R0[199]=R1[227]+R1[228];
R0[19]=R1[137]+R1[138];
R0[200]=R1[100];
R0[201]=R1[228]+R1[229];
R0[202]=R1[101];
R0[203]=R1[229]+R1[230];
R0[204]=R1[102];
R0[205]=R1[230]+R1[231];
R0[206]=R1[103];
R0[207]=R1[231]+R1[232];
R0[208]=R1[104];
R0[209]=R1[232]+R1[233];
R0[20]=R1[10];
R0[210]=R1[105];
R0[211]=R1[233]+R1[234];
R0[212]=R1[106];
R0[213]=R1[234]+R1[235];
R0[214]=R1[107];
R0[215]=R1[235]+R1[236];
R0[216]=R1[108];
R0[217]=R1[236]+R1[237];
R0[218]=R1[109];
R0[219]=R1[237]+R1[238];
R0[21]=R1[138]+R1[139];
R0[220]=R1[110];
R0[221]=R1[238]+R1[239];
R0[222]=R1[111];
R0[223]=R1[239]+R1[240];
R0[224]=R1[112];
R0[225]=R1[240]+R1[241];
R0[226]=R1[113];
R0[227]=R1[241]+R1[242];
R0[228]=R1[114];
R0[229]=R1[242]+R1[243];
R0[22]=R1[11];
R0[230]=R1[115];
R0[231]=R1[243]+R1[244];
R0[232]=R1[116];
R0[233]=R1[244]+R1[245];
R0[234]=R1[117];
R0[235]=R1[245]+R1[246];
R0[236]=R1[118];
R0[237]=R1[246]+R1[247];
R0[238]=R1[119];
R0[239]=R1[247]+R1[248];
R0[23]=R1[139]+R1[140];
R0[240]=R1[120];
R0[241]=R1[248]+R1[249];
R0[242]=R1[121];
R0[243]=R1[249]+R1[250];
R0[244]=R1[122];
R0[245]=R1[250]+R1[251];
R0[246]=R1[123];
R0[247]=R1[251]+R1[252];
R0[248]=R1[124];
R0[249]=R1[252]+R1[253];
R0[24]=R1[12];
R0[250]=R1[125];
R0[251]=R1[253]+R1[254];
R0[252]=R1[126];
R0[253]=R1[254]+R1[255];
R0[254]=R1[127];
R0[255]=R1[255];
R0[25]=R1[140]+R1[141];
R0[26]=R1[13];
R0[27]=R1[141]+R1[142];
R0[28]=R1[14];
R0[29]=R1[142]+R1[143];
R0[30]=R1[15];
R0[31]=R1[143]+R1[144];
R0[32]=R1[16];
R0[33]=R1[144]+R1[145];
R0[34]=R1[17];
R0[35]=R1[145]+R1[146];
R0[36]=R1[18];
R0[37]=R1[146]+R1[147];
R0[38]=R1[19];
R0[39]=R1[147]+R1[148];
R0[40]=R1[20];
R0[41]=R1[148]+R1[149];
R0[42]=R1[21];
R0[43]=R1[149]+R1[150];
R0[44]=R1[22];
R0[45]=R1[150]+R1[151];
R0[46]=R1[23];
R0[47]=R1[151]+R1[152];
R0[48]=R1[24];
R0[49]=R1[152]+R1[153];
R0[50]=R1[25];
R0[51]=R1[153]+R1[154];
R0[52]=R1[26];
R0[53]=R1[154]+R1[155];
R0[54]=R1[27];
R0[55]=R1[155]+R1[156];
R0[56]=R1[28];
R0[57]=R1[156]+R1[157];
R0[58]=R1[29];
R0[59]=R1[157]+R1[158];
R0[60]=R1[30];
R0[61]=R1[158]+R1[159];
R0[62]=R1[31];
R0[63]=R1[159]+R1[160];
R0[64]=R1[32];
R0[65]=R1[160]+R1[161];
R0[66]=R1[33];
R0[67]=R1[161]+R1[162];
R0[68]=R1[34];
R0[69]=R1[162]+R1[163];
R0[70]=R1[35];
R0[71]=R1[163]+R1[164];
R0[72]=R1[36];
R0[73]=R1[164]+R1[165];
R0[74]=R1[37];
R0[75]=R1[165]+R1[166];
R0[76]=R1[38];
R0[77]=R1[166]+R1[167];
R0[78]=R1[39];
R0[79]=R1[167]+R1[168];
R0[80]=R1[40];
R0[81]=R1[168]+R1[169];
R0[82]=R1[41];
R0[83]=R1[169]+R1[170];
R0[84]=R1[42];
R0[85]=R1[170]+R1[171];
R0[86]=R1[43];
R0[87]=R1[171]+R1[172];
R0[88]=R1[44];
R0[89]=R1[172]+R1[173];
R0[90]=R1[45];
R0[91]=R1[173]+R1[174];
R0[92]=R1[46];
R0[93]=R1[174]+R1[175];
R0[94]=R1[47];
R0[95]=R1[175]+R1[176];
R0[96]=R1[48];
R0[97]=R1[176]+R1[177];
R0[98]=R1[49];
R0[99]=R1[177]+R1[178];


#keep _-bit decimal point
for i in range (256):
    R0[i] = round(R0[i], 3)
    #print(R0[i])

#print(R0)


D0 = [0.0] *256
D0 = dct(point256)/2
for i in range(256):
    D0[i] = round(D0[i], 3)
    print(D0[i])


#compare if R0 and D0 are the same, type this in ternimal
#np.array_equal(R0, D0)
#(R0==D0).all()
#(R0.D0).any()


#save in excel file
#np.savetxt("C:/Users/alice/Desktop/test.csv", R0)
