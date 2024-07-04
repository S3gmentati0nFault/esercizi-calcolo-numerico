function sum = polysum(p, q)
arguments
    p (1, :) double
    q (1, :) double
end

    [min, max, E] = padder(p, q);
    
    if (E)
        sum = p + q;
        return;
    end

    sum = min + max;
    sum = compactor(sum);
end