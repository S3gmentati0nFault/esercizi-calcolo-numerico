% FORMULA DI INTEGRAZIONE NUMERICA DEL PUNTO MEDIO
% 
% input:
%       f - Funzione integranda
%       a - Inizio dell'intervallo di integrazione
%       b - Termine dell'intervallo di integrazione
% 
% output:
%       q - Valore della soluzione numerica q
function [q] = midpoint(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) * f((a + b) / 2);

end