%% Testing getting the initial snake
[Filename,FilePath]=uigetfile('*'); % Get file from file browser
Image = imread(strcat(FilePath, Filename));
numcolors = size(Image,3); % get number of colors
if numcolors > 1 % if > 1, then it isn't grayscale
    Image = rgb2gray(Image); % convert to grayscale
end

Snaxel = {};
% Select pixels to make up starting snake %
figure
imshow(Image)
truesize([500 500])
[x,y] = ginput;
[height, width] = size(Image);
% Put coordinates into a cell array
for i=1:length(x)
    Snaxel(i) = {[x(i) y(i)]}; % Cell array containing coordinates
end

% Iterate calculating the new snaxels
[MagImage, GradImage, ~, ~] = MagnitudeGradient(Image,0.6);
for n=1:50
    if n == 1
        firstIter = Snaxel;
    end
    drawSnakewithLines(Snaxel, Image)
    title(['Iteration = ', num2str(n)])
    movegui('center')
    Snaxel = snakesDynamic(Snaxel, Image, MagImage, 0.5); % last param is alpha
    
    if n == 25
        midIter = Snaxel;
    elseif n == 50
        lastIter = Snaxel;
    end
end

% Show first and last images
close all
figure
drawSnakewithLines(firstIter, Image)
title('Starting Image')
movegui('center')

figure
drawSnakewithLines(midIter, Image)
title('Mid Image')
movegui('center')

figure
drawSnakewithLines(lastIter, Image)
title('Final Image')
movegui('center')









