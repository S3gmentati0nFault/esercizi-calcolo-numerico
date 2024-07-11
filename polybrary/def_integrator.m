% CALCOLATRICE PER INTEGRALI
% 
% input:
%       poly - coefficienti del polinomio
%       a - inizio dell'intervallo di integrazione
%       b - fine dell'intervallo di integrazione
% 
% output:
%       integral - risultato del processo di integrazione
function [integral] = def_integrator(poly, a, b)

arguments
    poly (1,:) double {mustBeNonmissing}
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end
    P = polyint(poly);

    Pa = polyval(P, a);
    Pb = polyval(P, b);

    integral = Pb - Pa;
end