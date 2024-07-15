% Dal foglio 2
function [x, nit, E, r] = esercizio9()
    % Inizializzazione
    f = @(x) cos(exp(x) + x.^2);

    % Punto 1 - Approssimazione degli zeri
    a = 0;
    b = pi/3;
    toll = 1e-8;
    nitmax = 200;
    x0 = 0;
    df = @(x) - (exp(x) + 2 * x) .* sin(exp(x) + x.^2);

    format short e;
    
    [x, nit] = newton(f, df, x0, toll, nitmax);

    % Punto 2 - Interpolazione polinomiale
    x = linspace(a, b, 6);
    p = polyfit(x, f(x), size(x, 2) - 1);
    
    z = linspace(a, b, 500);
    E = norm(f(z) - polyval(p, z), inf);
    
    r = roots(p);
    r = r(imag(r) == 0 & real(r) >= 0 & real(r) <= pi/3);
end


function [x,nit]=newton(f,df,x0,toll,nitmax)
%input:     f       funzione definita con @
%           df      derivata di f definita con inline
%           x0      valore iniziale
%           toll    precisione
%           nitmax  numero massimo iterazioni consentite
%output:    x       soluzione approssimata
%           nit     iterazioni effettuate
% FUNZIONE PRESA DAL SITO DEL CORSO
nit=0;
err=1+toll;
while nit<nitmax & err>toll
    x=x0-f(x0)/df(x0);
    err=abs(x-x0);
    nit=nit+1;
	x0=x;
end
if nit==nitmax & err>toll
        disp('non converge nel numero di iterazioni assegnato');
      return
end
end