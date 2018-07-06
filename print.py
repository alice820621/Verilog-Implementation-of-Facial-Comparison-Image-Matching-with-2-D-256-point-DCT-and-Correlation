#a space for printing the needed Verilog code

import random

#for i in range(256):
#    print(i+1, end=" ")

#for i in range(1,64+1):
#    print("    L7_a{0}[i] = round(L7_a{0}[i], 3)".format(i))
#    print("    L7_w{0}[i] = round(L7_w{0}[i], 3)".format(i))

#for i in range(256):
#    print("assign do{0} = do{0}_; ".format(i))

#random testbench
'''v = [0.0]*256
for i in range(256):
    a = random.randrange(0,255)
    v[i] = float(a)
    print(int(v[i]), end= " ")
print(v)'''

#for i in range(256):
#    print("wr{0}, ".format(i), end="")     #no auto \n at the end of print

#for i in range(64):
#    print("for i in range(half):")
#    print("print(L7_a{0}[i])".format(i+1))
#    print("for i in range(half):")
#    print("print(L7_w{0}[i])".format(i+1))

#for i in range(256):
#    print("\t\twr{0} <= di{0};".format(i))

#for i in range(256):
#    print("{0}.0".format(i),end=",")

#n=0
'''
#for i in range(128):
#    print("\t\t\t\t{0}: begin".format(i))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(255-i))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(255-i+1))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")'''

#n=1
'''#for i in range(64):
#    print("\t\t\t\t{0}: begin".format(i))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(127-i))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(127-i+1))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(64):
    print("\t\t\t\t{0}: begin".format(i+64))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(127-i+128))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+128))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+128))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(127-i+1+128))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=2
'''#for i in range(32):
#    print("\t\t\t\t{0}: begin".format(i))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(63-i))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(63-i+1))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(32):
    print("\t\t\t\t{0}: begin".format(i+32))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(63-i+64))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+64))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+64))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(63-i+1+64))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
#print("////////////////////////////")
#for i in range(32):
#    print("\t\t\t\t{0}: begin".format(i+64))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+128))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(63-i+128))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+128))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(63-i+1+128))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(32):
    print("\t\t\t\t{0}: begin".format(i+96))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(63-i+192))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+192))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+192))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(63-i+1+192))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=3
'''#for i in range(16):
#    print("\t\t\t\t{0}: begin".format(i))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(31-i))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(16):
    print("\t\t\t\t{0}: begin".format(i+16))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(31-i+32))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+32))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+32))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+32))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
#print("////////////////////////////")
#for i in range(16):
#    print("\t\t\t\t{0}: begin".format(i+32))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+64))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(31-i+64))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+64))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+64))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(16):
    print("\t\t\t\t{0}: begin".format(i+48))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(31-i+96))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+96))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+96))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+96))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
#print("////////////////////////////")
#for i in range(16):
#    print("\t\t\t\t{0}: begin".format(i+64))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+128))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(31-i+128))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+128))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+128))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(16):
    print("\t\t\t\t{0}: begin".format(i+80))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(31-i+160))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+160))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+160))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+160))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
#print("////////////////////////////")
#for i in range(16):
#    print("\t\t\t\t{0}: begin".format(i+96))
#    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+192))
#    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(31-i+192))
#    print("\t\t\t\t\ti <= {0};".format(i))
#    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+192))
#    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+192))
#    print("\t\t\t\t\tcounter <= counter + 1;")
#    print("\t\t\t\tend")
#print("////////////////////////////")
for i in range(16):
    print("\t\t\t\t{0}: begin".format(i+112))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(31-i+224))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+224))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+224))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(31-i+1+224))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=4
'''for i in range(8):
    print("\t\t\t\t{0}: begin".format(i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+8))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+16))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+16))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+16))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+16))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+16))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+32))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+32))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+32))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+32))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+24))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+48))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+48))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+48))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+48))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+32))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+64))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+64))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+64))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+64))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+40))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+80))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+80))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+80))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+80))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+48))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+96))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+96))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+96))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+96))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+56))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+112))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+112))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+112))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+112))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+64))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+128))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+128))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+128))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+128))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+72))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+144))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+144))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+144))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+144))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+80))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+160))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+160))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+160))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+160))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+88))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+176))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+176))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+176))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+176))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+96))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+192))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+192))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+192))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+192))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+104))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+208))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+208))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+208))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+208))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+112))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(i+224))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(15-i+224))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+224))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+224))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
