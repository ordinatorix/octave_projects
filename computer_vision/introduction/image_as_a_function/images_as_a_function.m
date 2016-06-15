clc; clear all; close all;

# load and display image
#img = imread('images/bw_eye.jpg');
img = imread('images/color_birds.jpg');
imshow(img);

# Image size:
disp(size(img));

# Image class or data type
disp(class(img));

# At a given location (row,col):
disp(img(50, 100));

# From an entire row:
#disp(img(50, :));
figure (2);
plot(img(50, :));

# Crop an image:
cropped = img(110:210, 10:160);
imshow(cropped);

figure (3);
im_red = img(:, :, 1);
imshow(im_red);
figure (4);
plot(im_red(200, :));