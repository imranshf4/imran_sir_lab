%question2-Write a MATLAB/Python program to read ‘rice.tif’ image, count number of rice and 
%display area (also specific range), major axis length, and perimeter

clc;
clear all;
close all;
% Read the image
image = imread('ayTdk.jpg');

% Convert the image to binary using thresholding
threshold = graythresh(image);
binaryImage = imbinarize(image, threshold);

% Label connected components
labeledImage = bwlabel(binaryImage);

% Measure properties of rice grains
properties = regionprops(labeledImage, 'Area', 'MajorAxisLength', 'Perimeter');

% Filter rice grains based on specific area range
minArea = 100;
maxArea = 1500;
filteredProperties = properties([properties.Area] >= minArea & [properties.Area] <= maxArea);

% Display results
fprintf('Total number of rice grains: %d\n', numel(filteredProperties));
for i = 1:numel(filteredProperties)
    fprintf('Rice grain %d:\n', i);
    fprintf('   Area: %.2f pixels\n', filteredProperties(i).Area);
    fprintf('   Major Axis Length: %.2f pixels\n', filteredProperties(i).MajorAxisLength);
    fprintf('   Perimeter: %.2f pixels\n', filteredProperties(i).Perimeter);
end

% Display the labeled image
imshow(label2rgb(labeledImage));
title('Labeled Rice Grains');


