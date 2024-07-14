function [] = integral_approximation(f, F, m, a, b)

arguments
    f {mustBeNonmissing}
    F (1,1) double {mustBeNonmissing}
    m (1,1) double {mustBeNonmissing}
    a (1,1) double {mustBeNonmissing}
    b (1,1) double {mustBeNonmissing}
end

    % Hsq = ((b - a) / m)^2;
    Hfrth = ((b - a) / m)^4;

    % x = linspace(a, b, m);
    % y = f(x);

    % q = pmedc(a, b, m, f);
    q = simpsc(a, b, m, f);

    [ae, re] = error_calculator(F, q);

    % disp("H^2: " + Hsq);
    disp("H^4: " + Hfrth);
    disp("Errore assoluto: " + ae);
    disp("Errore relativo: " + re);

end

function int = pmedc(a,b,m,f)
%
%        Formula del punto medio composita
%        int = pmedc(a,b,m,fun)
%        a,b = estremi integrazione
%        m = numero sottointervalli
%            (m=1 formula semplice)
%        f = nome function per la 
%              funzione integranda
%
%
%        COPIATA DAL SITO DEL CORSO
x=linspace(a,b,m+1);
H=(b-a)/m;
int=H*sum(f(x(1:end-1)+H/2));
end

function int = simpsc(a,b,m,f)
%
%        Formula di Cavalieri-Simpson composita
%        
%        int = simpsc(a,b,m,f)
%        a,b = estremi integrazione
%        m = numero sottointervalli
%            (m=1 formula semplice)
%        f = nome function per la 
%              funzione integranda
% 
%        COPIATA DAL SITO DEL CORSO
x=linspace(a,b,m+1);
H=(b-a)/m;
int=H/6*(f(a)+f(b)+2*sum(f(x(2:end-1)))+4*sum(f(x(1:end-1)+H/2)));
end