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

    computable = 1;

    if (mode ~= "jacobi" && mode ~= "gauss")
        disp("<ERR>     Non è possibile calcolare la matrice specifica");
        computable = 0;
    end

    % Scomposizione
    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));

    % Calcolo di B
    if (~computable)
        B = inf(1);
        return;
    end
    if (mode == "jacobi")
        B = inv(D) * (L + U);
    else
        B = inv(D - L) * U;
    end

    % Calcolo degli autovalori e considerazioni sulla convergenza
    max_eigenvalue = max(abs(eig(B)));
    if (max_eigenvalue > 1)
        disp("<INF> Il metodo di " + mode + " non può convergere");
    else
        disp("<INF> Il metodo di " + mode + " converge");
    end
end