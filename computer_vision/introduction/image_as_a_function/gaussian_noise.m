close all; clc; clear all;
# Generate Gaussian Noise
noise = randn([1 10000]); # with parameters, [1 5] is 1 row 5 colums.
#disp(noise);
#[n, x] = hist(noise, [-3 -2 -1 0 1 2 3]);
[n, x] = hist(noise, linspace(-3, 3, 21)); #using linear spacing for a range of -3 to 3 in 7 increments. Use odd numbers to dilpay the zero
disp([x; n]);# prove the normal distribution by displaying the bin center and the data in the bins
plot (x, n);
# other random functions are avaible in octave. rand; randi; randn
# noise = randn(size(im)).*sigma => sigma is used to amplify the noise
