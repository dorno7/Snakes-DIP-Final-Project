function drawSnakewithLines(Snaxel, Image)
    snakeImage = repmat(Image, [1 1 3]);
    [height,width] = size(Image);
    for i=1:height
        for j=1:width
            for k = 1:numel(Snaxel)
                if i == Snaxel{k}(2) && j == Snaxel{k}(1)
                    snakeImage(i,j,:) = [255 0 0];
                end
            end
        end
    end
    imshow(snakeImage)
    for i = 1:numel(Snaxel)
        if i > 1
            p1 = [Snaxel{i}(1), Snaxel{i-1}(1)];
            p2 = [Snaxel{i}(2), Snaxel{i-1}(2)];
            line(p1, p2, 'Color', 'red')
        end   
    end
    % Connect first and last pixel
    p1 = [Snaxel{end}(1), Snaxel{1}(1)];
    p2 = [Snaxel{end}(2), Snaxel{1}(2)];
    line(p1, p2, 'Color', 'red')
    truesize([500 500])
end