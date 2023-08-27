c=imread('cameraman.tif');
figure,imshow(c);
cd=double(c);
cd1=cd>128;
figure,subplot(5,2,1),imshow(cd1);

c0=mod(cd,2);
c1=mod(floor(cd/2),2);
c2=mod(floor(cd/4),2);
c3=mod(floor(cd/8),2);
c4=mod(floor(cd/16),2);
c5=mod(floor(cd/32),2);
c6=mod(floor(cd/64),2);
c7=mod(floor(cd/128),2);
subplot(5,2,2),imshow(c0);
subplot(5,2,3),imshow(c1);
subplot(5,2,4),imshow(c2);
subplot(5,2,5),imshow(c3);
subplot(5,2,6),imshow(c4);
subplot(5,2,7),imshow(c5);
subplot(5,2,8),imshow(c6);
subplot(5,2,9),imshow(c7);
xlabel('bitplanes');