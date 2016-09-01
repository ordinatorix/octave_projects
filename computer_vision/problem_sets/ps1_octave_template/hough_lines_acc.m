function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    %p = p.addParamValue('RhoResolution', 1);
    p.addParamValue('RhoResolution', 1);
    %p = p.addParamValue('Theta', linspace(-90, 89, 180));
    p.addParamValue('Theta', linspace(-90, 89, 180));
    %p = p.parse(varargin{:});
    p.parse(varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;

    %% TODO: Your code here
    
    %Defining the Hough Space
    [width, height] = size(BW);
    rho_limit = norm([width height]);
    rho = (-rho_limit:rhoStep:rho_limit);
    
   
    num_thetas = numel(theta);
    H = zeros(numel(rho), num_thetas);
   
    % Finding the edge pixels
    [x_indicies, y_indicies] = find(BW);
    
    % Preallocate space for the accuarray
    num_edge_pixels = numel(x_indicies);
    accumulator = zeros(num_edge_pixels, num_thetas);
    
    %preallocate cos & sin calc to increase speed
    cosine = (0:width-1)'*cosd(theta);
    sine = (0:height-1)'*sind(theta);
    
    accumulator((1:num_edge_pixels),:) = cosine(x_indicies,:) + sine(y_indicies,:);
    
    %scan over the theta and bin the rhos
    for i = (1:num_thetas)
        H(:,i) = hist(accumulator(:,i),rho);
    end
    
end    
