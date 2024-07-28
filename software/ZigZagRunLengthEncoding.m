function bitstream = ZigZagRunLengthEncoding(patch, prev_dc)
    
    % Output Format
    % Symbol-1: (Runlength, Size) ... coded
    % Symbol-2: (Non-zero value) ... coded
    
    % Differential DC / DC code
    PreviousDC = prev_dc;
    DifferentialDC = patch(1, 1) - PreviousDC;
    
    % Zig-Zag
    [Height, Width] = size(patch);
    iter_h = 1;
    iter_w = 1;
    OutputPointer = 2;
    direction = 1; %
    isBoundary = 1;
    ZigZagOut = zeros(1, (Height * Width));
    ZigZagOut(1) = DifferentialDC;

    while(iter_h < Height || iter_w < Width)
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
    
        ZigZagOut(OutputPointer) = patch(iter_h, iter_w);
        OutputPointer = OutputPointer + 1;
    end
    
    % Run length
    % Size of Symbol 1 is the bits of the non-zero value needed.
    % Transfer the zig-zag to the uncoding run-length version.
    % ACCodeTable = readtable('ACCodeTable.xlsx');
    DCCodeTable = readtable('DCCodeTable.xlsx');
    ACCodeTable = readtable('ACCodeTable.xlsx');
    RLSize = VariableLengthIntegerSize(ZigZagOut(1));
    RunLengthOut = [0, RLSize, ZigZagOut(1)];
    RLLength = 0;
    
    for v = ZigZagOut(2:(Height * Width))
        RLSize = VariableLengthIntegerSize(v);
        if(RLLength == 15 || v ~= 0)
            RunLengthOut = [RunLengthOut; [RLLength, RLSize, v]];
            RLLength = 0;
        else
            RLLength = RLLength + 1;
        end
    end
    
    if(RLSize == 0)
        [SymbolSize, ~] = size(RunLengthOut);
        for i = SymbolSize:-1:2
            if(RunLengthOut(i, 2) ~= 0)
                break;
            else
                RunLengthOut(i, :) = [];
            end
        end
    end
    
    RunLengthOut = [RunLengthOut; [0, 0, 0]]; %EOB
    
    %% Encode bitstream
    [RLRows, ~] = size(RunLengthOut);
    for i = 1:RLRows
        if(i == 1) % DC
            RLCode = VariableLengthIntegerCode(RunLengthOut(i, 3));
            TempCode = DCCodeTable(ismember(DCCodeTable.Size, int2str(RunLengthOut(i, 2))), 4);
            bitstream = strcat(string(TempCode.Code), RLCode);
        elseif(i ~= 1 || i ~= RLRows) % AC
            RLCode = VariableLengthIntegerCode(RunLengthOut(i, 3));
            TempTable = ACCodeTable(ismember(ACCodeTable.Length, dec2hex(RunLengthOut(i, 1))), :);
            TempCode  = TempTable(ismember(TempTable.Size, dec2hex(RunLengthOut(i, 2))), :);
            if hex2dec(TempCode.Size) ~= 0
                bitstream = strcat(bitstream, string(TempCode.Code), RLCode);
            else
                bitstream = strcat(bitstream, string(TempCode.Code));
            end
        end
    end
    bitstream = char(bitstream);
end

