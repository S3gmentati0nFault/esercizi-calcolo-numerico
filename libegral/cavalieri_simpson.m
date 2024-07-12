function [q] = cavalieri_simpson(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b));

end