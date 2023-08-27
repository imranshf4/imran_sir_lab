%Write a MATLAB/Python program to read ‘rice.tif’ image, count number of rice and 
%display area (also specific range), major axis length, and perimeter.
% Load the 'rice.tif' image
clc;
clear all;
close all;
riceImage = imread('ayTdk.jpg');

% Convert the image to binary using a threshold
threshold = graythresh(riceImage);
binaryImage = imbinarize(riceImage, threshold);

% Perform morphological operations to clean up the binary image (remove noise)
binaryImage = imopen(binaryImage, strel('disk', 2));
binaryImage = bwareaopen(binaryImage, 100);

% Label connected components (rice grains)
[labels, numRice] = bwlabel(binaryImage);

% Initialize measurement variables
areas = zeros(1, numRice);
majorAxisLengths = zeros(1, numRice);
perimeters = zeros(1, numRice);

% Calculate measurements for each rice grain
for i = 1:numRice
    riceRegion = (labels == i);
    
    % Calculate properties of the rice grain
    riceStats = regionprops(riceRegion, 'Area', 'MajorAxisLength', 'Perimeter');
    
    % Store the measurements in arrays
    areas(i) = riceStats.Area;
    majorAxisLengths(i) = riceStats.MajorAxisLength;
    perimeters(i) = riceStats.Perimeter;
end

% Display the results
fprintf('Number of rice grains: %d\n', numRice);
fprintf('Rice grain measurements:\n');
fprintf('Grain #\tArea\tMajor Axis Length\tPerimeter\n');
for i = 1:numRice
    fprintf('%d\t%.2f\t\t%.2f\t\t%.2f\n', i, areas(i), majorAxisLengths(i), perimeters(i));
end

% Display the image with rice grains highlighted
RGB = label2rgb(labels);
imshow(RGB);
title('Rice Grains');
