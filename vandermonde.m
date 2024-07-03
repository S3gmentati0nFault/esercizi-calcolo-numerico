function [] = vandermonde(size, DEBUG)
    size = str2num(size);
    DEBUG = str2num(DEBUG);

    % Controllo dell'input
    if (size < 0)
        disp("<ERR>     La dimensione dell'insieme dei punti è minore di 1");
        return;
    end

    % Generazione di punti casuali
    point_gen_start = tic;
    x = linspace(0, size^2, size);
    y = 10 * rand(1)^2 * pi / 2 * 5 + (sin(x.^2) + cos(x) -cos(-x) + cos(x.^2.+pi));
    point_gen_time = toc(point_gen_start);
    disp("<INF> La generazione dell'insieme dei punti ha richiesto: " + point_gen_time + " secondi");
    if (DEBUG)
        plot(x, y, 'o');
    end

    M = zeros(size, size - 1);
    % Costruzione della matrice di riferimento
    matrix_gen_start = tic;
    for i = 1:size - 1
        M(1:size, i) = (x.^(i))';
    end
    M = [ones(size, 1) M];
    matrix_gen_time = toc(matrix_gen_start);
    disp("<INF> La costruzione della matrice ha richiesto: " + matrix_gen_time + " secondi");
    if (DEBUG)
        disp(M);
    end

    % Controlla se possibile fare fattorizzazione con Cholesky
    if (check_cholesky(M))
        R = chol(M);
        chol_start = tic;
        temp = R' \ y;
        sol = R \ temp;
        chol_time = toc(chol_start);
        disp("<INF> La riduzione tramite Cholesky ha richiesto: " + chol_time + " secondi");
    else
        lu_start = tic;
        [L, U, P] = lu(M);
        temp = L \ P * y';
        sol = U \ temp;
        lu_time = toc(lu_start);
        disp("<INF> La riduzione LU ha richiesto: " + lu_time + " secondi");
    end

    if (DEBUG)
        disp(sol);
    end

    start = min(x);
    finish = max(x);
    dim = ceil((finish - start)) * 5;
    points = linspace(start, finish, dim);
    interpolated_points = zeros(1, dim);
    for i = 1:dim
        interpolated_points(i) = polynomial_interpretation(sol, points(i), size);
    end
    
    polyfit_start = tic;
    sol = (flip(polyfit(x, y, size - 1)))';
    polyfit_time = toc(polyfit_start);
    disp("<INF> La polyfit ha richiesto: " + polyfit_time + " secondi");
    re_interpolated_points = zeros(1, dim);
    for i = 1:dim
        re_interpolated_points(i) = polynomial_interpretation(sol, points(i), size);
    end

    plot(x, y, 'o', points, interpolated_points, 'r', points, re_interpolated_points, '--b');
end

function value = polynomial_interpretation(coefficients, x, size)
    value = sum((x .* ones(1, size)).^(0:size - 1) .* coefficients');
end


function choleskable = check_cholesky(M)
    % Controlla se la matrice è simmetrica e definita positiva
    matrix_check_start = tic;
    if (~issymmetric(M))
        disp("<ERR>     La matrice generata non è simmetrica e quindi non è possibile applicare Cholesky");
        choleskable = 0;
        return;
    end
    eigenvalues = eig(M);
    
    if (DEBUG)
        disp(eigenvalues);
    end
    
    if (~all(eigenvalues > 0))
        disp("<ERR>     Siccome c'è un autovalore che non è positivo allora la matrice non è def. positiva");
        choleskable = 0;
        return;
    end
    matrix_check_time = toc(matrix_check_start);
    disp("<INF> Il controllo della matrice ha richiesto: " + matrix_check_time + " secondi");
    choleskable = 1;
end
