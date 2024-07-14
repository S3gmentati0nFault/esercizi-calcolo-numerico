function [E, Eck] = esercizio6()
    % Inizializzazione
    g = @(x) x.^2 ./ (1 + x.^2);
    a = -4;
    b = 4;

    % Punto 1
    % Si calcoli il polinomio p di grado n = 10 che interpola g in nodi 
    % equispaziati nell’intervallo assegnato. Disegnare il grafico di f , p 
    % e dei nodi usati per l’interpolazione segnandoli con un cerchietto. 
    % Sia inotre z il vettore di 100 punti equispaziati in [−4, 4], si 
    % calcoli l’errore E = maxzi |f (zi) − p(zi)|
    xint = linspace(a, b, 11);
    coeff = polyfit(xint, g(xint), 10);
    hold on
    x = linspace(a, b, 10000);
    plot(x, g(x), "black", "LineStyle", "--", "DisplayName", "g");
    scatter(xint, polyval(coeff, xint), "DisplayName", "pint\_linspace");
    plot(x, polyval(coeff, x), "DisplayName", "polynspace");

    z = linspace(a, b);
    E = max(abs(g(z) - polyval(coeff, z)));

    % Punto 2
    % Si considerino n + 1 nodi di Chebyshev nell’intervallo [−4, 4] 
    % definiti da: ck = 4 ∗ cos π(2k − 1) 2(n + 1) k = 1, 2, ..., n + 1 e 
    % si ripeta quanto richiesto al punto precedente interpolando g nei 
    % nodi di Chebyshev indicati
    n = 11;
    k = 0:11;
    ck = 4 * cos((pi*((2 * k) - 1)) / (2 * n));
    coeff = polyfit(ck, g(ck), 10);
    scatter(ck, polyval(coeff, ck), 'green', "DisplayName", "pint\_chebychev");
    plot(x, polyval(coeff, x), "Color", "blue", "DisplayName", "polychev");
    legend

    Eck = max(abs(g(z) - polyval(coeff, z)));
end