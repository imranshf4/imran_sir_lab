%---------------Histogram--------------------
clc;
clear all;
close all;
im=imread('fruit-2999796.jpg');
subplot(2,1,1);
gIm=rgb2gray(im);
imshow(gIm);
sz=size(gIm);
n=sz(1)*sz(2);
for rk=0:2:255
    a=find(gIm==rk);
    sz=size(a);
    nk=sz(1);
    pk(rk+1)=nk/n;
end
subplot(2,1,2);
bar(pk);
axis([0,256,0,0.05]);