function y = planta(uk, G)

%Simula el comportamiento de la planta G (LTI) en tiempo discreto

as = G.den{1,1};
bs = G.num{1,1};

%Parámetros de la planta
%a0 = as(1);
a1 = as(2);
a2 = as(3);
b0 = bs(1);
b1 = bs(2);
b2 = bs(3);

% y(k)=b0.u(k)+b1*u(k-1)+b2*u(k-2)-a1*y(k-1)-a2*y(k-2);

%Registros
persistent uk1 uk2 yk1 yk2

%Inicializamos los registros
if isempty (yk1)
    yk1=0;
end
if isempty (yk2)
    yk2=0;
end
if isempty (uk1)
    uk1=0;
end
if isempty (uk2)
    uk2=0;
end

%Cálculo de la salida de la planta
bu0 = b0*uk;
bu1 = b1*uk1;
bu2 = b2*uk2;
ay1 = a1*yk1;
ay2 = a2*yk2;

bu01 = bu0+bu1;
bu012 = bu01+bu2;
ay12 = ay1+ay2;
y = bu012 - ay12;

%Actualizamos los registros
yk2=yk1;
yk1=y;
uk2=uk1;
uk1=uk;

