%fast 8p 1d dct from book p.101
%---failed---

x = [1 2 3 4 5 6 7 9];
N = size(x,1);

s1 = sin(pi/16);        c1 = cos(pi/16);
s3 = sin(3*pi/16);      c3 = cos(3*pi/16);
s6 = sin(6*pi/16);      c6 = cos(6*pi/16);

a1 = x(1) + x(8);       a5 = x(4) - x(5);
a2 = x(2) + x(7);       a6 = x(3) - x(6);
a3 = x(3) + x(6);       a7 = x(2) - x(7);
a4 = x(4) + x(5);       a8 = x(1) - x(8);

b1 = a1 + a4;           b5 = c3*a5+s3*a8;
b2 = a2 + a3;           b6 = c1*a6+s1*a7;
b3 = a2 - a3;           b7 = -s1*a6+c1*a7;
b4 = a1 - a4;           b8 = -s3*a5+c3*a8;

e1 = b1+b2;                     e5 = b5+b7;
e2 = b1-b2;                     e6 = -b6+b8;
e3 = sqrt(2)*(c6*b3+s6*b4);     e7 = b5-b7;
e4 = sqrt(2)*(-s6*b3+c6*b4);    e8 = b6+b8;

f5 = -e5+e8;            f7 = sqrt(2)*e7;
f6 = sqrt(2)*e6;        f8 = e5+e8;

y = [e1 f5 e3 f7 f8 e4 f6 e2]
