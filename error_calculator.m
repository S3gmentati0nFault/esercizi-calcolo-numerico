% CALCOLATORE PER L'ERRORE ASSOLUTO E RELATIVO
% 
% input:
%       value - Valore approssimato
%       actual_value - Valore corretto
% 
% output:
%       ae - Errore assoluto (Absolute Error)
%       re - Errore relativo (Relative Error)
function [ae, re] = error_calculator(value, actual_value)

arguments
    value (1,1) double {mustBeNonmissing}
    actual_value (1,1) double {mustBeNonmissing}
end

    ae = abs(value - actual_value);

    re = abs(value - actual_value) / abs(actual_value);

end