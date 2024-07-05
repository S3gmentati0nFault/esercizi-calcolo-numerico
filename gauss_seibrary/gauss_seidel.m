% sol - Soluzione del metodo di Gauss
function [sol] = gauss_seidel(M, x, b, epsilon, nitmax, test_type)

arguments
    % Matrice 2d generica
    M (:,:) double {mustBeFloat}

    % Punto di partenza per l'esecuzione del metodo
    x (:,1) double

    % Vettore dei termini noti
    b (:, 1) double

    % Errore accettabile
    epsilon (1,1) double {mustBeScalarOrEmpty}

    % Numero massimo di iterazioni
    nitmax (1,1) double {mustBeScalarOrEmpty}

    % Tipo di test
    test_type (1, 1) string {mustBeTextScalar}
end

    if (test_type ~= "inc" && test_type ~= "res")
        test_type = "inc";
    end

    [D, L, U, B] = decompositor("gauss", M);

    for i=1:nitmax
        x_next = (D - L) \ (b + U * x);
        
        % Condizione di iterazione
        if (max(norm(b - M * x) / norm(b), norm(x_next - x) / norm(x)) < epsilon)
            disp("<INF> Il metodo di iterazione è terminato con la " + i + "-esima iterazione");
            sol = x_next;
            return;
        end
        
        x = x_next;
    end

    disp("<INF> Siamo andati fuori dal numero massmo di iterazioni");
    sol = x;
end