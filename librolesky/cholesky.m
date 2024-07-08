% FATTORIZZAZIONE DI CHOLESKY
% 
% input:
%       M - Matrice 2d generica
%       b - Vettore dei termini noti
% 
% output:
%       R - Fattorizzazione di Cholesky
%       back - Vettore dei termini noti associati alla risoluzione inversa
%       del sistema
%       sol - Vettore soluzione
function [R, back, sol] = cholesky(M, b)

arguments
    % Matrice 2d generica
    M (:, :) double {mustBeFloat, mustBeNonmissing}

    % Vettore dei termini noti
    b (:, 1) double {mustBeFloat, mustBeNonmissing}
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