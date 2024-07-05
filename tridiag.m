% Costruttore di matrici tridiagonali
function M = tridiag(size, d, du, dl)

arguments
    % Dimensione della matrice
    size (1, 1) {mustBeNumeric, mustBePositive}

    % Elemento da inserire lungo la diagonale
    d (1, 1) double

    % Elemento da inserire lungo la diagonale superiore
    du (1, 1) double

    % Elemento da inserire lungo la diagonale inferiore
    dl (1, 1) double
end

    M = zeros(size);
    M = M + diag(ones(1, size) * d) + diag(ones(1, size - 1) * du, 1) + diag(ones(1, size - 1) * dl, -1);
end