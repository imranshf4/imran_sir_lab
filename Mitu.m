%. Perform image enhancement, smoothing and sharpening, in spatial domain using 
%different spatial filters and compare the performances
clc;
clear all;
close all;
% Load the image
inputImage = imread('Untitled2.jpeg');

% Convert the image to grayscale if it's not already
grayImage = rgb2gray(inputImage);

% Display the original image
subplot(2, 3, 1);
imshow(grayImage);
title('Original Image');

% Image enhancement using histogram equalization
enhancedImage = histeq(grayImage);
subplot(2, 3, 2);
imshow(enhancedImage);
title('Enhanced Image (Histogram Equalization)');

% Smoothing using Gaussian filter
gaussianFilter = fspecial('gaussian', [5 5], 1);
smoothedImage = imfilter(grayImage, gaussianFilter, 'replicate');
subplot(2, 3, 3);
imshow(smoothedImage);
title('Smoothed Image (Gaussian Filter)');

% Sharpening using Laplacian filter
laplacianFilter = fspecial('laplacian', 0);
sharpenedImage = imfilter(grayImage, laplacianFilter, 'replicate');
subplot(2, 3, 4);
imshow(sharpenedImage);
title('Sharpened Image (Laplacian Filter)');

% Sharpening using Unsharp Masking
blurredImage = imfilter(grayImage, gaussianFilter, 'replicate');
unsharpMask = grayImage - blurredImage;
sharpenedImage2 = grayImage + unsharpMask;
subplot(2, 3, 5);
imshow(sharpenedImage2);
title('Sharpened Image (Unsharp Masking)');

% Display comparisons
subplot(2, 3, 6);
imshow(grayImage);
hold on;
h = text(size(grayImage, 2) / 2, 10, 'Original Image', 'Color', 'w', 'HorizontalAlignment', 'center');
set(h, 'FontSize', 10);
h = text(size(grayImage, 2) / 2, size(grayImage, 1) - 10, 'Different Image Enhancements', 'Color', 'w', 'HorizontalAlignment', 'center');
set(h, 'FontSize', 10);
hold off;

% Adjust the figure layout
set(gcf, 'Position', get(0, 'Screensize'));