function [Gderiv, w] = GaussianDerivativeKernel(Sigma)
    a = round(2.5 * Sigma - 0.5); % get half width
    w = 2*a+1; % Get width
    Gderiv = zeros(1,w);
    sum = 0;
    for i=1:w
        Gderiv(i) = -1*(i-1-a)*exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
        sum = sum-i*Gderiv(i);
    end
    Gderiv = Gderiv/sum;
end