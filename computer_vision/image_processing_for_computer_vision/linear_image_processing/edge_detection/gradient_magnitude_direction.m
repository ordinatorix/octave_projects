# Gradient direction
clear all; clc; close all;

function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
    # Find and return pixels that fall within the desired mag, angle range
    result = gmag >= mag_min & angle_low <= gdir & gdir <= angle_high;
endfunction

pkg load image;

#Load and convert image to double type, range [0 1] for convenience
img = double(imread('../images/nautical_map.jpg')) / 255.;
figure(1);
imshow(img); #assumes [0 1] range for double imagesc

# Compute x, y gradients
[gx gy] = imgradientxy(img, 'sobel'); # Note: gx, gy are not normalized Note: filter used is Sobel filter
#
figure;
imshow(gx, [-4 4]); #imshow((gx + 4) / 8); or imshow((gx []); based on the actual min and max values of the img. or imagesc(); 
figure;
imshow(gy, [-4 4]); #imshow((gy + 4) / 8);
#

# Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);
figure;
imshow(gmag / (4 * sqrt(2))); # gmag = sqrt(gx^2 + gy^2), so: [0, (4*sqrt(2))]
figure;
imshow((gdir + 180.0) / 360.0); # angle in degrees [-180, 180]


# Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 1, 30, 60); # 45 with a +/- 15 uncertainty
figure;
imshow(my_grad); # Note: enable after 5select_dir is implemented
