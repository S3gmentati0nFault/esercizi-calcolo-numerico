function val = polynterpreter(coeff, x)
arguments
    coeff (1, :) double
    x double
end

    val = flip(coeff) * (x' * ones(1, size(coeff, 2))).^(flip(0:size(coeff, 2) - 1))';
end