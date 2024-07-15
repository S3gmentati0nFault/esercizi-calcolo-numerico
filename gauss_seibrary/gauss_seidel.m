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

arguments
    M (:,:) double {mustBeFloat}
    x (:,1) double
    b (:, 1) double
    epsilon (1,1) double {mustBeScalarOrEmpty}
    nitmax (1,1) double {mustBeScalarOrEmpty}
end

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