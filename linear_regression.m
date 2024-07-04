function [linear_coefficients] = linear_regression(N, DEBUG)
    N = str2double(N);
    DEBUG = str2double(DEBUG);
    data_dim = 1000;

    if (N < 0)
        linear_coefficients = nan(1, 2);
        return;
    end

    % Generazione casuale dei punti
    point_gen_start = tic;
    x=rand(1,N)*data_dim;
    y=rand(1,N)*data_dim;
    point_gen_time = toc(point_gen_start);
    disp("<INF> L'operazione di generazione dei punti ha richiesto: " + point_gen_time + " secondi");
    
    if (DEBUG)
        scatter(x,y)
    end

    % Costruzione della matrice del sistema
    matrix_const_start = tic;
    M = [N, sum(x); sum(x), sum(x.^2)];
    b = [sum(y); sum(x .* y)];
    if (DEBUG)
        disp(M);
        disp(b);
    end
    matrix_const_time = toc(matrix_const_start);
    disp("<INF> L'operazione di costruzione della matrice ha richiesto: " + matrix_const_time + " secondi");
    
    % Risoluzione del sistema tramite fattorizzazione LU
    lu_start = tic;
    [L, U, P] = lu(M);
    T = L \ P * b;
    sol = U \ T;
    lu_time = toc(lu_start);
    if (DEBUG)
        disp(sol);
    end
    disp("<INF> La fattorizzazione LU ha richiesto: " + lu_time + " secondi");
    linear_coefficients = sol;

    % Plot della soluzione trovata
    if (DEBUG)
        line = @(x) sol(1) + x * sol(2);
        line_y = zeros(1, data_dim);
        for i=1:data_dim
            line_y(i) = line(i);
        end
        plot(1:data_dim, line_y, 'r');
        hold on
        plot(x, y, 'o');
        hold off
    end
    return;
end