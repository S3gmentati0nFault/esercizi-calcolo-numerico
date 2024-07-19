% VALUTATORE DI EQUAZIONI DIFFERENZIALI GENERICO
% 
% input:
%       df - Funzione associata all'equazione differenziale
%       y - Soluzione esatta dell'equazione differenziale
%       I - Intervallo di risoluzione per l'equazione differenziale
%       y0 - Soluzione di partenza
% 
% output:
%       n - Norma infinito dell'errore assoluto tra la soluzione esatta e
%       qella approssimata
%       u - Soluzione approssimata dell'equazione differenziale
%       t - Punti campionati all'interno dell'intervallo I
function [n, u, t] = ode_evaluator(df, y, I, y0)
    [t, u] = ode45(df, I, y0);
    
    hold on
    plot(t, u, 'r');
    plot(t, y(t), 'g');

    err = t - u;
    n = norm(err, inf);
end