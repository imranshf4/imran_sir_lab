
%Write a MATLAB/Python program to read coins.png, leveling all coins and display area 
%of all coins.
% Read the image
clc;
close all;
clear all;

image = imread('1.png');

% Apply Otsu's thresholding to segment the coins
threshold = graythresh(image);
binaryImage = imbinarize(image, threshold);

% Label connected components
labeledImage = bwlabel(binaryImage);

% Measure properties of coins
properties = regionprops(labeledImage, 'Area');

% Display results
fprintf('Total number of coins: %d\n', numel(properties));
for i = 1:numel(properties)
    fprintf('Coin %d:\n', i);
    fprintf('   Area: %.2f pixels\n', properties(i).Area);
end

% Display the labeled image
imshow(label2rgb(labeledImage));
title('Segmented Coins');