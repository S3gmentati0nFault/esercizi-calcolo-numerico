function [l] = esercizio1()
    % Inizializzazione
    v = linspace(0, exp(1), 9);
    M = tridiag(10, 3, 0, -1);
    M = M + diag(v, 1);
    b = 10 * ones(10,1);

    % Punto 1
    [L, U, P] = lu(M);
    n = norm(U, 2);

    % Punto 2
    y = L \ (P * b);
    x = U \ y;
    nx = norm(x, 2);
    ny = norm(y, 2);

    % Punto 3
    [D, L, U, B] = decompositor(M);
    eigB = eig(B);
    rho = max(abs(eigB));
    % Il metodo di GS non può converge perchè il modulo dell'autovalore di
    % modulo massimo è maggiore di 1

    % Punto 4
    x0 = zeros(size(M, 1),1);
    toll = 1e-6;
    nitmax = 200;
    [xgs, nit] = gs(M, b, x0, toll, nitmax);
    [xgs1] = gauss_seidel(M, x0, b, toll, nitmax);
    l = xgs == xgs1;
    err_rel = abs(x - xgs) ./ abs(x);
    ne = norm(err_rel, 2);
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
    computable = 1;

    % Scomposizione
    D = diag(diag(A));
    L = - (tril(A - D));
    U = - (triu(A - D));

    % Calcolo di B
    B = inv(D - L) * U;

    % Calcolo degli autovalori e considerazioni sulla convergenza
    max_eigenvalue = max(abs(eig(B)));
    if (max_eigenvalue > 1)
        disp("<INF> Il metodo GS non può convergere");
    else
        disp("<INF> Il metodo GS converge");
    end
end


function  [x, nit]=gs(A, b, x0, toll, nitmax)
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
    x=(D-E)\(b+F*x0);
    err=max(norm(x-x0,inf)/norm(x,inf), norm(b-A*x,inf)/nb);
    nit=nit+1;
    x0=x;
end
if (nit==nitmax & err>toll)
  disp('GS non converge nel numero di iterazioni assegnato');
  return
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
    [D, L, U, B] = decompositor(M);

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