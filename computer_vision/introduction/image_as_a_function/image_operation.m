clear all; clc; close all;
# Add two images
lion = imread('images/bw_lion.jpg');
eye  = imread('images/bw_eye.jpg');

figure (1);
imshow(lion);
disp("Lion image size:");
disp(size(lion));

figure (2);
imshow(eye);
disp("Eye image size:");
disp(size(eye));

figure (3);
c_lion = lion(1:211, 1:350);
imshow(c_lion);
disp("c_lion images size");
disp(size(c_lion));
#{
figure (4);
summed = eye+c_lion;
imshow(summed);

figure(5);
average = eye / 2 + c_lion / 2;
imshow(average);

#----------------------------------
# Multiply by a scalar
result = 1.5*lion;
imshow(result);

# Multiply by a scalar: Function
function result = scale(img, value)
    result = value .* img;
endfunction

figure (6);
imshow(scale(lion, 1.5));

#}

#-------------------------------
# Blend two images:
result = 0.75*c_lion + 0.25*eye; #make sure ration summs to 1
imshow(result);

# Using a function
function output = blend(a, b, alpha)
    output = a.*alpha + b.*(1-alpha);
endfunction
result = blend(c_lion, eye, 0.75);
imshow(result);

#image difference
#absolute difference
figure (4);
abs_diff = abs(eye-c_lion);
imshow(abs_diff); #result is incorrect because uint cannot store negative values [0,255]

# Using Image Packages
figure (5);
pkg load image;
abs_diff2 = imabsdiff(eye, c_lion); # Order does not matter
imshow(abs_diff2);