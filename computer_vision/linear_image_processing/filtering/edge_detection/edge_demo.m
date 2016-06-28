# Edge Demo
clc; clear all; close all;

# Load image package
#pkg load image;

# Read & show Lena image
lena = imread('../images/lena.jpg');
figure, imshow(lena), title('original Lena image, BW');

# Make a blured/smoothed version of the picture
h = fspecial('gaussian', [11 11], 4); 
figure; surf(h);
lenaSmooth = imfilter(lena, h);
figure, imshow(lenaSmooth), title('filtered lena;')

# Method 1: shift left and right, and show diff image
lenaL = lenaSmooth;
lenaL(:, [1:(end - 1)]) = lenaL(:, [2:end]); #to shift to left, copy all pixels from 2nd col onward to the end to positions 1 col to end-1
lenaR = lenaSmooth;
lenaR(:, [2:(end)]) = lenaR(:, [1:(end - 1)]);
lenaDiff = double(lenaR) - double(lenaL);
figure, imshow(lenaDiff, []), title('Difference between right and left shifted images');

# Method 2: Canny edge detector
cannyEdges = edge(lena, 'canny');
figure, imshow(cannyEdges), title(' Original edges with Canny detection');

cannyEdges = edge(lenaSmooth, 'canny');
figure, imshow(cannyEdges), title('Edges of smoothed image');

# Method 3: Laplacian of Gaussian
logEdges = edge(lena, 'log');
figure, imshow(logEdges); title('Laplacian of Gaussian');

# Lookup Edge for more

