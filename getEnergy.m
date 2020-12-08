function Energy = getEnergy(currNode, nextNode, MagImage, Image, alpha)
    [height,width] = size(Image);

    % Get coordinates as uint8
    currX = uint16(currNode(1));
    currY = uint16(currNode(2));
    
    nextX = uint16(nextNode(1));
    nextY = uint16(nextNode(2));
    
    Eint = 0;
    % Assuming beta = 0, so ignoring that term.
    if isBound(height,width, nextX, nextY) && isBound(height,width, currX, currY)
        Eint = 0.5* alpha * ( ( abs(Image(nextX, nextY) - Image(currX, currY) ).^2) );
    end
    
    %ex1 = Vertical(nextX, nextY) - Horizontal(nextX, nextY);
    %ex2 = Vertical(currX, currY) - Horizontal(currX, currY);
    if isBound(height,width, currX, currY)
        Eext = -1*(abs(MagImage(currX, currY)^2));
    end
    %Eext = Eext + ( -1*(abs(MagImage(nextX, nextY)^2)));
    
    Energy = Eint; %+ Eext; % Energy is sum of internal and external energy
    
end