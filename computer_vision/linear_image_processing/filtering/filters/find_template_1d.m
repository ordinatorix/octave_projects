# Find template 1D
clc; clear all;

#Using findstr() 
#{
function index = find_template_1D(t, s)
    index = findstr(t, s); 
endfunction

pkg load image;

s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 1 0 0];
disp('Signal:'), disp([1:size(s,2); s]);
disp('Template:'), disp([1:size(t,2); t]);

#index = findstr(t, s); 
index = find_template_1D(t, s);
disp('Index:'), disp(index);
#}

# Using normalized cross corelation
#
function index = find_template_1D(t, s)
    c = normxcorr2(t, s); #try with xcorr2
    disp('Corr_value;'); disp([1:size(c, 2); c]);
    #[maxValue index] = max(c);
    #disp('max'); disp(max(c));
    [maxValue rawIndex] = max(c);
    index = rawIndex - size(t, 2) + 1;
endfunction     


pkg load image;

s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [-1 -1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

disp('size:'); disp(size(s));
index = find_template_1D(t, s);
disp('Index:'), disp(index);
#}