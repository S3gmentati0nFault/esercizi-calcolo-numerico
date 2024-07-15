% Dal foglio 2
function [] = esercizio10()
    % Inizializzazione
    f = @(t, y) - y + exp(-t) .* cos(t - pi/2);
    y0 = -1;
    a = 0;
    b = 1;
    t = a:0.01:b;
    y = @(t) exp(-t) .* sin(t - pi/2);

    % Punto 1 - approssimazione con eulero implicito
    dfy = @(t, y) -1;
    toll = 1e-4;
    nitmax = 200;

    [T, Y] = eulimp(f, t, y0, dfy, toll, nitmax)

    % Punto 2 - errore della soluzione approssimata
    n = norm(y(T) - Y, inf)

    % Punto 3 - intersezione tra retta e soluzione di cauchy
    p = @(t) y(t) + t;
    r = @(t) -t;
    x0 = fzero(p, 0.5)
    % Plot addizionale per chiarimento
    % z = linspace(0, 1, 1000);
    % hold on;
    % plot(z, y(z));
    % plot(z, r(z));
    % scatter(x0, r(x0));

    % Punto 4 - calcolo dell'integrale ed errore di approssimazione per la
    % formula di CS
    m = 4;
    Ics = simpsc(a,b,m,y);
    I = integral(y, a, b);
    E = abs(I - Ics)
end


function [T,Y] = eulimp(f,T,y0,dfy,toll,nitmax)
% Eulero Implicito associato a Newton per un' ODE
%
% Parametri di ingresso:
% f         stringa che contiene il nome di una funzione F(t,y) con t e y scalari
% T         vettore riga di tipo [t0:h:tmax] che contiene gli istanti di approssimazione 
% y0        valore iniziale
% dfy       derivata di f rispetto a y
% toll      tolleranza per l'arresto di Newton (potremmo dover risolvere
%           un'equazione non lineare in u_n+1)
% nitmax    massimo numero di iterazioni di Newton
%
% Parametri di uscita:
% T   vettore colonna che contiene gli istanti di approssimazione
% Y   vettore colonna che contiene il valore della soluzione al tempo contenuto
%     nella stessa riga di T
%
if nargin==4
    toll=1e-6;
    nitmax=20;
elseif nargin==5
    nitmax=20;
end
%
h=T(2)-T(1);
Y=y0;
%
for n=1:length(T)-1
	err=toll+1;
	nit=0;
	y=Y(n);
	while (nit<nitmax & err>toll)
		nit=nit+1;
		yp=y-(y-Y(n)-h*f(T(n+1),y))/(1-h*dfy(T(n+1),y));
		err=abs(yp-y);
		y=yp;
	end
	if nit==nitmax & err>toll
      	  disp('non converge nel numero di iterazioni assegnato')
	  disp(['per t= ',num2str(T(n))])	
	end
	Y(n+1)=yp;
end          
T=T(:);
Y=Y(:);
% *************************************************
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