% Decomposizione diagonale

% D - matrice diagonale
% L - matrice triangolare bassa (negativa)
% U - matrice triangolare alta (negativa)
% B - matrice di Jacobi o di Gauss-Siedel
function [D, L, U, B] = decompositor(mode, A)
arguments
    % Tipo di matrice di iterazione
    mode (1, 1) string {mustBeText, mustBeScalarOrEmpty}
    
    % Matrice di riferimento
    A (:, :) double
end

    % Scomposizione
    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));

    % Calcolo di B
        B = inv(D) * (L + U);

    % Calcolo degli autovalori e considerazioni sulla convergenza
    max_eigenvalue = max(abs(eig(B)));
    if (max_eigenvalue > 1)
        disp("<INF> Il metodo di Jacobi non può convergere");
    else
        disp("<INF> Il metodo di Jacobi converge");
    end
end