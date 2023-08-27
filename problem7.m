
% For the given image perform edge detection using different operators and compare the 
%results.

% Read the image
image = imread('LINE3.JPG'); % Change to your image filename

% Convert the image to grayscale if it's in color
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Apply edge detection using different operators
sobelEdges = edge(grayImage, 'sobel');
prewittEdges = edge(grayImage, 'prewitt');
robertsEdges = edge(grayImage, 'roberts');
cannyEdges = edge(grayImage, 'canny');

% Display the original image and the edge detection results side by side
subplot(2, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 2, 2);
imshow(sobelEdges);
title('Sobel Edge Detection');

subplot(2, 2, 3);
imshow(prewittEdges);
title('Prewitt Edge Detection');

subplot(2, 2, 4);
imshow(robertsEdges);
title('Roberts Edge Detection');

figure;

subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(cannyEdges);
title('Canny Edge Detection');

colormap gray;