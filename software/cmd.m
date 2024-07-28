clear;
%% read image
image = imread("./cameraman.bmp");
image = double(image) - 128; % pixels shift
quanted_dct = GrayScaleImageDCT(image);

[~, ~, block_number] = size(quanted_dct);

% Zig-zag in/out
patch = zeros(size(quanted_dct));

for i = 1:block_number
    if i == 1
        bitstream = ZigZagRunLengthEncoding(quanted_dct(:, :, i), 0);
        patch(:, :, i) = ZigZagRunLengthDecoding(bitstream, 0, 8);
    else
        bitstream = ZigZagRunLengthEncoding(quanted_dct(:, :, i), quanted_dct(1, 1, i-1));
        patch(:, :, i) = ZigZagRunLengthDecoding(bitstream, quanted_dct(1, 1, i-1), 8);
    end
end

image_idct = GrayScaleImageIDCT(patch);

% PSNR test (quantization degrade)
image = uint8(image + 128);
image_idct = uint8(image_idct + 128);

psnr_quanted = psnr(image_idct, image);

