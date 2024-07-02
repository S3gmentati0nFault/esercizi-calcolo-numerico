% FATTORIZZAZIONE DI CHOLESKY

function [] = cholesky(autosymmetric, DEBUG)
autosymmetric = str2num(autosymmetric);
DEBUG = str2num(DEBUG);

if (~DEBUG)
    size = input("Dimensione della matrice: ");
else
    size = 5;
end

if(size < 0)
    disp("La dimensione è minore di 0!");
    return;
end

M = zeros(size);
% Genera la matrice e il vettore dei termini noti
matrix_gen_start = tic;
if (autosymmetric == 1)
    M = rand(size);
    M = floor(100 * M);
    M = floor(M);
    M = M * M';
elseif (autosymmetric == 0)
    M = rand(size);
end
b = floor(100 * rand(size, 1));
matrix_gen_time = toc(matrix_gen_start);
disp("Tempo di generazione della matrice: " + matrix_gen_time + " secondi");

if (DEBUG)
    disp(M);
end

% Controlla se la matrice è simmetrica e definita positiva
matrix_check_start = tic;
if (~issymmetric(M))
    disp("La matrice generata non è simmetrica e quindi non è possibile applicare Cholesky");
    return;
end
eigenvalues = eig(M);

if (DEBUG)
    disp(eigenvalues);
end

if (~all(eigenvalues > 0))
    disp("Siccome c'è un autovalore che non è positivo allora la matrice non è def. positiva");
    return;
end
matrix_check_time = toc(matrix_check_start);
disp("Il controllo della matrice ha richiesto: " + matrix_check_time + " secondi");

% Applicazione della fattorizzazione di Cholesky
cholesky_factorization_start = tic;
R = chol(M);
y = R' \ b;
x = R \ y;
cholesky_factorization_time = toc(cholesky_factorization_start);
disp("La risoluzione del sistema costruito ha richiesto: " + cholesky_factorization_time + " secondi");
end