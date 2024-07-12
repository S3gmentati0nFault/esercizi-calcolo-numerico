function [q] = midpoint(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) * f((a + b) / 2);

end