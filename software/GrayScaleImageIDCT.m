function [ImageOut] = GrayScaleImageIDCT(patch)
    
    QTable = ...
        [[16, 11, 10, 16, 24, 40, 51, 61];
         [12, 12, 14, 19, 26, 58, 60, 55];
         [14, 13, 16, 24, 40, 57, 69, 56];
         [14, 17, 22, 29, 51, 87, 80, 62];
         [18, 22, 37, 56, 68,109,103, 77];
         [24, 35, 55, 64, 81,104,113, 92];
         [49, 64, 78, 87,103,121,120,101];
         [72, 92, 95, 98,112,100,103, 99]];
     
    % Image Tiling
    [Height, Width, Tiles] = size(patch);
    
    TileH = sqrt(Tiles);
    TileW = sqrt(Tiles);
    
    ImageOut = zeros(Height * TileH, Width * TileW);
    
    for h = 0:(TileH - 1)
        for w = 0:(TileW - 1)
            DeQuantPatch = patch(:, :, (h * TileW + w + 1)) .* QTable;
            ImageOut((h * Height + 1) : (h * Height + Height), ...
                     (w * Width  + 1) : (w * Width  + Height)) = ...
                     FIDCT_2D(Height, DeQuantPatch);
        end
    end
end

