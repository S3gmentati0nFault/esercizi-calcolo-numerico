% Funzione che controlla se una matrice è adeguata all'applicazione della
% fattorizzazione di Cholesky
function flag = choleskable(M)

arguments
    % Matrice 2d generica
    M (:, :) double
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