
input=imread('meo.bmp');

i=rgb2gray(input);
i = imresize(i, [512 512]);
imwrite(i,'mmm.bmp');