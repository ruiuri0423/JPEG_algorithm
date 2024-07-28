function output = DCT_1D_BASIS(size) 

    % 1D cosine basis function
    output = zeros([size, size]); % coefficient matrix

    for l = 1:size
        for i = 1:size
            i_minus_one = i - 1; % zst: zero start
            l_minus_one = l - 1;
            
            output(l, i) = cos(pi * (2 * i_minus_one + 1) * l_minus_one / 2 / size);
        end
    end
end

