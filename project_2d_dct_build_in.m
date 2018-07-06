clc;
clear;
A1 = imread('C:\Users\alice\Desktop\0.jpg');
A2 = imread('C:\Users\alice\Desktop\1.jpg');
A3 = imread('C:\Users\alice\Desktop\2.jpg');
B1 = imresize(A1,[256 256]);
B2 = imresize(A2,[256 256]);
B3 = imresize(A3,[256 256]);
figure
subplot(1,3,1), imshow(B1), title('COLOR1');
subplot(1,3,2), imshow(B2), title('COLOR2');
subplot(1,3,3), imshow(B3), title('COLOR3');
C1 = rgb2gray(B1);
C2 = rgb2gray(B2);
C3 = rgb2gray(B3);
figure
subplot(1,3,1), imshow(C1), title('GRAY1');
subplot(1,3,2), imshow(C2), title('GRAY2');
subplot(1,3,3), imshow(C3), title('GRAY3');
D1 = dct2(C1);
D2 = dct2(C2);
D3 = dct2(C3);
E1 = corr2(D1,D2);
E2 = corr2(D1,D3);
E3 = corr2(D2,D3);