% Da un foglio degli esercizi a caso
function [] = esercizio13()
    % Inizializzazione
    x = linspace(0, pi/2, 9);
    s = 11;

    % Punto 1 - costruzione di una matrice tridiagonale
    A = tridiag(10, s, 0, -1);
    A = A + diag(x, 1)
    b = ones(size(A, 1), 1)

    % Punto 2 - risoluzione di Ax = b con il metodo di Jacobi
    x0 = zeros(size(A, 1), 1);
    toll = 1e-5;
    nitmax = 200;

    [xj, nit] = jacobi(A, x0, b, toll, nitmax)

    % Punto 3 - risoluzione con MEG
    x = A \ b;
    E = norm(x - xj, 2)
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


% SOLVER DI JACOBI PER SISTEMI LINEARI
% 
% input:
%       M - Matrice 2d generica
%       x - Punto di partenza per l'esecuzione del metodo
%       b - Vettore dei termini noti
%       epsilon - Errore accettabile
%       nitmax - Numero massimo di iterazioni
% 
% output:
%       sol - Soluzione del metodo di Jacobi
%       nit - Numero di iterazioni del metodo
function [sol, nit] = jacobi(M, x, b, epsilon, nitmax) 
    [D, L, U, B] = jacobi_decompositor(M);

    for i=1:nitmax
        x_next = D \ ((L + U) * x + b);
        
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


% Decomposizione diagonale

% D - matrice diagonale
% L - matrice triangolare bassa (negativa)
% U - matrice triangolare alta (negativa)
% B - matrice di Jacobi o di Gauss-Siedel
function [D, L, U, B] = jacobi_decompositor(A)
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