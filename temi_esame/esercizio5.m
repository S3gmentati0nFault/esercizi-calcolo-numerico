function [p, sol] = esercizio5()
    % inizializzazione
    d = 2 / 3;
    f = @(t) d * log(d * t);
    a = exp(1) / d;
    b = exp(1) / d + 1;
    x = linspace(a, b, 10);
    y = f(x);

    % Punto 1
    p = polyfit(x, y, 1);

    % Punto 2
    xm = sum(x) * 1 / 10;
    ym = polyval(p, xm);

    % Punto 3
    M = [x' ones(size(x, 2), 1)];
    Mt = M';
    A = Mt * M;
    b = Mt * y';
    sol = A \ b;
end