%Line detection for image segmentation.
%Write a MATLAB/Python program to identify horizontal, vertical lines from an image. 
clear;
clc;
%i1=input('Enter image name with location (line1.jpg) :');
getim=imread('LINE1.JPG');
GI=rgb2gray(getim);
subplot(1,2,1),imshow(GI),title('Input image');

S1=GI;
S2=GI;
S3=GI;
S4=GI;
%Mask For Horizontal  line
M1=[-1 -1 -1;2 2 2;-1 -1  -1];
%Mask For +45 degree  line
M2=[-1 -1 2;-1 2 -1;2 -1  -1];
%Mask For Vartical  line
M3=[-1 2 -1;-1 2 -1;-1 2  -1];
%Mask For -45 degree  line
M4=[2 -1 -1;-1 2 -1;-1 -1  2];

%For output image
OutI=GI;
OutI(:,:)=0;

%Get size of Extented matrix
l=1;
GIext = wextend(2,'zpd',GI,l);
Emat=size(GIext);
Max_r=Emat(1);
Max_c=Emat(2);

%========== Detect Horinzontal Line ============
for i=1:1:Max_r-2
    for j=1:1:Max_c-2
        x=GIext(i:i+2,j:j+2); %Get submatrix
        r=M1.*double(x);
        R=sum(sum(r));
        S1(i,j)=uint8(R);        %Store the R values
   end
end   

%========== Detect +45 Degree Line ============%
OutI(:,:)=0;
for i=1:1:Max_r-2
    for j=1:1:Max_c-2
        x=GIext(i:i+2,j:j+2); %Get submatrix
        r=M2.*double(x);
        R=sum(sum(r));
        S2(i,j)=uint8(R);        %Store the R values
   end
end   

%========== Detect Vartical Line ============%
OutI(:,:)=0;
for i=1:1:Max_r-2
    for j=1:1:Max_c-2
        x=GIext(i:i+2,j:j+2); %Get submatrix
        r=M3.*double(x);
        R=sum(sum(r));
        S3(i,j)=uint8(R);        %Store the R values
   end
end   

%========== Detect -45 Degree Line ============%
for i=1:1:Max_r-2
    for j=1:1:Max_c-2
        x=GIext(i:i+2,j:j+2); %Get submatrix
        r=M4.*double(x);
        R=sum(sum(r));
        S4(i,j)=uint8(R);        %Store the R values
   end
end   

for i=1:1:Max_r-2
    for j=1:1:Max_c-2
        OutI(i,j)=max(max(S1(i,j),S2(i,j)),max(S3(i,j),S4(i,j)));
    end
end   

K=find(OutI>=250);
OutI(:)=0;
OutI(K)=255;
subplot(1,2,2),imshow(OutI),title('Output image.');