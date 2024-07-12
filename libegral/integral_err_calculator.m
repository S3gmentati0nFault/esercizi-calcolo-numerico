% CALCOLATORE DELL'ERRORE RELATIVO E ASSOLUTO PER LA FUNZIONE INTEGRAL
% 
% input:
%       f - Funzione integranda
%       F - Valore esatto dell'integrale definito
%       a - Inizio dell'intervallo di integrazione
%       b - Termine dell'intervallo di integrazione
% 
% output:
%       abs_err - Errore assoluto
%       rel_err - Errore relativo
%       q - Valore della soluzione numerica q
function [abs_err, rel_err, q] = integral_err_calculator(f, F, a, b)

arguments
    f {mustBeNonmissing}
    F (1,1) double {mustBeNonmissing}
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    q = integral(f, a, b);

    abs_err = abs(q - F);

    rel_err = abs(q - F) / abs(F);

end