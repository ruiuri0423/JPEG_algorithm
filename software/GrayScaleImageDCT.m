function [DCTOut] = GrayScaleImageDCT(image)
    
    % Image Tiling
    [Height, Width] = size(image);
    
    TileH = Height / 8;
    TileW = Width / 8;
    
    TiledImage = zeros(8, 8, (TileH * TileW));
    
    for h = 0:(TileH - 1)
        for w = 0:(TileW - 1)
            TiledImage(:, :, ((h * TileW) + w + 1)) = image(...
                (8 * h + 1):(8 * h + 7 + 1), (8 * w + 1):(8 * w + 7 + 1));
            TiledImage(:, :, ((h * TileW) + w + 1)) = ...
                TiledImage(:, :, ((h * TileW) + w + 1));
        end
    end
    
    % Image DCT
    DCTOut = zeros(8, 8, (TileH * TileW));
    
    QTable = ...
        [[16, 11, 10, 16, 24, 40, 51, 61];
         [12, 12, 14, 19, 26, 58, 60, 55];
         [14, 13, 16, 24, 40, 57, 69, 56];
         [14, 17, 22, 29, 51, 87, 80, 62];
         [18, 22, 37, 56, 68,109,103, 77];
         [24, 35, 55, 64, 81,104,113, 92];
         [49, 64, 78, 87,103,121,120,101];
         [72, 92, 95, 98,112,100,103, 99]];
    
     % Quantized DCT output
    for n = 1:(TileH * TileW)
    	DCTOut(:, :, n) = FDCT_2D_1D_VER(TiledImage(:, :, n));
        DCTOut(:, :, n) = round(DCTOut(:, :, n) ./ QTable);
    end
end

