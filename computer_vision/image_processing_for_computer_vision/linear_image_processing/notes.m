clc; close all; clear all;
# Averaging assumption:
# - The true value of a pixel is equal to the value of the pixels nearby.
# - The average value of the noise is zero. Therefore, if each noisy pixel is 
#   independent of the surrounding, then the average value is zero.

# - The kernel has to be big enough. the size of the sigma is what varies the smoothness of the filter