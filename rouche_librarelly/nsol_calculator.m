% CALCOLATORE DEL NUMERO DI SOLUZIONI PER UN SISTEMA LINEARE
% 
% input:
%       M - Matrice 2d generica
%       b - Vettore dei termini noti
% 
% output:
%       nsol - Numero di soluzioni associate al sistema Ax = b
function [nsol] = nsol_calculator(M, b)

arguments
    M (:,:) double {mustBeNonmissing}
    b (:,1) double {mustBeNonmissing}
end

    % Applicazione del teorema di Cramer
    dM = det(M);

    if (dM ~= 0)
        disp("Il sistema ammette una e una sola soluzione");
        nsol = 1;
        return;
    end

    % Applicazione del teorema di Rouche-Capelli
    rM = rank(M);
    rMb = rank([M b]);

    if (rM ~= rMb)
        disp("Il sistema non ammette soluzioni");
        nsol = 0;
        return;
    elseif (rM == size(M, 2))
        disp("Il sistema ammette una e una sola soluzione");
        nsol = 1;
        return;
    else
        disp("Il sistema ammette infinite soluzioni");
        nsol = inf;
        return;
    end
end