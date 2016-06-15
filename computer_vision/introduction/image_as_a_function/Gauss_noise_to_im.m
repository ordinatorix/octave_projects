close all; clc; clear all;
# Applying noise to an image 
im = imread('images/bw_lion.jpg');
figure (1);
imshow(im);
disp(size(im));

#adding noise to the image
sigma = 32;
noise = randn(size(im)).*sigma;
figure (2);
noisy_im = im + noise;
imshow(noisy_im);
# Note: we are still using uint8; therefore in a normal deviation, 
# we only get half of the values. By increasing sigma, 
# we can effectively increase the spread of the curve.
