% FINDER PER PUNTI STAZIONARI SU FUNZIONI POLINOMIALI
% 
% input:
%       poly - Coefficienti del polinomio in questione
% 
% output:
%       max - Vettore dei punti di massimo
%       min - Vettore dei punti di minimo
%       inflexion - Vettore dei punti di flesso
function [max, min, inflexion] = polystat(poly)

arguments
    poly (1,:) double {mustBeNonmissing}
end

    der = polyder(poly);
    der2 = polyder(der);

    der_zeros = roots(der)';

    max = inf(1, size(der_zeros, 2));
    min = inf(1, size(der_zeros, 2));
    inflexion = inf(1, size(der_zeros, 2));
    
    for i=1:size(der_zeros, 2)
        % Punto di massimo
        if (polyval(der2, der_zeros(i)) < 0)
            max = [max der_zeros(i)];
        % Punto di minimo
        elseif (polyval(der2, der_zeros(i)) > 0)
            min = [min der_zeros(i)];
        else
            inflexion = [inflexion der_zeros(i)];
        end
    end
end