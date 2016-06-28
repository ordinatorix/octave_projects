clc; clear all; close all;

function [yIndex xIndex] = find_template_2D(template, img)
    #find template in img and return [y x] index location
    c = normxcorr2(template, img);
    #disp('c'); disp(c);
    #figure, surf(c), shading flat
    [ypeak xpeak] = find(c == max(c(:))); # colon is used to flatten (computes image wide maximum)
    yoffSet = ypeak - size(template,1) + 1;
    xoffSet = xpeak - size(template, 2) + 1;
    #[yIndex xIndex] = {yoffSet, xoffSet}{:};
    yIndex = yoffSet;
    xIndex = xoffSet;
endfunction 

pkg load image;

#test code:
figure(1);
tablet = imread('../images/tablet.jpg');
imshow(tablet);
figure(2);
glyph = tablet(80:170, 155:187);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp('[y x] location'); disp([y x]);