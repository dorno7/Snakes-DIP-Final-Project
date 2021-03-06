function Snaxel = snakesDynamic(Snaxel, Image, MagImage, alpha)

    numSnaxels = numel(Snaxel); % Get number of snaxels, each of which is a coordinate
    energyMtx = zeros(numSnaxels,9); % initialize first column of energy matrix
    nextNode = []; currNode = [];
    neighbors = {[-1 -1] [0 -1] [1 -1] [-1 0] [0 0] [0 1] [1 -1] [0 1] [1 1]}; % contains relative coordinates of neighbors
    
    for i=1:numSnaxels
        for j=1:9 % For all neighbors of next node (pixel)
            minEnergy = inf;
            for k=1:9 % For all neighbors of current node (pixel)
                
                % Need to consider case where i = numSnaxels - UNSURE
                if i == numSnaxels % If it's at last snaxel, loop back around to first snaxel
                    nextNode = Snaxel{1} + neighbors{j}; % contains coordinates of neighbor of next node
                else
                    nextNode = Snaxel{i+1} + neighbors{j}; % contains coordinates of neighbor of next node
                end
                
                currNode = Snaxel{i} + neighbors{k};
                %%% Very important line below
                E = getEnergy(currNode, nextNode, MagImage,  Image, alpha); 
                %%% TODO: Try pre-computing external energy for whole snake
                %%% and then adding to internal energy
                
                if i == 1 % if i=1, can't add previous value from that column, wrap back around - UNSURE
                    energy = energyMtx(numSnaxels,k) + E;
                else
                    energy = energyMtx(i-1,k) + E;
                end
                
                if energy < minEnergy
                    minEnergy = energy;
                    minPosition = k;
                end
            end
            % Store minimum energy in table
            energyMtx(i,j) = minEnergy;
            posMtx(i,j) = minPosition;
        end
    end 
    
    % Search final column for minimum energy - UNSURE
    minFinalEnergy = inf; % set equal to big number
    for m=1:9
        if energyMtx(numSnaxels, m) < minFinalEnergy
            minFinalEnergy = energyMtx(numSnaxels, m);
            minFinalPosition = m;
        end
    end
    pos = minFinalPosition;
    
    % Search backwards through table to find optimum positions
    for i=numSnaxels-1:-1:1
        Snaxel{i} = Snaxel{i} + neighbors{pos};
        if i > 1
            pos = posMtx(i-1,pos);
        else
            pos = posMtx(i,pos);
        end
    end   
end