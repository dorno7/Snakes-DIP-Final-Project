% Performs convolution on image with a kernel that's passed in
% Created using pseudocode from lecture as a guide
function convImage = Convolve(Image, kernel)
    [height,width] = size(Image);
    [ker_h, ker_w] = size(kernel);
    convImage = zeros(height,width);
    for i=1:height
        for j=1:width
            sum = 0;
            for k=1:ker_h
                for m=1:ker_w
                    offseti = -1*floor(ker_h/2)+k-1;
                    offsetj = -1*floor(ker_w/2)+m-1;
                    if isBound(i+offseti, j+offsetj, height, width) == true
                        sum = sum + Image(i+offseti, j+offsetj)*kernel(k,m);
                    end
                end
            end
            convImage(i,j) = sum;
        end
    end
    
end

function bound = isBound(x,y,height, width)
   if(x > 0 && y > 0 && x <= height && y <= width)
       bound = true;
   else
       bound = false;
   end
end