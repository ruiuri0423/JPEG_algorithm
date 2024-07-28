function [coef_mat_2d, output] = DCT_2D(size,image)
    
    % 1D cosine basis function
    coef_mat_1d = zeros([size, size]); % coefficient matrix

    for u = 1:size
        for x = 1:size
            u_zst = u - 1; % zst: zero start
            x_zst = x - 1;
            
            coef_mat_1d(u, x) = cos(pi*(2*x_zst+1)*u_zst/2/size);
        end
    end
    
    % 2D cosine basis function
    coef_mat_2d = zeros([size, size, (size*size)]);
    output = zeros([size, size]);
    
    for u = 1:size
        if u == 1
            u_alpha = sqrt(1/size);
        else
            u_alpha = sqrt(2/size);
        end
            
        for v = 1:size
            if v == 1 
                v_alpha = sqrt(1/size);
            else
                v_alpha = sqrt(2/size);
            end
            
            alpha = u_alpha * v_alpha;
            freq_num = (u-1)*size+v; % # of frequency
            
            coef_mat_2d(:, :, freq_num) = alpha * coef_mat_1d(u, :)' * coef_mat_1d(v, :); 
            output(u, v) = sum((coef_mat_2d(:, :, freq_num) .* image), "all");
        end
    end
end

