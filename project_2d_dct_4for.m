clc;
clear;

RGB1 = imread('C:\Users\alice\Desktop\Master Project\70374.jpg');
RGB2 = imread('C:\Users\alice\Desktop\Master Project\70373.jpg');
RGB3 = imread('C:\Users\alice\Desktop\Master Project\70372.jpg');
% figure
% subplot(1,3,1), imshow(RGB1), title('RGB1');
% subplot(1,3,2), imshow(RGB2), title('RGB2');
% subplot(1,3,3), imshow(RGB3), title('RGB3');

F1 = rgb2gray(RGB1);
F2 = imresize(F1,[100 100]); 
A = double(F2);
% I2 = rgb2gray(RGB2);
% I3 = rgb2gray(RGB3);
figure
subplot(1,3,1), imshow(F2), title('GRAY1');
% subplot(1,3,2), imshow(I2), title('GRAY2');
% subplot(1,3,3), imshow(I3), title('GRAY3');
% g1 = corr2(I1,I2);      %correlation of same person
% g2 = corr2(I1,I3);      %correlation of different people

% g3 = normxcorr2(I1,I2);
% figure, surf(g3), shading flat, title('normxcorr2(I1,I2)');
% g4 = normxcorr2(I1,I3);
% figure, surf(g4), shading flat, title('normxcorr2(I1,I3)');

% J1 = dct2(I1);
% J2 = dct2(I2);
% J3 = dct2(I3);
i = 0;
j = 0;
m = 0;
n = 0;
M = size(A,1);
N = size(A,2);
d = zeros(M,N);
for i = 0:size(A,1)-1
    for j = 0:size(A,1)-1
        for m = 0:size(A,1)-1
            for n = 0:size(A,1)-1
                d(i+1,j+1) = d(i+1,j+1) + (A(m+1,n+1)*cos(pi*(2*m+1)*i/(2*M))*(cos(pi*(2*n+1)*j/(2*N))));
            end
        end
    end
end
d(1,1) = (sqrt(1/M))*(sqrt(1/N))*d(1,1);
d(2:size(d),1) = (sqrt(2/M))*(sqrt(1/N))*d(2:size(d),1);
d(1,2:size(d)) = (sqrt(1/M))*(sqrt(2/N))*d(1,2:size(d));
for i = 2:size(d,1)
    for j = 2:size(d,2)
        d(i,j) = (sqrt(2/M))*(sqrt(2/N))*d(i,j);
    end
end
dd = dct2(A);

% figure
% subplot(1,3,1), imshow(log(abs(J1)),[]), colormap(gca,jet(64)), colorbar;
% subplot(1,3,2), imshow(log(abs(J2)),[]), colormap(gca,jet(64)), colorbar;
% subplot(1,3,3), imshow(log(abs(J3)),[]), colormap(gca,jet(64)), colorbar;
% d1 = corr2(J1,J2);
% d2 = corr2(J1,J3);
% 
% S1 = J1(1:250,1:250);
% S2 = J2(1:250,1:250);
% S3 = J3(1:250,1:250);
% m1 = corr2(S1,S2);
% m2 = corr2(S1,S3);



%Set values less than magnitude 10 in the DCT matrix to zero.
% J1(abs(J1) < 100) = 0;
% J2(abs(J2) < 100) = 0;
% figure
% subplot(1,2,1), imshow(log(abs(J1)),[]), colormap(gca,jet(64)), colorbar;
% subplot(1,2,2), imshow(log(abs(J2)),[]), colormap(gca,jet(64)), colorbar;

% K1 = idct2(J1);
% K2 = idct2(J2);
% figure, imshowpair(I1,K1,'montage'), title('Original Grayscale Image (Left) and Processed Image (Right)');
% figure, imshowpair(I2,K2,'montage'), title('Original Grayscale Image (Left) and Processed Image (Right)');
%c1 = corr2(K1,K2);
%c2 = normxcorr2(K1,K2);
%figure, surf(c2), shading flat