function [G,w] = GaussianKernal(Sigma)
    a = round(2.5 * Sigma - 0.5); % get half width
    w = 2*a+1;
    G = zeros(1,w);
    sum = 0;
    for i=1:w
        G(i) = exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
        sum = sum+G(i);
    end
    G = G/sum;
end