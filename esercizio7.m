% Dal foglio 2
function [n, E] = esercizio7()
    % Inizializzazione
    ye = @(t) 10 * exp(-t) .* (sin(t) - 1);
    f = @(t, y) (10 * exp(-t) .* cos(t)) - y;
    y0 = -10;
    
    % Punto 1 - approssimazione con eulexp
    t = 0:0.001:1;
    h = 0.001;
    [T, Y] = eulero(f, t, y0);

    % Punto 2 - grafico
    hold on;
    plot(T, Y);
    plot(T, ye(T));

    % Punto 3 - errore in norma infinito
    E = ye(T) - Y;
    n = norm(E, inf);

    % Punto 4 - integrazione numerica
    It = trapz(T, Y);
    I = integral(ye, 0, 1);
    E = abs(I - It);
end


function  [T,Y]=eulero(f,T,y0)
% 	 [T,Y] = eulero(f,T,y0)
%
%   Eulero Esplicito 
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
Y=y0;
%
for n=1:length(T)-1
   Y(n+1)=Y(n)+h*f(T(n),Y(n));
end
%
T=T(:);
Y=Y';
end