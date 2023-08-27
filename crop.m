close all;
clear all;
a=imread('cameraman.tif');
x=input('Enter value of Row:')
y=input('Enter value of Column:')
c=size(a)
for i = x:1:c(1)-x
for j = y:1:c(2)-y
b(i+1-x,j+1-y)=a(i,j);
end
end
figure()
imshow(a)
figure()
imshow(b)
size(b)