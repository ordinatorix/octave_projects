clc; clear all; close all;
# Apply a median filter
# non-linear filter used to filter out salt & pepper noise
pkg load image

# Read an image
figure(1);
img = imread('images/jumper.jpg');
imshow(img);

# Add salt  & pepper noise
figure(2);
noisy_img = imnoise(img,'salt & pepper', 0.3);
imshow(noisy_img);

# Apply median filter
figure(3);
median_filtered = medfilt2(noisy_img);
imshow(median_filtered);
