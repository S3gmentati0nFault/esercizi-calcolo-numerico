% DECOMPOSITOR PER LA MATRICE DI JACOBI
% 
% input:
%       f - Funzione di cui si vuole trovare lo 0
%       df - Derivata della funzione f
%       tollb - Tolleranza del metodo di bisezione
%       tolln - Tolleranza del metodo di Newton
%       maxit - Massimo numero di iterazioni per Newton
%       a - Inizio dell'intervallo di bisezione
%       b - Fine dell'intervallo di bisezione
% 
% output:
%       zero - Approssimazione dello zero della funzione f
%       nit - Numero totale di iterazioni
function [zero, nit] = ultimate_zero_finder(f, df, tollb, tolln, maxit, a, b)
    [x0, n] = bisezione(f, a, b, tollb);
    [x, nit] = newton(f, df, x0, tolln, maxit);

    nit = nit + n;
    zero = x;
end