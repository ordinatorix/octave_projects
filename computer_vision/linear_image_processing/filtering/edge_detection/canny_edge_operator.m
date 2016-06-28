# Canny edge
# Linking and thresholding(hysterisis):
#   - Define two thresholds: low and high
#   - Use the high threshold to start edge curves and the low threshold to continue them
# Used to thin out the edges of a picture or for edge detection
clc; clear all; close all;

pkg load image;

lena = double(imread('../images/lena.jpg')) / 255.;
figure; imshow(lena); title('Original Image, BW');

# Using gradient  magnitude detection.
[gx gy] = imgradientxy(lena, 'sobel');
[gmag gdir] = imgradient(gx, gy);
edge_mag = gmag / (4 * sqrt(2));
figure; imshow(edge_mag); title('edge detection via magnitude'); # gmag = sqrt(gx^2 + gy^2), so: [0, (4*sqrt(2))]

# Using Canny edge opereator
lena_edge = edge(lena, 'canny');
figure; imshow(lena_edge); title('Canny edge detection');

#Using the default edge operator(sobel):
lena_edge_def = edge(lena);
figure; imshow(lena_edge_def); title('default(sobel) edge detection');

#showing common edges:
figure; imshow(lena_edge & edge_mag); title('common edges');