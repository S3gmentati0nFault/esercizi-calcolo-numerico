function [] = spline(DEBUG, precision)
    DEBUG = str2double(DEBUG);
    p = (100 * str2double(precision)/ 500) * 1000;
    func = @(x) (abs(sin(x)).^(3/2)) + cos(x);

    x = linspace(-10, +10, 1000);
    y = func(x);

    plot(x, y, "LineWidth", 5);
    hold on;

    x_spline = linspace(-10, +10, p);
    y_spline = func(x_spline);

    scatter(x_spline, y_spline, "Color", "red", "LineWidth", 3);
    
    for i=1:size(x_spline, 2) - 1
        coefficients = linearRegression([x_spline(i), x_spline(i + 1)], ...
            [y_spline(i), y_spline(i + 1)], DEBUG);
        linear_x = linspace(x_spline(i), x_spline(i + 1), 10);
        linear_y = coefficients(1) + coefficients(2) .* linear_x;
        plot(linear_x, linear_y, "Color", "#EDB120", "LineWidth", 1.5);
    end
    hold off;
end

function coefficients = linearRegression(x, y, DEBUG)
    % Costruzione della matrice del sistema
    M = [2, sum(x); sum(x), sum(x.^2)];
    b = [sum(y); sum(x .* y)];
    if (DEBUG)
        disp(M);
        disp(b);
    end
    
    % Risoluzione del sistema tramite fattorizzazione LU
    [L, U, P] = lu(M);
    T = L \ P * b;
    sol = U \ T;
    if (DEBUG)
        disp(sol);
    end
    coefficients = sol;
end