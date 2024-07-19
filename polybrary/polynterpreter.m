% CALCOLATORE DI PUNTI PER FUNZIONI POLINOMIALI
% 
% input:
%       coeff - Vettore dei coefficienti, deve essere necessariamente
%       ordinato dal coefficiente più basso (0) al coefficiente più alto
%       x - Insieme di valori lungo l'asse x di cui si vuole calcolare il
%       valore
% 
% output:
%       val - Vettore di valori lungo l'asse delle y risultato del calcolo
%       del polinomio
function val = polynterpreter(coeff, x)
arguments
    coeff (1,:) double {mustBeFloat ,mustBeNonmissing}
    x (1,:) double {mustBeFloat ,mustBeNonmissing}
end

    val = flip(coeff) * (x' * ones(1, size(coeff, 2))).^(0:size(coeff, 2) - 1)';
end