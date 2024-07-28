function output = IDCT_1D_BASIS(size) 

    % 1D cosine basis function
    output = zeros([size, size]); % coefficient matrix

    for i = 1:size
        for l = 1:size
            i_minus_one = i - 1; % zst: zero start
            l_minus_one = l - 1;
            
            if l_minus_one == 0
                l_alpha = sqrt(1/size);
            else
                l_alpha = sqrt(2/size);
            end
            
            output(i, l) = l_alpha * cos(pi * (2 * i_minus_one + 1) * l_minus_one / 2 / size);
        end
    end
end

