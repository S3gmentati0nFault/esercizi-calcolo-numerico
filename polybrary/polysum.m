% FUNZIONE PER IL CALCOLO DELLA SOMMA DI POLINOMI
% 
% input:
%       p - Coefficienti del generico polinomio
% 
% output:
%       max - Vettore dei punti di massimo
%       min - Vettore dei punti di minimo
%       inflexion - Vettore dei punti di flesso
function sum = polysum(p, q)
arguments
    p (1, :) double
    q (1, :) double
end

    [min, max, E] = padder(p, q);
    
    if (E)
        sum = p + q;
        return;
    end

    sum = min + max;
    sum = compactor(sum);
end