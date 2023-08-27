
%Write a MATLAB/Python program to read an image and perform Lapliciant filter mask.
clc;
clear all;
close all;

% Read the image
image = imread('apple.jpg'); % Change to your image filename

% Convert the image to grayscale if it's in color
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Define the Laplacian filter mask (kernel)
laplacianMask = [0, 1, 0;
                 1, -4, 1;
                 0, 1, 0];

% Perform convolution using the Laplacian filter mask
filteredImage = conv2(double(grayImage), laplacianMask, 'same');

% Display the original and filtered images
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(filteredImage));
title('Laplacian Filtered Image');

colormap gray;