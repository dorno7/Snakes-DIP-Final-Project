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
[x y] = ginput;
x = uint8(x);
y = uint8(y);
[height, width] = size(Image);
% Put coordinates into a cell array
for i=1:length(x)
    Snaxel(i) = {[x(i) y(i)]}; % Cell array containing coordinates
end
% Iterate calculating the new snaxels
[~, ~, Vertical, Horizontal] = MagnitudeGradient(Image,0.6);
for n=1:3
    drawSnakewithLines(Snaxel, Image)
    title(['Iteration = ', num2str(n)])
    movegui('center')
    pause(0.04)
    Snaxel = snakesDynamic(Snaxel, Vertical, Horizontal, 0.5); % last param is alpha
end







