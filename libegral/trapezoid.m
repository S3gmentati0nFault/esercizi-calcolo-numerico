function [q] = trapezoid(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) / 2 * (f(a) + f(b));

end