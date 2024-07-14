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
