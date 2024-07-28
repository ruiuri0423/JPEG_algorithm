function size = VariableLengthIntegerSize(value)
    % VLI Table
    if(value == 0)
        size = 0;
    elseif(value == -1 || value == 1)
        size = 1;
    elseif((value >= -3 && value <= -2) || (value >= 2 && value <= 3))
        size = 2;
    elseif((value >= -7 && value <= -4) || (value >= 4 && value <= 7))
        size = 3;
    elseif((value >= -15 && value <= -8) || (value >= 8 && value <= 15))
        size = 4;
    elseif((value >= -31 && value <= -16) || (value >= 16 && value <= 31))
        size = 5;
    elseif((value >= -63 && value <= -32) || (value >= 32 && value <= 63))
        size = 6;
    elseif((value >= -127 && value <= -64) || (value >= 64 && value <= 127))
        size = 7;
    elseif((value >= -255 && value <= -128) || (value >= 128 && value <= 255))
        size = 8;
    elseif((value >= -511 && value <= -256) || (value >= 256 && value <= 511))
        size = 9;
    elseif((value >= -1023 && value <= -512) || (value >= 512 && value <= 1023))
        size = 10;
    elseif((value >= -2047 && value <= -1024) || (value >= 1024 && value <= 2047))
        size = 11;
    end
end

