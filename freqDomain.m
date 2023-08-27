% Load the input image
input_image = imread('Untitled2.jpeg');
input_image = rgb2gray(input_image);

% Display the original image
subplot(2, 3, 1);
imshow(input_image);
title('Original Image');

% Perform Fourier Transform
fft_image = fftshift(fft2(double(input_image)));

% Create Gaussian filter for smoothing
[M, N] = size(input_image);
sigma = 30;
gaussian_filter = fspecial('gaussian', [M, N], sigma);

% Apply Gaussian smoothing in frequency domain
smoothed_fft = fft_image .* fft2(gaussian_filter);

% Perform inverse Fourier Transform to get the smoothed image
smoothed_image = abs(ifft2(ifftshift(smoothed_fft)));

% Display the smoothed image
subplot(2, 3, 2);
imshow(uint8(smoothed_image));
title('Smoothed Image');

% Create Laplacian filter for sharpening
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];

% Apply Laplacian sharpening in frequency domain
sharpened_fft = fft_image .* fft2(laplacian_filter, M, N);

% Perform inverse Fourier Transform to get the sharpened image
sharpened_image = abs(ifft2(ifftshift(sharpened_fft)));

% Display the sharpened image
subplot(2, 3, 3);
imshow(uint8(sharpened_image));
title('Sharpened Image');

% Create high-pass filter for edge enhancement
high_pass_filter = zeros(M, N);
cutoff_frequency = 0.1;
center = [M / 2, N / 2];
for i = 1:M
    for j = 1:N
        distance = sqrt((i - center(1))^2 + (j - center(2))^2);
        high_pass_filter(i, j) = 1 - exp(-(distance^2) / (2 * (cutoff_frequency * max(M, N))^2));
    end
end

% Apply high-pass edge enhancement in frequency domain
enhanced_fft = fft_image .* fft2(high_pass_filter);

% Perform inverse Fourier Transform to get the enhanced image
enhanced_image = abs(ifft2(ifftshift(enhanced_fft)));

% Display the enhanced image
subplot(2, 3, 4);
imshow(uint8(enhanced_image));
title('Enhanced Image');

% Display frequency domain representation of the original image
subplot(2, 3, 5);
imshow(log(1 + abs(fftshift(fft_image))), []);
title('Frequency Domain');

% Display frequency domain representation of the filtered image
subplot(2, 3, 6);
imshow(log(1 + abs(fftshift(smoothed_fft))), []);
title('Frequency Domain (Smoothed)');

% Adjust subplot layout
sgtitle('Image Enhancement, Smoothing, and Sharpening in Frequency Domain');