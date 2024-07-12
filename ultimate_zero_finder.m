function [zero, nit] = ultimate_zero_finder(f, df, tollb, tolln, maxit, a, b)
    [x0, n] = bisezione(f, a, b, tollb);
    [x, nit] = newton(f, df, x0, tolln, maxit);

    nit = nit + n;
    zero = x;
end