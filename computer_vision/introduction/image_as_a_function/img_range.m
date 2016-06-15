# Image range
#The sigma effect will depend on the image range.
#For a range [0; 1] a sigma of 2 will generate lots of noise.
#If using a range [0; 255] use floating point => [0.0; 255.0]
#using image processing toolbox

clc; clear all; close all;
im = imread('images/bw_lion.jpg');
pkg load image;
#imshow(im,[LOW HIGH]); anything with the value low or lower is displayed as black and high or higher as white
imshow(im,[0 1]); 
figure(2);
imshow(im, []); #auto scale => minimun is black, maximum is white;
figure(3);
imshow(im);
# Normalize only to display, not to compute