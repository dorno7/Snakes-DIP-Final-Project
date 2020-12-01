function [MagImage, GradImage, Vertical, Horizontal] = MagnitudeGradient(Image,Sigma)
    
    % Set-up
    [height,width] = size(Image);
    MagImage = zeros(height, width);
    GradImage = zeros(height,width);
    
    [Gh,w] = GaussianKernal(Sigma); % Horizontal gaussian kernel
    Gv = transpose(Gh); % Vertical Gaussian kernal
    [Gderivh,w] = GaussianDerivativeKernel(Sigma); %horizontal gaussian derivative
    GderivV = transpose(Gderivh); % vertical gaussian derivative.
    
    % Horizontal intensity change
    temp_horizontal = Convolve(Image,Gv);
    Horizontal = Convolve(temp_horizontal,flip(Gderivh));
    
    % Vertical intensity change
    temp_vertical = Convolve(Image, Gh);
    Vertical = Convolve(temp_vertical, flip(GderivV));
    
    % Get magnitude and gradient images
    for i=1:height
        for j=1:width
            MagImage(i,j) = sqrt(Vertical(i,j)*Vertical(i,j) + Horizontal(i,j)*Horizontal(i,j));
            GradImage(i,j) = atan2(Horizontal(i,j),Vertical(i,j)); 
        end
    end
end
