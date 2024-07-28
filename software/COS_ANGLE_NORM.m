function [sign, norm_n] = COS_ANGLE_NORM(n,N)
    quadrant = rem(floor(n / N), 4);
    if quadrant == 0 || quadrant == 3
        sign = 1; % positive
    else
        sign = -1; % negative
    end

    % normal angle
    norm_n = rem(n, 2 * N);
    norm_n = abs(2 * N * floor(norm_n / N) - norm_n);
end
