function [polystats] = esercizio4()
    % Inizializzazione
    f = @(x) 2 * sin(x) .* cos(x) ./ (1 + x.^2);
    x = linspace(0, 2, 10);

    % Punto 1
    p = polyfit(x, f(x), size(x, 2) - 1);
    z = linspace(0, 2);
    E = max(f(z) - polyval(p, z));

    % Punto 2
    dp = polyder(p);
    hold on
    plot(z, f(z), "black");
    plot(z, polyval(p, z), 'g--');
    plot(z, polyval(dp, z), 'r');

    polystats = roots(dp);
    polystats = polystats(polystats <= 2 & polystats >= 0 & imag(polystats) == 0);

    scatter(polystats, polyval(dp, polystats), 'red');
end