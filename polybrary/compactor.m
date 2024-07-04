function res = compactor(poly)
arguments
    poly (1, :) double
end

    first_nonzero = find(poly, 1, 'first');
    
    if (first_nonzero == 0)
        res = poly;
        return;
    end

    res = poly(first_nonzero:size(poly, 2));
end