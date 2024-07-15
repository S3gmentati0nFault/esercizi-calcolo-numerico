% Da un foglio degli esercizi a caso
function [] = esercizio12()
    % Inizializzazione
    A = tridiag(10, 3, -1, -1);
    b = [1, 0, 13, -3, -7, 5, -1, 1, -4, 4]';

    % Punto 1 - Calcolare la fattorizzazione di Cholesky
    flag = choleskable(A)
    % Siccome la matrice è simmetrica ed è definita positiva, posso
    % calcolare la fattorizzazione di Cholesky
    R = chol(A);
    nR = norm(R, inf)

    % Punto 2 - Soluzione del sistema lineare
    y = R' \ b;
    x = R \ y
    nx = norm(x, inf)
    ny = norm(y, inf)

    % Punto 3 - Convergenza del metodo di Gauss Seidel
    [D, L, U, B] = gauss_decompositor(A);
    rho = max(abs(eig(B)))
    % Siccome l'autovalore di modulo massimo ha valore < 1, per condizione
    % necessaria di convergenza del metodo di GS, il metodo converge.

    % Punto 4 - Metodo di GS
    x0 = zeros(size(B, 1), 1);
    toll = 1e-6;
    nitmax = 200;
    [xgs, nit] = gauss_seidel(A, x0, b, toll, nitmax);
    % Calcolo dell'errore relativo in norma infinito
    Er = norm((x - xgs), inf) / norm(x, inf)
end


% Costruttore di matrici tridiagonali
% 
% input:
%       size - Dimensione della matrice
%       d - Elemento da inserire lungo la diagonale
%       du - Elemento da inserire lungo la diagonale superiore
%       dl - Elemento da inserire lungo la diagonale inferiore
% 
% output:
%       M - Matrice tridiagonale
function M = tridiag(size, d, du, dl)
    M = zeros(size);
    M = M + diag(ones(1, size) * d) + diag(ones(1, size - 1) * du, 1) + diag(ones(1, size - 1) * dl, -1);
end


% CHECKER DELLE CONDIZIONI DI CHOLESKY
% 
% input:
%       M - Matrice 2d generica
% 
% output:
%       flag - Valore logico che dice se la matrice incontra i requisiti
%       per l'applicazione del metodo di Cholesky
function flag = choleskable(M)
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


% Decomposizione diagonale

% D - matrice diagonale
% L - matrice triangolare bassa (negativa)
% U - matrice triangolare alta (negativa)
% B - matrice di Jacobi o di Gauss-Siedel
function [D, L, U, B] = gauss_decompositor(A)
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


% SOLVER DI GAUSS-SEIDEL PER SISTEMI LINEARI
% 
% input:
%       M - Matrice 2d generica
%       x - Punto di partenza per l'esecuzione del metodo
%       b - Vettore dei termini noti
%       epsilon - Errore accettabile
%       nitmax - Numero massimo di iterazioni
% 
% output:
%       sol - Soluzione del metodo di Gauss
%       nit - Numero di iterazioni del metodo
function [sol, nit] = gauss_seidel(M, x, b, epsilon, nitmax)
    [D, L, U, B] = gauss_decompositor(M);

    for i=1:nitmax
        x_next = (D - L) \ (b + U * x);
        
        % Condizione di iterazione
        if (max(norm(b - M * x) / norm(b), norm(x_next - x) / norm(x)) < epsilon)
            disp("<INF> Il metodo di iterazione è terminato con la " + i + "-esima iterazione");
            sol = x_next;
            nit = i;
            return;
        end
        
        x = x_next;
    end

    disp("<INF> Siamo andati fuori dal numero massmo di iterazioni");
    nit = nitmax;
    sol = x;
end