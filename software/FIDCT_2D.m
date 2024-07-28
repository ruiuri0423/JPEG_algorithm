function output = FIDCT_2D(size, input)

    % To match the algorithm described.
    size_minus_one = size - 1;
    output = zeros(size);
    
    for p = 1:2:(size_minus_one)
        for i = 0:(size_minus_one)
            
            % Index variable
            ja = rem((p * i + (p - 1) / 2), size);
            jb = size - 1 - ja;
            
            output_ja = 0;
            output_jb = 0;
            
            for m = 0:(size_minus_one)
                for n = 0:(size_minus_one) 
                    
                    % Normalized coefficeint
                    if m == 0
                        u_m = sqrt(1 / size);
                    else
                        u_m = sqrt(2 / size);
                    end

                    if n == 0
                        u_n = sqrt(1 / size);
                    else
                        u_n = sqrt(2 / size);
                    end
                    
                    % Cosine variable
                    cos_pos = abs(m + n * p);
                    cos_neg = abs(m - n * p);
                    
                    % Cosine normalization (rotate the angle into the 0 ~ pi/2)
                    [sign_cos_pos, norm_cos_pos] = COS_ANGLE_NORM(cos_pos, size);
                    [sign_cos_neg, norm_cos_neg] = COS_ANGLE_NORM(cos_neg, size);
                
                    % Compute cosine basis
                    cos_basis_pos = cos((2 * i + 1) * norm_cos_pos * pi / 2 / size);
                    cos_basis_neg = cos((2 * i + 1) * norm_cos_neg * pi / 2 / size);

                    % Compute the DCT
                    if rem(n, 2) == 0
                        qoutient_pi = 0;
                        input_j = input(m + 1, n + 1) * 0.5;
                        cos_basis_signed = u_m * u_n * ( ...
                            sign_cos_pos * cos_basis_pos + sign_cos_neg * cos_basis_neg);
                        output(i + 1, ja + 1) = output(i + 1, ja + 1) + input_j * cos_basis_signed;
                        output(i + 1, jb + 1) = output(i + 1, jb + 1) + input_j * cos_basis_signed;
                    else
                        qoutient_pi = floor((p * i + (p - 1) / 2) / size);
                        input_j = power(-1,  qoutient_pi) * input(m + 1, n + 1) * 0.5;
                        cos_basis_signed = u_m * u_n * ( ...
                            sign_cos_pos * cos_basis_pos + sign_cos_neg * cos_basis_neg);
                        output(i + 1, ja + 1) = output(i + 1, ja + 1) + input_j * cos_basis_signed;
                        output(i + 1, jb + 1) = output(i + 1, jb + 1) - input_j * cos_basis_signed;
                    end
                end
            end
        end 
    end
end


