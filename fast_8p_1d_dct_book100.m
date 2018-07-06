%fast 8p 1d dct from book p.100
%---failed---

x = [1 2 3 4 5 6 7 9];
N = size(x,1);

s1 = sin(pi/16);        c1 = cos(pi/16);
s2 = sin(2*pi/16);      c2 = cos(2*pi/16);
s3 = sin(3*pi/16);      c3 = cos(3*pi/16);

a1 = x(1) + x(8);       a5 = x(4) - x(5);
a2 = x(2) + x(7);       a6 = x(3) - x(6);
a3 = x(3) + x(6);       a7 = x(2) - x(7);
a4 = x(4) + x(5);       a8 = x(1) - x(8);

b1 = a1 + a4;           b5 = sqrt(2)*(s1*a5+c1*a8);
b2 = a2 + a6;           b6 = sqrt(2)*(s3*a6+c3*a7);
b3 = -a3 + a7;          b7 = sqrt(2)*(c3*a6-s3*a7);
b4 = a1 - a4;           b8 = sqrt(2)*(-c1*a5+s1*a8);

e1 = b1+b2;                     e5 = b5+b6;
e2 = b1-b2;                     e6 = b5-b6;
e3 = sqrt(2)*(s2*b3+c2*b4);     e7 = b7+b8;
e4 = sqrt(2)*(-c2*b3+s2*b4);    e8 = b7-b8;

f6 = sqrt(2)/2*(e6+e8);         f8 = sqrt(2)/2*(e6-e8);

y = [e1 e5 e3 e7 e2 f6 f8 e4]
