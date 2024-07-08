% CHECKER DELLE CONDIZIONI DI CHOLESKY
% 
% input:
%       M - Matrice 2d generica
% 
% output:
%       flag - Valore logico che dice se la matrice incontra i requisiti
%       per l'applicazione del metodo di Cholesky
function flag = choleskable(M)

arguments
    % Matrice 2d generica
    M (:, :) double {mustBeNonmissing}
end

    if (~issymmetric(M))
        disp("<ERR>     La matrice generata non è simmetrica e quindi non è possibile applicare Cholesky");
        flag = 0;
        return;
    end
    eigenvalues = eig(M);
    if (~all(eigenvalues > 0))
        disp("<ERR>     Siccome c'è un autovalore che non è positivo allora la matrice non è def. positiva");
        flag = 0;
        return;
    end
    flag = 1;
end