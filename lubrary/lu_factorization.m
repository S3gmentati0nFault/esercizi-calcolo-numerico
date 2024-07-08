% FATTORIZZAZIONE LU
% 
% input:
%       A - Matrice 2d generica
%       b - Vettore dei termini noti
% 
% output:
%       sol - Soluzione del processo di fattorizzazione LU
function sol = lu_factorization(A, b)

arguments
    A (:,:) double {mustBeFloat, mustBeNonmissing}
    b (:,1) double {mustBeFloat, mustBeNonmissing}
end

    [L, U, P] = lu(A);

    y = L \ (P * b);
    sol = U \ y;

end