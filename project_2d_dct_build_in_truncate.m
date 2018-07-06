clc;
clear;

RGB1 = imread('C:\Users\alice\Desktop\Master Project\70374.jpg');
RGB2 = imread('C:\Users\alice\Desktop\Master Project\70373.jpg');
RGB3 = imread('C:\Users\alice\Desktop\Master Project\70372.jpg');

I1 = rgb2gray(RGB1);
I2 = rgb2gray(RGB2);
I3 = rgb2gray(RGB3);
J1 = imresize(I1,[256 256]);
J2 = imresize(I2,[256 256]);
J3 = imresize(I3,[256 256]);
% figure
% subplot(1,3,1), imshow(J1), title('GRAY1');
% subplot(1,3,2), imshow(J2), title('GRAY2');
% subplot(1,3,3), imshow(J3), title('GRAY3');
K1 = double(J1);
K2 = double(J2);
K3 = double(J3);

a1 = corr2(K1,K2)      %correlation of same person
a2 = corr2(K1,K3)      %correlation of different people

for i = 1:32
    for j = 1:32
        L1(i*8-7:i*8,j*8-7:j*8) = dct2(K1(i*8-7:i*8,j*8-7:j*8));
        L2(i*8-7:i*8,j*8-7:j*8) = dct2(K2(i*8-7:i*8,j*8-7:j*8));
        L3(i*8-7:i*8,j*8-7:j*8) = dct2(K3(i*8-7:i*8,j*8-7:j*8));
    end
end

b1 = corr2(L1,L2)
b2 = corr2(L1,L3)

for i = 1:32
    for j = 1:32
        M1(i*4-3:i*4,j*4-3:j*4) = L1(i*8-7:i*8-4,j*8-7:j*8-4);
        M2(i*4-3:i*4,j*4-3:j*4) = L2(i*8-7:i*8-4,j*8-7:j*8-4);
        M3(i*4-3:i*4,j*4-3:j*4) = L3(i*8-7:i*8-4,j*8-7:j*8-4);
    end
end

c1 = corr2(M1,M2)
c2 = corr2(M1,M3)

for i = 1:32
    for j = 1:32
        N1(i*2-1:i*2,j*2-1:j*2) = L1(i*8-7:i*8-6,j*8-7:j*8-6);
        N2(i*2-1:i*2,j*2-1:j*2) = L2(i*8-7:i*8-6,j*8-7:j*8-6);
        N3(i*2-1:i*2,j*2-1:j*2) = L3(i*8-7:i*8-6,j*8-7:j*8-6);
    end
end

d1 = corr2(N1,N2)
d2 = corr2(N1,N3)

for i = 1:32
    for j = 1:32
        O1(i,j) = L1(i*8-7,j*8-7);
        O2(i,j) = L2(i*8-7,j*8-7);
        O3(i,j) = L3(i*8-7,j*8-7);
    end
end

e1 = corr2(O1,O2)
e2 = corr2(O1,O3)

figure
subplot(5,3,1), imshow(log(abs(K1)),[]), title('RGB1 original');
subplot(5,3,2), imshow(log(abs(K2)),[]), title('RGB1 original');
subplot(5,3,3), imshow(log(abs(K3)),[]), title('RGB1 original');
subplot(5,3,4), imshow(log(abs(L1)),[]), title('RGB1 original');
subplot(5,3,5), imshow(log(abs(L2)),[]), title('RGB1 original');
subplot(5,3,6), imshow(log(abs(L3)),[]), title('RGB1 original');
subplot(5,3,7), imshow(log(abs(M1)),[]), title('RGB1 original');
subplot(5,3,8), imshow(log(abs(M2)),[]), title('RGB1 original');
subplot(5,3,9), imshow(log(abs(M3)),[]), title('RGB1 original');
subplot(5,3,10), imshow(log(abs(N1)),[]), title('RGB1 original');
subplot(5,3,11), imshow(log(abs(N2)),[]), title('RGB1 original');
subplot(5,3,12), imshow(log(abs(N3)),[]), title('RGB1 original');
subplot(5,3,13), imshow(log(abs(O1)),[]), title('RGB1 original');
subplot(5,3,14), imshow(log(abs(O2)),[]), title('RGB1 original');
subplot(5,3,15), imshow(log(abs(O3)),[]), title('RGB1 original');
%subplot(2,3,2), imshow(log(abs(L3)),[]), title('RGB2 8x8dct');
%subplot(2,3,3), imshow(log(abs(M3)),[]), title('RGB3 leave 1/4');
%subplot(2,3,4), imshow(log(abs(N3)),[]), title('RGB4 leave 1/16');
%subplot(2,3,5), imshow(log(abs(O3)),[]), title('RGB5 leave 1/64');