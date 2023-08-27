
%question1- Display following image operation in MATLAB/Python - i) Histogram image
%ii) Low pass filter mage iii) High pass image.

%---------------Histogram--------------------
clc;
clear all;
close all;
im=imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\Histogram\fruit-2999796.jpg');
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


%low pass
%   Low pass filter for image filtering.
figure(2)
%i1=input('Enter image name with location (rgb.jpg) :');
getim=imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\Histogram\fruit-2999796.jpg');
inim=rgb2gray(getim);
subplot(2,1,1),imshow(inim),title('Input image');

exim=wextend(2,'zpd',inim,1);
mask=[1 1 1 ; 1 1 1 ; 1 1 1];   %mask=ones(3);
[r,c]=size(exim);

for i=1:1:r-2,
   for j=1:1:c-2,
      subim=exim(i:i+2,j:j+2);
      ele_multi=mask.*double(subim);
      col_sum=sum(ele_multi);
      row_sum=col_sum(1,1)+col_sum(1,2)+col_sum(1,3);
      ave=row_sum/9;
      outim(i,j)=ave;
   end
end

lpassim=uint8(outim);
subplot(2,1,2),imshow(lpassim),title('Low pass filtered image');



%   High pass filter for image filtering.
figure(3)

%i1=input('Enter image name with location (rgb.jpg) :');
inim=imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\Histogram\fruit-2999796.jpg');

Inim=rgb2gray(inim);
subplot(2,1,1),imshow(Inim),title('Input image');

exim=wextend(2,'zpd',Inim,1);
mask=[-1 -1 -1; -1 8 -1;-1 -1 -1];
[r,c]=size(exim);

for i=1:1:r-2,

   for j=1:1:c-2,
      N1=exim(i:i+2,j:j+2);
      ele_multi=mask.*double(N1);
      col_sum=sum(ele_multi);
      row_sum=col_sum(1,1)+col_sum(1,2)+col_sum(1,3);
      ave=row_sum/9;
      outim(i,j)=ave;
   end
end

hpassim=uint8(outim);
subplot(2,1,2),imshow(hpassim),title('High pass filtered image');      