print("////////////////////////////")
for i in range(8):
    print("\t\t\t\t{0}: begin".format(i+120))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-i+240))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(i+240))
    print("\t\t\t\t\ti <= {0};".format(i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(i-1+240))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-i+1+240))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=5
'''for i in range(16):
    print("\t\t\t\t{0}: begin".format(0+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(0+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(7-0+16*i))
    print("\t\t\t\t\ti <= {0};".format(0))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(11+16*(i-1)))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-3+16*(i-1)))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(1+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(1+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(7-1+16*i))
    print("\t\t\t\t\ti <= {0};".format(1))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(1-1+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-1+1+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(2+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(2+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(7-2+16*i))
    print("\t\t\t\t\ti <= {0};".format(2))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(2-1+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-2+1+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(3+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(3+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(7-3+16*i))
    print("\t\t\t\t\ti <= {0};".format(3))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(3-1+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-3+1+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(4+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-0+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(8+16*i))
    print("\t\t\t\t\ti <= {0};".format(0))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(3+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-3+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(5+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-1+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(9+16*i))
    print("\t\t\t\t\ti <= {0};".format(1))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(8+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-0+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(6+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-2+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(10+16*i))
    print("\t\t\t\t\ti <= {0};".format(2))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(9+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-1+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(7+8*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(15-3+16*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(11+16*i))
    print("\t\t\t\t\ti <= {0};".format(3))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(10+16*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(15-2+16*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=6
'''for i in range(32):
    print("\t\t\t\t{0}: begin".format(0+4*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(0+8*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(3-0+8*i))
    print("\t\t\t\t\ti <= {0};".format(0))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(5+8*(i-1)))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-1+8*(i-1)))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(1+4*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(1+8*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(3-1+8*i))
    print("\t\t\t\t\ti <= {0};".format(1))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(0+8*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(3-0+8*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(2+4*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(7-0+8*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(4+8*i))
    print("\t\t\t\t\ti <= {0};".format(0))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(1+8*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(3-1+8*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(3+4*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(7-1+8*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(5+8*i))
    print("\t\t\t\t\ti <= {0};".format(1))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(4+8*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(7-0+8*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

#n=7
'''for i in range(64):
    print("\t\t\t\t{0}: begin".format(0+2*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(0+4*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(1+4*i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(4*i-2))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(1+4*i-2))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")
    print("\t\t\t\t{0}: begin".format(1+2*i))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(3+4*i))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(2+4*i))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(4*i))
    print("\t\t\t\t\twr{0} <= bfly_do2;".format(1+4*i))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''
    
'''
for i in range(64):
    print("\t\t\t\t{0}: begin".format(i))
    print("\t\t\t\t\twr{0} <= wr{1};".format(4*i+2, 4*i+1))
    print("\t\t\t\t\tbfly_di1 <= wr{0};".format(4*i+2))
    print("\t\t\t\t\tbfly_di2 <= wr{0};".format(4*i+3))
    print("\t\t\t\t\twr{0} <= bfly_do1;".format(4*i-3))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

'''for i in range(32):
    print("\t\t\t\t{0}: begin".format(i))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(8*i+1, 8*i+4,8*i+5))
    print("\t\t\t\t\twr{0} <= wr{1};".format(8*i+2,8*i+1))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(8*i+3, 8*i+5,8*i+6))
    print("\t\t\t\t\twr{0} <= wr{1};".format(8*i+4,8*i+2))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(8*i+5, 8*i+6,8*i+7))
    print("\t\t\t\t\twr{0} <= wr{1};".format(8*i+6,8*i+3))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

'''for i in range(16):
    print("\t\t\t\t{0}: begin".format(i))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+1, 16*i+8,16*i+9))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+2,16*i+1))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+3, 16*i+9,16*i+10))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+4,16*i+2))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+5, 16*i+10,16*i+11))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+6,16*i+3))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+7, 16*i+11,16*i+12))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+8,16*i+4))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+9, 16*i+12,16*i+13))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+10,16*i+5))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+11, 16*i+13,16*i+14))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+12,16*i+6))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(16*i+13, 16*i+14,16*i+15))
    print("\t\t\t\t\twr{0} <= wr{1};".format(16*i+14,16*i+7))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")'''

