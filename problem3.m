
%Question3-Write a MATLAB/Python program to read an image and perform convolution with 3X3 
%mask.
clc;
close all;
clear all;
% Read the image
image = imread('4.jpeg'); % Change to your image filename

% Convert the image to double for convolution
image = double(image);

% Define the 3x3 mask (kernel)
mask = [1, 2, 1;
        0, 0, 0;
       -1, -2, -1];

% Separate the RGB channels
redChannel = image(:,:,1);
greenChannel = image(:,:,2);
blueChannel = image(:,:,3);

% Perform convolution on each channel
convolvedRed = conv2(redChannel, mask, 'same');
convolvedGreen = conv2(greenChannel, mask, 'same');
convolvedBlue = conv2(blueChannel, mask, 'same');

% Combine the convolved channels back into an RGB image
convolvedImage = cat(3, convolvedRed, convolvedGreen, convolvedBlue);

% Display the original and convolved images
subplot(1, 2, 1);
imshow(uint8(image));
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(convolvedImage));
title('Convolved Image');