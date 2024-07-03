% Decomposizione diagonale

% D - matrice diagonale
% L - matrice triangolare bassa (negativa)
% U - matrice triangolare alta (negativa)
% B - matrice di Jacobi o di Gauss-Siedel
function [D, L, U, B] = decompositor(mode, A)
    computable = 1;

    if (mode ~= "jacobi" && mode ~= "gauss")
        disp("<ERR>     Non è possibile calcolare la matrice specifica");
        computable = 0;
    end

    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));

    if (~computable)
        B = inf(1);
        return;
    end

    if (mode == "jacobi")
        B = inv(D) * (L + U);
    else
        B = inv(D - L) * U;
    end
end