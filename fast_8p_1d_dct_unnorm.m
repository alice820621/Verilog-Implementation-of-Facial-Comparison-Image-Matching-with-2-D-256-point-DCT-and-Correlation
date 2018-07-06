function y=fdct(x0);
% implementation of fast DCT algorithm by Feig and Winograd
% IEEE Trans. SP, vol. 40, No. 9, pp. 2174-93, 1992.
% (c) 1998 copyright by Yu Hen Hu
%
% Note that the array index is changed from 0:7 to 1:8

x(1,1) = x0(1) + x0(8);         x(5,1) = x0(1) - x0(8);
x(2,1) = x0(2) + x0(7);         x(6,1) = x0(2) - x0(7);
x(3,1) = x0(3) + x0(6);         x(7,1) = x0(3) - x0(6);
x(4,1) = x0(4) + x0(5);         x(8,1) = x0(4) - x0(5);

x(1,2) = x(1,1) + x(4,1);       x(5,2) = x(5,1);
x(2,2) = x(2,1) + x(3,1);       x(6,2) = x(6,1);
x(3,2) = x(1,1) - x(4,1);       x(7,2) = x(7,1);
x(4,2) = x(2,1) - x(3,1);       x(8,2) = x(8,1);

x(1,3) = x(1,2) + x(2,2);       x(5,3) = -x(7,2);
x(2,3) = x(1,2) - x(2,2);       x(6,3) = x(8,2);
x(3,3) = x(4,2);                x(7,3) = -x(6,2);
x(4,3) = x(3,2);                x(8,3) = -x(5,2);

y(1) = 2*sqrt(2)*cos(pi/4)*x(1,3);
y(5) = 2*cos(pi/4)*x(2,3);

tmp0= cos(pi/4)*(-x(3,3)+x(4,3));
y(3) = (1/cos(3*pi/8))*(x(3,3) + tmp0);
y(7) = (1/cos(pi/8))*(-x(3,3) + tmp0);

tmp(4) = x(5,3);
tmp(5) = x(6,3) + x(8,3);
tmp(6) = x(5,3) - x(8,3);
tmp(7) = x(6,3) - x(7,3);

tmp1(4,1) = tmp(4);
tmp1(5,1) = cos(pi/4)*tmp(5);
tmp0 = cos(pi/4)*(-tmp(6) + tmp(7));
tmp1(6,1) = (1/2)*(1/cos(3*pi/8))*(tmp(6) + tmp0);
tmp1(7,1) = (1/2)*(1/cos(pi/8))*(-tmp(6) + tmp0);

y(2) = -(1/cos(5*pi/16))*(tmp1(4,1)+tmp1(5,1)-tmp1(6,1));
y(4) = -(1/cos(pi/16))*(-tmp1(4,1)+tmp1(5,1)+tmp1(7,1));
y(8) = (1/cos(3*pi/16))*(-tmp1(4,1)-tmp1(5,1)-tmp1(6,1));
y(6) = -(1/cos(7*pi/16))*(tmp1(4,1)-tmp1(5,1)+tmp1(7,1));