% FORMULA DI INTEGRAZIONE NUMERICA DEL TRAPEZIO
% 
% input:
%       f - Funzione integranda
%       a - Inizio dell'intervallo di integrazione
%       b - Termine dell'intervallo di integrazione
% 
% output:
%       q - Valore della soluzione numerica q
function [q] = trapezoid(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) / 2 * (f(a) + f(b));

end