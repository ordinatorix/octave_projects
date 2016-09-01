function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser();
    %p = p.addOptional('numpeaks', 1, @isnumeric);
    p.addOptional('numpeaks', 1, @isnumeric);
    %p = p.addParamValue('Threshold', 0.5 * max(H(:)));
    p.addParamValue('Threshold', 0.5 * max(H(:)));
    %p = p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    %p = p.parse(varargin{:});
    p.parse(varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    theta = [];
    rho = [];

    [rVal rLoc] = max(H);
    for i = 1:size(rVal,2)
        if size(theta,2) >= numpeaks 
          break;
        end
        if rVal(i) > threshold
            theta(end + 1) = i;
            rho(end + 1) = rLoc(i);
        end
    end   
   
  peaks(:,1)=rho; 
  peaks(:,2)=theta;
        
endfunction
