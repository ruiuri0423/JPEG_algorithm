function code = VariableLengthIntegerTable(value)
    % VLI Table
    if(value == 0)
        size = 0;
        code = '0';
        
    elseif(value == -1 || value == 1)
        size = 1;
        if(value < 0)
            code = dec2bin(value + 1, size);
        else
            code = dec2bin(value, size);
        end
        
    elseif((value >= -3 && value <= -2) || (value >= 2 && value <= 3))
        size = 2;
        if(value < 0)
        	code = dec2bin(value + 3, size);
        else
        	code = dec2bin(value, size);
        end
            
    elseif((value >= -7 && value <= -4) || (value >= 4 && value <= 7))
        size = 3;
        if(value < 0)
            code = dec2bin(value + 7, size);
        else
            code = dec2bin(value, size);
        end
        
    elseif((value >= -15 && value <= -8) || (value >= 8 && value <= 15))
        size = 4;
        if(value < 0)
            code = dec2bin(value + 15, size);
        else
            code = dec2bin(value, size);
        end
        
    elseif((value >= -31 && value <= -16) || (value >= 16 && value <= 31))
        size = 5;
        if(value < 0)
            code = dec2bin(value + 31, size);
        else
            code = dec2bin(value, size);
        end
        
    elseif((value >= -63 && value <= -32) || (value >= 32 && value <= 63))
        size = 6;
        if(value < 0)
            code = dec2bin(value + 63, size);
        else
            code = dec2bin(value, size);
        end
        
    elseif((value >= -127 && value <= -64) || (value >= 64 && value <= 127))
        size = 7;
        if(value < 0)
            code = dec2bin(value + 127, size);
        else
            code = dec2bin(value, size);
        end
            
    elseif((value >= -255 && value <= -128) || (value >= 128 && value <= 255))
        size = 8;
        if(value < 0)
            code = dec2bin(value + 255, size);
        else
            code = dec2bin(value, size);
        end
            
    elseif((value >= -511 && value <= -256) || (value >= 256 && value <= 511))
        size = 9;
        if(value < 0)
            code = dec2bin(value + 511, size);
        else
            code = dec2bin(value, size);
        end
            
    elseif((value >= -1023 && value <= -512) || (value >= 512 && value <= 1023))
        size = 10;
        if(value < 0)
            code = dec2bin(value + 1023, size);
        else
            code = dec2bin(value, size);
        end
    elseif((value >= -2047 && value <= -1024) || (value >= 1024 && value <= 2047))
        size = 11;
        if(value < 0)
            code = dec2bin(value + 2047, size);
        else
            code = dec2bin(value, size);
        end
    end
end

