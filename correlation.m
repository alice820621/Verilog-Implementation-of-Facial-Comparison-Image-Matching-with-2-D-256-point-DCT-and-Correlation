clc;
clear;

r1 = 0;
r2 = 0;
r3 = 0;
r4 = 0;
A = [10 20 30; 40 50 60];
B = [10 30 50; 70 90 110];
for i = 1:size(A,1)
    for j = 1:size(A,2)
        r1 = r1 + (A(i,j)-mean2(A))*(B(i,j)-mean2(B));
        r2 = r2 + (A(i,j)-mean2(A))^2;
        r3 = r3 + (B(i,j)-mean2(B))^2;
        r4 = sqrt(r2*r3)
    end
end
r = r1/r4
rr = corr2(A,B)