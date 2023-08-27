%---------------Histogram  Equilization --------------------
%  subplot(1,2,1)  1 page a 2 pic no 1
clc;
close all;
clear all;
im=imread('image-by-ansel-adams.jpg');
%im=imread('a.bmp');
subplot(3,1,1);
I=rgb2gray(im);
imshow(I);
sz=size(I);
n=sz(1)*sz(2);
for rk=0:255
    a=find(I==rk);
    sz1=size(a);
    nk=sz1(1);
    pk(rk+1)=nk/n;
end

subplot(3,1,2);
bar(pk);
axis([0,256,0,0.04]);

for k=1:256
    s(k)=sum(pk(1:k));
end
for i=1:sz(1)
    for j=1:sz(2)
        I(i,j)=s(double(I(i,j))+1)*256;
    end
end

subplot(3,1,3);
imshow(I);