function Energy = getEnergy(currNode, nextNode, Vertical, Horizontal, alpha)
    
    % Assuming beta = 0, so ignoring that term.
    Eint = 0.5* alpha * ( ( abs(nextNode - currNode) ).^2);
    
    ex1 = Vertical(nextNode(1), nextNode(2)) - Horizontal(nextNode(1), nextNode(2));
    ex2 = Vertical(currNode(1), currNode(2)) - Horizontal(currNode(1), currNode(2));
    Eext = -1*(abs(ex1 + ex2)^2);
    
    Energy = Eext + Eint; % Energy is sum of internal and external energy
    
end