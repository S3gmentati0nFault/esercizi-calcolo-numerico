% Fattorizzazione di Cholesky
function [R, back, sol] = cholesky(M, b)

arguments
    % Matrice 2d generica
    M (:, :) double

    % Vettore dei termini noti
    b (:, 1) double
end

    if (~ choleskable(M))
        disp("<ERR>     Non è possibile eseguire la fattorizzazione di Cholesky sulla matrice M");
        R = nan(size(M, 1));
        back = nan(1, size(M, 1));
        sol = nan(1, size(M, 1));
        return;
    end

    R = chol(M);
    back = R' \ b;
    sol = R \ back;
end