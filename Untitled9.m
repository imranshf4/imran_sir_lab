
%Display following image operation in MATLAB/Python - i) Threshold image ii) Power 
%enhance contract image iii) High pass image.
clc;
clear all;
close all;
% Load the image
inputImage = imread('suhan.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Thresholding
thresholdValue = 128;
binaryImage = grayImage > thresholdValue;

% Display the thresholded image

imshow(binaryImage);
title('Threshold Image');



% Load the image
figure(2)
%inputImage = imread('apple.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Power-law transformation
gamma = 1.5;
c = 1;
enhancedImage = c * (double(grayImage) .^ gamma);
enhancedImage = uint8(255 * (enhancedImage / 255).^ (1/gamma));

% Display the enhanced contrast image
imshow(enhancedImage);
title('Power Enhanced Contrast Image');

figure(3)
% Load the image
%inputImage = imread('apple.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Create a high-pass filter kernel (Laplacian)
laplacianKernel = [0 -1 0; -1 4 -1; 0 -1 0];

% Apply the high-pass filter using convolution
highPassImage = conv2(double(grayImage), laplacianKernel, 'same');
highPassImage = uint8(highPassImage);

% Display the high-pass image
imshow(highPassImage);
title('High Pass Image');
figure(4);
imshow(grayImage);
title('Original Image');