function output = FDCT_2D(size, input)

    % To match the algorithm described.
    size_minus_one = size - 1;
    output = zeros(size);
    
    % Mapping
    input_mapping = fopen('Input Mapping.txt', 'w');
    output_mapping = fopen('Output Mapping.txt', 'w');
    input_mapping_code = fopen('Input Mapping code.txt', 'w');
    output_mapping_code = fopen('Output Mapping code.txt', 'w');

    fprintf(input_mapping, '-       InputMapping       -|\n');
    fprintf(input_mapping, '----------------------------|\n');
    fprintf(input_mapping, ' n |  p |  s |  i | ja | jb |\n');
    fprintf(input_mapping, '----------------------------|\n');

    fprintf(output_mapping, '-             OutputMapping              -|\n');
    fprintf(output_mapping, '------------------------------------------|\n');
    fprintf(output_mapping, ' m |  n |  s |      port |  s |      port |\n');
    fprintf(output_mapping, '------------------------------------------|\n');

    for m = 0:(size_minus_one)
        for n = 0:(size_minus_one)
            
            fprintf(output_mapping_code, 'dct_out(%d, %d) = ', m + 1, n + 1);
            
            for p = 1:2:(size_minus_one)
                
                if m == 0 && n == 0
                    fprintf(input_mapping_code, 'even_%d = [', p);
                elseif m == 0 && n == 1
                    fprintf(input_mapping_code, 'odd_%d  = [', p);
                end
                
                for i = 0:(size_minus_one) 
                    
                    % Index variable
                    ja = rem((p * i + (p - 1) / 2), size);
                    jb = size - 1 - ja;
                
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
                        input_sum = input(i + 1, ja + 1) + input(i + 1, jb + 1);
                        cos_basis_signed = sign_cos_pos * cos_basis_pos + sign_cos_neg * cos_basis_neg;
                        output(m + 1, n + 1) = output(m + 1, n + 1) + input_sum * cos_basis_signed;
                    else
                        qoutient_pi = floor((p * i + (p - 1) / 2) / size);
                        input_sum = power(-1, qoutient_pi) * (input(i + 1, ja + 1) - input(i + 1, jb + 1));
                        cos_basis_signed = sign_cos_pos * cos_basis_pos + sign_cos_neg * cos_basis_neg;
                        output(m + 1, n + 1) = output(m + 1, n + 1) + input_sum * cos_basis_signed;
                    end
                    
                    if m == 0 && (n == 0 || n == 1)
                        fprintf(input_mapping, '%2d | %2d | %2d | %2d | %2d | %2d |\n', n, p, power(-1, qoutient_pi), i, ja, jb);
                        
                        if n == 0
                            fprintf(input_mapping_code, '((%2d) * input(%d, %d) + (%2d) * input(%d, %d))', 1, (i + 1), (ja + 1), 1, (i + 1), (jb + 1));
                        else
                            fprintf(input_mapping_code, '((%2d) * input(%d, %d) + (%2d) * input(%d, %d))', power(-1, qoutient_pi), (i + 1), (ja + 1), (power(-1, qoutient_pi) * (-1)), (i + 1), (jb + 1)');
                        end
                        
                        if i == size_minus_one
                            fprintf(input_mapping_code, '];\n');
                        else
                            fprintf(input_mapping_code, ', ');
                        end
                    end
                end
                
                if m == 0 && (n == 0 || n == 1)
                    fprintf(input_mapping, '----------------------------|\n');
                end
                
                if rem(n, 2) == 0
                    if norm_cos_pos == size
                        port_1 = '0';
                    else
                        port_1 = 'even_' + string(p) + '(' + string(norm_cos_pos + 1) + ')';
                    end
                    
                    if  norm_cos_neg == size
                        port_2 = '0';
                    else
                        port_2 = 'even_' + string(p) + '(' + string(norm_cos_neg + 1) + ')';
                    end
                else
                    if norm_cos_pos == size
                        port_1 = '0';
                    else
                        port_1 = 'odd_' + string(p) + '(' + string(norm_cos_pos + 1) + ')';
                    end
                    
                    if norm_cos_neg == size
                        port_2 = '0';
                    else
                        port_2 = 'odd_' + string(p) + '(' + string(norm_cos_neg + 1) + ')';
                    end
                end
                
                fprintf(output_mapping, '%2d | %2d | %2d | %9s | %2d | %9s |\n', m, n, sign_cos_pos, port_1, sign_cos_neg, port_2);
                fprintf(output_mapping_code, '(%2d) * %9s + (%2d) * %9s', sign_cos_pos, port_1, sign_cos_neg, port_2);
                    
                if p ~= size_minus_one
                    fprintf(output_mapping_code, ' + ');
                else
                    fprintf(output_mapping_code, ';\n');
                end
            end
            
            fprintf(output_mapping, '------------------------------------------|\n');
            
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

            output(m + 1, n + 1) = output(m + 1, n + 1) * 0.5 * u_m * u_n;
        end 
    end
    
    fclose(input_mapping);
    fclose(output_mapping);
    fclose(input_mapping_code);
    fclose(output_mapping_code);
end


