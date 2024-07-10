% CALCOLATORE DELL'INTERPOLAZIONE PER FUNZIONI POLINOMIALI
% 
% input:
%       f - funzione da interpolare
%       b - inizio dell'intervallo di interpolazione
%       e - fine dell'intervallo di interpolazione
%       n - numero di punti all'interno dell'intervallo di interpolazione
% 
% output:
%       coeff - coefficienti del polinomio interpolante
%       poly_x - punti lungo l'asse x del polinomio interpolante
%       poly_y - punti lungo l'asse y del polinomio interpolante
%       x - ascisse di interpolazione
%       y - ordinata di interpolazione
function [coeff, poly_x, poly_y, x, y] = interpolator(f, b, e, n)
arguments
    f {mustBeNonmissing}
    b double
    e double
    n double
end

    % Generazione dei punti di interpolazione
    x = linspace(b, e, n);
    y = f(x);

    % Interpolazione
    coeff = polyfit(x, y, size(x, 2) - 1);

    % Generazione dei punti ausiliari per il disegno della funzione
    poly_x = linspace(b, e);
    poly_y = polynterpreter(coeff, poly_x);
end