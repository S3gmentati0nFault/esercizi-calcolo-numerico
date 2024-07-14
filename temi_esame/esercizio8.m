function [E, x, nit] = esercizio8()
    % Inizializzazione
    d = 7/8;
    t0 = exp(1)/d;
    tmax = t0 + 1;
    ye = @(t)d * log(d * t);
    f = @(t, y) d.^2 * exp(-y/d);

    % Punto 1 - soluzione di Heun e grafico
    t = t0:0.02:tmax;
    y0 = d;
    [T, Y] = heun(f, t, y0);
    hold on;
    plot(T, Y, "DisplayName", "appr");
    plot(T, ye(T), "DisplayName", "sol");
    legend;

    % Punto 2 - errore
    E = ye(T) - Y;
    E = norm(E, inf);

    % Punto 3 - bisezione
    toll = 1e-5;
    a = 0.5;
    b = t0;
    [x, nit] = bisezione(ye, a, b, toll);
end


function  [T,Y] =heun(f,T,y0)
% 	 [T,Y] = heun(f,T,y0)
%
% Heun  - passo fisso
%
% Parametri di ingresso:
% f   stringa che contiene il nome di una funzione F(t,y) con t e y scalari
% T   vettore riga di tipo [t0:h:tmax] che contiene gli istanti di approssimazione 
% y0   valore iniziale
%
% Parametri di uscita:
% T   vettore colonna che contiene gli istanti di approssimazione
% Y   vettore colonna che contiene il valore della soluzione al tempo contenuto
%     nella stessa riga di T
%
h=T(2)-T(1);
hm=h/2;
Y=y0;
%
for n=1:length(T)-1
   K1=f(T(n),Y(n));
   K2=f(T(n+1),Y(n)+h*K1);
   Y(n+1)=Y(n)+hm*(K1+K2);
end
%
T=T(:);
Y=Y';
end


function [x,nit]=bisezione(f,a,b,toll)
%input:     f       funzione definita con @
%           a, b    estremi intervallo tali che f(a)*f(b)<0
%           toll    precisione
%output:    x       soluzione approssimata
%           nit     iterazioni effettuate
%
% FUNZIONE PRESA DAL SITO DEL CORSO

fa=f(a);
fb=f(b);
if fa*fb >= 0
    nit=0;
	disp('intervallo non accettabile')
    x=[];
	return
end
err=(b-a)/2;
x=(a+b)/2; 
nit=1;
while err>toll
    fx=f(x);
    if fx==0
        return;
    end
	if fx*fa<0;
        	b=x;
            fb=fx;
	else
	        a=x;
            fa=fx;
    end
    x=(a+b)/2;
    err=err/2;
    nit=nit+1;
end
end