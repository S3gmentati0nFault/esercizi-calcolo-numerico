% DECOMPOSITOR PER LA MATRICE DI GAUSS-SEIDEL
% 
% input:
%       A - Matrice 2d generica
% 
% output:
%       D - Matrice diagonale che scaturisce dalla decomposizione
%       L - Matrice triangolare bassa che scaturisce dalla decomposizione
%       U - Matrice triangolare alta che scaturisce dalla decomposizione
%       B - Matrice di iterazione di GS
function [D, L, U, B] = gauss_decompositor(A)
arguments
    % Matrice di riferimento
    A (:, :) double {mustBeNonmissing}
end

    % Scomposizione
    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));

    % Calcolo di B
        B = inv(D - L) * U;

    % Calcolo degli autovalori e considerazioni sulla convergenza
    max_eigenvalue = max(abs(eig(B)));
    if (max_eigenvalue > 1)
        disp("<INF> Il metodo di GS non può convergere");
    else
        disp("<INF> Il metodo di GS converge");
    end
end