%fast 8p 1d dct from book p.109

x = [1 2 3 4 5 6 7 9];
N = size(x,1);

s1 = sin(pi/16);        c1 = cos(pi/16);
s2 = sin(2*pi/16);      c2 = cos(2*pi/16);
s3 = sin(3*pi/16);      c3 = cos(3*pi/16);
s4 = sin(4*pi/16);      c4 = cos(4*pi/16);

a1 = x(1) + x(8);         a5 = x(4) - x(5);
a2 = x(2) + x(3);         a6 = x(6) + x(7);
a3 = x(2) - x(3);         a7 = x(6) - x(7);
a4 = x(4) + x(5);         a8 = x(1) - x(8);

b1 = a1 + a4;           b5 = a5;
b2 = a2 + a6;           b6 = c4*(a2-a6);
b3 = -a3 + a7;          b7 = c4*(a3+a7);
b4 = a1 - a4;           b8 = a8;

e1 = c4*(b1+b2);        e5 = -b5-b7;
e2 = c4*(b1-b2);        e6 = b6+b8;
e3 = b3;                e7 = b5-b7;
e4 = b4;                e8 = -b6+b8;

f1 = e1;                f5 = -s1*e5+c1*e6;
f2 = e2;                f6 = c1*e5+s1*e6;
f3 = -s2*e3+c2*e4;      f7 = -s3*e7+c3*e8;
f4 = c2*e3+s2*e4;       f8 = c3*e7+s3*e8;

y = 1/2*[f1 f5 f3 f7 f2 f8 f4 f6]
