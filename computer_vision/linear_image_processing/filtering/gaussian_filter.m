clc; clear all; close all;

# Removing noise with a Gaussian filter

# Load an image
figure(1);
img = imread('images/water.jpg');
imshow(img);

# Add some noise
figure(2);
noise_sigma = 65;
noise = randn(size(img)).*noise_sigma;
noisy_img = img + noise;
imshow(noisy_img);

# Create a Gaussian filter
filter_size = 21; #affects the brightness
filter_sigma = 3; # affects the blur
pkg load image;
filter = fspecial('gaussian', filter_size, filter_sigma);

# Apply filter to remove noise
figure(3);
smooth_img = imfilter(noisy_img, filter);
imshow(smooth_img);

# Applying filter at boundary on colored image
figure(4);
#smooth_bc = imfilter(img, filter, 0);
#smooth_bc = imfilter(img, filter, 'circular');
#smooth_bc = imfilter(img, filter, 'replicate');
smooth_bc = imfilter(noisy_img, filter, 'symmetric');
imshow(smooth_bc, [0.0 255.0]);
