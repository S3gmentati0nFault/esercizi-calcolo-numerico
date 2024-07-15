% Dal foglio 2
function [] = esercizio11()
    % Inizializzazione
    f = @(x) sin(x + exp(x)) - (7/12);
    a = 0;
    b = 0;
    format short e;

    % Punto 1 - radice di f
    x0 = 1;
    toll = 1e-6;
    maxit = 200;
    df = @(x) (1 + exp(x)) .* cos(x + exp(x));

    [x,nit] = newton(f,df,x0,toll,maxit)

    % Punto 2 - punto di massimo
    hold on
    z = linspace(0, 1, 1000);
    plot(z, df(z), "DisplayName", "df(x)");
    xmax = fzero(df, 0.5)
    fmax = f(xmax)

    % Punto 3 - grafico
    plot(z, f(z), "DisplayName", "f(x)");
    scatter(xmax, f(xmax), "DisplayName", "fmax");
    scatter(xmax, df(xmax), "DisplayName", "df = 0");
    legend;

    % Punto 4 -
    h = [0.1, 0.01];
    for i=1:2
        z = 0:h(i):1;
        s1 = griddedInterpolant(z, f(z), "linear");
        smax = s1(xmax)
        err = abs(fmax - smax)
    end
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