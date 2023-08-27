clc;
clear all;
close all;
a=imread('1b.jpg');
[r,c]=size(a);
ah=uint8(zeros(r,c));
n=r*c;
f=zeros(1,256);
pdf=zeros(1,256);
cdf=zeros(1,256);
cum=zeros(1,256);
out=zeros(1,256);
for i=1:r
    for j=1:c
        value=a(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end
sum=0;
L=255;

for i=1:size(pdf)
    sum=sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*L);
end
for i=1:r
     for j=1:c
         ah(i,j)=out(a(i,j)+1);
     end
end
imshow(ah)
        
        
        
        
        
        
        