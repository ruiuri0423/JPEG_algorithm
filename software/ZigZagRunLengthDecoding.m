function patch = ZigZagRunLengthDecoding(bitstream, prev_dc, patch_size)
    
    % Code -> Size -> Value
    DCCodeTable = readtable('DCCodeTable.xlsx');
    ACCodeTable = readtable('ACCodeTable.xlsx');
    
    code = string;
    iter = 1;
    
    Is_DC = 1;
    RunLengthDC = [0, 0, 0];
    while Is_DC
        code = code + bitstream(iter);
        
        if strcmp(code, '00')
            iter = iter + 2;
            code = string;
            Is_DC = 0;
        elseif any(ismember(DCCodeTable.Code, code))
            TempSize = DCCodeTable(ismember(DCCodeTable.Code, code), 2);
            
            RunLengthDC(2) = string(TempSize.Size);
            RunLengthDC(3) = bin2dec(bitstream(...
                (iter+1):(iter+RunLengthDC(2))));
            
            if RunLengthDC(3) < (2^(RunLengthDC(2) - 1))
                RunLengthDC(3) = RunLengthDC(3) - ((2^RunLengthDC(2)) - 1);
            end
           
            iter = iter + RunLengthDC(2) + 1;
            code = string;
            Is_DC = 0;
        else
            iter = iter + 1;
        end
    end
    
    RunLengthDC(3) = RunLengthDC(3) + prev_dc;
    RunLength = RunLengthDC;
    
    RunLengthAC = [0, 0, 0];
    while iter <= strlength(bitstream)
        code = code + bitstream(iter);
        
        if any(ismember(ACCodeTable.Code, code))
            TempLength = ACCodeTable(ismember(ACCodeTable.Code, code), 2);
            TempSize = ACCodeTable(ismember(ACCodeTable.Code, code), 3);
            
            RunLengthAC(1) = string(hex2dec(TempLength.Length));
            RunLengthAC(2) = string(hex2dec(TempSize.Size));
            if RunLengthAC(2) ~= 0
                RunLengthAC(3) = bin2dec(bitstream(...
                    (iter+1):(iter+RunLengthAC(2))));
                
                if RunLengthAC(3) < (2^(RunLengthAC(2) - 1))
                    RunLengthAC(3) = RunLengthAC(3) - ((2^RunLengthAC(2)) - 1);
                end
            else
                RunLengthAC(3) = 0;
            end
            
            iter = iter + RunLengthAC(2) + 1;
            code = string;
            
            RunLength = [RunLength; RunLengthAC];
        else
            iter = iter + 1;
        end
    end
    
    % Zig-Zag
    patch = zeros(patch_size, patch_size);
    [Height, Width] = size(patch);
    iter_h = 1;
    iter_w = 1;
    direction = 1;
    isBoundary = 1;
    
    % RunLength to Zig-Zag
    EOB = zeros(3);
    end_of_zigzag = 0;
    rl_index = 2;
    patch(iter_h, iter_w) = RunLength(1, 3);  % DC value
    NonZeroDistance = RunLength(rl_index, 1);
    
    if RunLength(rl_index, :) == EOB
        end_of_zigzag = 1;
    end
    
    while(iter_h < Height || iter_w < Width) && ~end_of_zigzag
        if(isBoundary)
            % Go right
            if((iter_h == 1 && iter_w < Width) ...
                    || (iter_h == Height && iter_w < Width))
                iter_w = iter_w + 1;
            % Go down
            else
                iter_h = iter_h + 1;
            end
            
            % Direction
            if(iter_h == 1 || iter_w == Width)
                direction = 1;
            else
                direction = -1;
            end
            
            % reset boundary
            isBoundary = 0;
        else
            % movingggg!
            iter_h = iter_h + direction;
            iter_w = iter_w - direction;
            
            % Check boundary
            if(iter_h == 1 || iter_w == 1 ...
                    || iter_h == Height || iter_w == Width)
                isBoundary = 1;
            else
                isBoundary = 0;
            end
        end
        
        if NonZeroDistance == 0
            patch(iter_h, iter_w) = RunLength(rl_index, 3);
            rl_index = rl_index + 1;
            NonZeroDistance = RunLength(rl_index, 1);
            if RunLength(rl_index, :) == EOB
                end_of_zigzag = 1;
            end
        else
            NonZeroDistance = NonZeroDistance - 1;
        end
    end
end