function [padded_min, max, equal] = padder(p, q)
arguments
    p (1, :) double
    q (1, :) double
end

    p_size = size(p, 2);
    q_size = size(q, 2);

    % Creating a padding for the smallest vector
    if (p_size < q_size)
        min = p;
        max = q;
        min_size = p_size;
        max_size = q_size;
        equal = 0;
    elseif (p_size > q_size)
        min = q;
        max = p;
        min_size = q_size;
        max_size = p_size;
        equal = 0;
    else
        padded_min = [];
        max = [];
        equal = 1;
        return;
    end

    padding_size = max_size - min_size;
    padding = zeros(1, padding_size);
    padded_min = [padding, min];
end