function [I] = esercizio3()
    % Inizializzazione
    t = 0:10:70;
    c = [41.4 36.3 22.2 19.89 12.1 6.9 4.5 0.3];

    % Punto 1
    % Si calcoli la retta di regressione r che approssima i dati nel senso 
    % dei minimi quadrati ed il polinomio p che interpola gli stessi dati. 
    % Si disegni il graﬁco delle funzioni approssimanti calcolate e dei 
    % dati.
    cr = polyfit(t, c, 1);
    cp = polyfit(t, c, size(c, 2) - 1);
    x = linspace(0, 70, 1000);
    hold on
    scatter(t, c, "red");
    plot(x, polyval(cr, x), "Color", "green");
    plot(x, polyval(cp, x), "Color", "blue");

    % Punto 2
    % Si utilizzino le due approssimanti calcolate per stimare la 
    % concentrazione di erbicida nel terreno trattato dopo due mesi esatti 
    % ovvero al tempo t=62.
    scatter(62, polyval(cr, 62), "green");
    scatter(62, polyval(cp, 62), "blue");

    % Punto 3
    sr = sum(abs(c - polyval(cr, t)).^2);
    % Mi aspetto che lo scarto quadratico medio per il polinomio risulti
    % essere nullo (o quasi) in quanto i punti della concentrazione fanno 
    % parte della funzione polinomiale.
    sp = sum(abs(c - polyval(cp, t)).^2);

    % Punto 4
    Cp = polyint(cp);
    I = polyval(Cp, 70) - polyval(Cp, 0);
end