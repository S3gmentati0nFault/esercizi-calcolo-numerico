% COSTRUTTORE DI MATRICI TRIDIAGONALI
% 
% input:
%       size - Dimensione della matrice
%       d - Elemento da inserire lungo la diagonale
%       du - Elemento da inserire lungo la diagonale superiore
%       dl - Elemento da inserire lungo la diagonale inferiore
% 
% output:
%       M - Matrice tridiagonale
function M = tridiag(size, d, du, dl)

arguments
    size (1, 1) {mustBeNumeric, mustBePositive}
    d (1, 1) double
    du (1, 1) double
    dl (1, 1) double
end

    M = zeros(size);
    M = M + diag(ones(1, size) * d) + diag(ones(1, size - 1) * du, 1) + diag(ones(1, size - 1) * dl, -1);
end