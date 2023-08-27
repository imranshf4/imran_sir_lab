% Remove salt and pepper noise from an image.
I = imread('fruit.jpg');
Im = rgb2gray(I);
 
noisy = imnoise(Im, 'salt & pepper',0.1);
output = medfilt2(noisy);
figure(1);
subplot(131),imshow(I),title('Original Image');
subplot(132),imshow(noisy),title('noisy Image');
subplot(133),imshow(output),title('output of median filter');

