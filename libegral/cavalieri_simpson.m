% FORMULA DI INTEGRAZIONE NUMERICA DI CAVALIERI SIMPSON
% 
% input:
%       f - Funzione integranda
%       a - Inizio dell'intervallo di integrazione
%       b - Termine dell'intervallo di integrazione
% 
% output:
%       abs_err - Errore assoluto
%       rel_err - Errore relativo
%       q - Valore della soluzione numerica q
function [q] = cavalieri_simpson(f, a, b)

arguments
    f
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b));

end