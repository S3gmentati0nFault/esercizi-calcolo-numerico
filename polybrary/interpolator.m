% CALCOLATORE DELL'INTERPOLAZIONE PER FUNZIONI POLINOMIALI
% 
% input:
%       f - Funzione da interpolare
%       b - Inizio dell'intervallo di interpolazione
%       e - Fine dell'intervallo di interpolazione
%       n - Numero di punti all'interno dell'intervallo di interpolazione
% 
% output:
%       coeff - Coefficienti del polinomio interpolante
%       poly_x - Punti lungo l'asse x del polinomio interpolante
%       poly_y - Punti lungo l'asse y del polinomio interpolante
%       x - Ascisse di interpolazione
%       y - Ordinata di interpolazione
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