for i in range(8):
    print("{0}: begin".format(i))
    print("X{0}=X{1}+X{2};".format(32*i+1, 32*i+16,32*i+17))
    print("X{0}=X{1};".format(32*i+2,32*i+1))
    print("X{0}=X{1}+X{2};".format(32*i+3, 32*i+17,32*i+18))
    print("X{0}=X{1};".format(32*i+4,32*i+2))
    print("X{0}=X{1}+X{2};".format(32*i+5, 32*i+18,32*i+19))
    print("X{0}=X{1};".format(32*i+6,32*i+3))
    print("X{0}=X{1}+X{2};".format(32*i+7, 32*i+19,32*i+20))
    print("X{0}=X{1};".format(32*i+8,32*i+4))
    print("wr{0} <= wr{1}+wr{2};".format(32*i+9, 32*i+20,32*i+21))
    print("wr{0} <= wr{1};".format(32*i+10,32*i+5))
    print("wr{0} <= wr{1}+wr{2};".format(32*i+11, 32*i+21,32*i+22))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+12,32*i+6))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+13, 32*i+22,32*i+23))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+14,32*i+7))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+15, 32*i+23,32*i+24))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+16,32*i+8))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+17, 32*i+24,32*i+25))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+18,32*i+9))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+19, 32*i+25,32*i+26))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+20,32*i+10))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+21, 32*i+26,32*i+27))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+22,32*i+11))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+23, 32*i+27,32*i+28))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+24,32*i+12))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+25, 32*i+28,32*i+29))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+26,32*i+13))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+27, 32*i+29,32*i+30))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+28,32*i+14))
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(32*i+29, 32*i+30,32*i+31))
    print("\t\t\t\t\twr{0} <= wr{1};".format(32*i+30,32*i+15))
    print("\t\t\t\t\tcounter <= counter + 1;")
    print("\t\t\t\tend")

'''print("\t\t\t\t0: begin")
for i in range(31):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1, i+32,i+33))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2,i+1))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")
print("\t\t\t\t1: begin")
for i in range(31):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1+64, i+32+64,i+33+64))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2+64,i+1+64))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")
print("\t\t\t\t2: begin")
for i in range(31):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1+128, i+32+128,i+33+128))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2+128,i+1+128))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")
print("\t\t\t\t3: begin")
for i in range(31):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1+192, i+32+192,i+33+192))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2+192,i+1+192))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")'''

'''print("\t\t\t\t0: begin")
for i in range(63):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1, i+64,i+65))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2,i+1))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")
print("\t\t\t\t1: begin")
for i in range(63):
    print("\t\t\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1+128, i+64+128,i+65+128))
    print("\t\t\t\t\twr{0} <= wr{1};".format(2*i+2+128,i+1+128))
print("\t\t\t\t\tcounter <= counter + 1;")
print("\t\t\t\tend")'''

'''for i in range(127):
    print("\t\t\twr{0} <= wr{1}+wr{2};".format(2*i+1, i+128,i+129))
    print("\t\t\twr{0} <= wr{1};".format(2*i+2,i+1))'''

'''for i in range(256):
    print("\t\t\tdo{0}_ <= wr{0};".format(i))'''

'''for i in range(256):
    print("%d ", end="")
for i in range(256):
    print("do{0},".format(i), end="")'''

'''for i in range(256):
    print("%d, ", end="")
for i in range(256):
    print("di{0},".format(i), end="")'''

'''for i in range(256):
    print("\t\tdi{0} = $signed(di{0}) >>> 8;".format(i))'''
