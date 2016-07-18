clear all; clc; close all;
%% Hough Demo

pkg load image

% Load image, convert to grayscale and apply canny operator to find edge pixels
hor_lines = imread('images/horizontal_para_lines.jpg');
%gray_hor_lines = rgb2gray(hor_lines);
hor_lines_edges = edge(hor_lines, 'canny');

% Display pictures:
figure, imshow(hor_lines), title('Original horizontal line image');
%figure, imshow(gray_hor_lines), title('bw Horizontal lines');
figure, imshow(hor_lines_edges), title('horizontal lines edges');

% Apply Hough transform to find candidate lines
%[accum theta rho] = hough(shape_edges); %for matlab 
%figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');

%{
accum = houghtf(shape_edges); % for octave
figure, imagesc(accum), title('Hough accumulator2');
[r, c] = immaximas(accum);
%}
theta = -90:90; % angle in degrees, from -90 to 90
[h, rho] = hough_line(hor_lines_edges);
figure, imagesc(theta, rho, h), title('Hough Transform of horizontal lines');
[row col] = immaximas(h, 2, 10);
%hold on; plot(theta(col(:, 1)),rho(row(:, 1)), 'rs'); hold off;

%{
% Load image, convert to grayscale and apply canny operator to find edge pixels
vert_lines = imread('images/dec_lines.png');
%gray_vert_lines = rgb2gray(vert_lines);
vert_lines_edges = edge(vert_lines, 'canny');

% Display pictures:
figure, imshow(vert_lines), title('Original vertical line image');
%figure, imshow(gray_vert_lines), title('bw vertical lines');
figure, imshow(vert_lines_edges), title('vertical lines edges');

[j, rho1] = hough_line(vert_lines_edges);
figure, imagesc(theta, rho1, j), title('Hough Transform of vertical lines');

% Load image, convert to grayscale and apply canny operator to find edge pixels
obliq_line = imread('images/oblique_line.png');
%gray_vert_lines = rgb2gray(vert_lines);
obliq_line_edges = edge(obliq_line, 'canny');

% Display pictures:
figure, imshow(obliq_line), title('Original oblique line image');
%figure, imshow(gray_vert_lines), title('bw vertical lines');
figure, imshow(obliq_line_edges), title('oblique line edges');

[p, rho2] = hough_line(obliq_line_edges);
figure, imagesc(theta, rho2, p), title('Hough Transform of oblique lines'),ylabel('rho, distance from origine');
%}

%{
hough transform on a circle:
For images, if radius is know, it is relativly easy to find the center. if not, 
one can use the gradient of the circle to help find the center. 
It becomes relatively more difficult to find circles using a 3-d hough space.
A fine voting grid may invite noise, while a coarse foating grid mya vote for wrong parameters.
%}