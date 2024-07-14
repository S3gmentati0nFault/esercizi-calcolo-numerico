function [n] = esercizio2()
    % Inizializzazione
    N = 8;
    A = tridiag(N, 4, 2, 1);
    b = ones(N, 1);

    % Punto 1
    % Calcolare autovalori e autovettori della matrice A. Sia V la matrce 
    % contenente su ogni colonna un autovettore associato ad un autovalore 
    % di A, calcolare il determinante det(V)
    [V, D] = eig(A);
    detV = det(V);

    % Punto 2
    % Fissati x0 = zeros(N, 1), toll = 1e − 5, nitmax = 200, risolvere il 
    % sistema Ax = b con il metodo di Jacobi, siano xj la soluzione 
    % calcolata e nit il numero di iterazioni effettuate.
    x0 = zeros(N, 1);
    toll = 1e-5;
    nitmax = 200;
    [xj, nit] = jacobi(A, x0, b, toll, nitmax);
    % [sol, nit] = jacobi_lezione(A, b, x0, toll, nitmax);

    % Punto 3
    % Risolvere il sistema lineare Ax = b con l’apposito comando di matlab 
    % \. Sia xe la soluzione ottenuta, considerando xe come soluzione 
    % esatta si determini l’errore commesso con Jacobi calcolando 
    % ||xe − xj||2.
    x = A \ b;
    n = norm(x - xj, 2);
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


% Decomposizione diagonale

% D - matrice diagonale
% L - matrice triangolare bassa (negativa)
% U - matrice triangolare alta (negativa)
% B - matrice di Jacobi o di Gauss-Siedel
function [D, L, U, B] = decompositor(A)
    % Scomposizione
    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));
    B = inv(D) * (L + U);
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
    [D, L, U, B] = decompositor(M);

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


function  [x, nit]=jacobi_lezione(A, b, x0, toll, nitmax)
%input: A matrice del sistema
%       b termine noto
%       x0 vettore iniziale
%       toll tolleranza nel test d'arresto
%       nitmax  numero massimo di iterazioni consentite
%output: x vettore soluzione
%        nit numero di iterazioni effetuate
D=diag(diag(A));
E=-tril(A,-1);
F=-triu(A,1);
nit=0;
err=toll+1;
nb=norm(b,inf);
while err>toll & nit<nitmax
    x=D\(b+(E+F)*x0);
    err=max(norm(x-x0,inf)/norm(x,inf), norm(b-A*x,inf)/nb);
    nit=nit+1;
    x0=x;
end
if nit==nitmax & err>toll
    disp('Jacobi non converge nel numero di iterazioni assegnato');
    return
end
end