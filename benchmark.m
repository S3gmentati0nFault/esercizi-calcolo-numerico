DEBUG = false;

size = input("Definire la dimensione della matrice: ");

% Controllo dell'input
if (size < 0)
    disp("Errore, dimensione minore di 0");
    return;
end

% Costruzione della matrice A
support = ones(1, size);
A = diag(support * 5) - diag(support(1:(size - 1)) * 2, 1) - diag(support(1:(size - 1)) * 2, -1);
if (DEBUG)
    A
end

% Costruzione della matrice di identità
id = eye(size);

% Benchmark della tecnica di risoluzione Gaussiana
mec_start = tic;
[L, U, P] = lu(A);
for i = 1:size
    e_i  = (id(i, 1:size))';
    mec_solution = L \ P * e_i;
end
elapsed_time = toc(mec_start);
disp("La soluzione di un sistema tridiagonale di dimensione " + size + ...
    " è " + elapsed_time + " seconds");