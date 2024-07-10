function val = polynterpreter(coeff, x)
arguments
    coeff (1,:) double {mustBeFloat ,mustBeNonmissing}
    x (1,:) double {mustBeFloat ,mustBeNonmissing}
end

    val = flip(coeff) * (x' * ones(1, size(coeff, 2))).^(0:size(coeff, 2) - 1)';
end