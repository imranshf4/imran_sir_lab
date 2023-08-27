% High pass filter
clc
I=imread('cameraman.tif');
HighKernel = [ -1 -1 -1; -1 10 -1; -1 -1 -1 ];
Conv_high = conv2(HighKernel, I);
figure,imshow(Conv_high);
% Low pass filter
LowKernel = [ 1 1 1; 1 -10 1; 1 1 1 ];
Conv_low = conv2(LowKernel,I);
figure, imshow(Conv_low);
title('low pass');