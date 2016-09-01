% ps1
clc; clear; close all; clc;
pkg load image;  % Octave only

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale

%% TODO: Compute edge image img_edges
figure, imshow(img), title('original');
img_edges = edge(img, 'canny');
figure, imshow(img_edges, [0.0 1.0]), title('edges');
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m

%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
figure;
pcolor(theta, rho, H);
shading flat;
title('Hough Transform');
xlabel('theta(degrees)');
ylabel('rho(pixels)');
colormap();
print -dpng output/ps1-2-a-1.png

%% 2-b

peaks = hough_peaks(H, 10);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
%figure;
%imshow(H,[],'XData',theta,'YData',rho);
title('Hough Transform with peaks locations'), xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'o','color','g');
print -dpng output/ps1-2-b-1.png 
%% TODO: Rest of your code hers
