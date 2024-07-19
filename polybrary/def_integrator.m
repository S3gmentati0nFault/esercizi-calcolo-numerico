% CALCOLATRICE PER INTEGRALI DI POLINOMI
% 
% input:
%       poly - Coefficienti del polinomio
%       a - Inizio dell'intervallo di integrazione
%       b - Fine dell'intervallo di integrazione
% 
% output:
%       integral - Risultato del processo di integrazione
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