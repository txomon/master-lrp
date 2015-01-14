
function u = controlador(yk, setpoints, C)

%Simula el cálculo de la señal de control del controlador C en tiempo
%discreto. Implementación directa.

global ek be0 be1 be2 au1 au2 be01 be012 au12

as = C.den{1,1};
bs = C.num{1,1};

%Parámetros del controlador
a1 = as(2);
a2 = as(3);
b0 = bs(1);
b1 = bs(2);
b2 = bs(3);


% u(k)=b0.e(k)+b1*e(k-1)+b2*e(k-2)-a1*u(k-1)-a2*u(k-2);

%Registros
persistent ek1 ek2 uk1 uk2

%Inicializamos los registros (reset)
if isempty (ek1)
    ek1=0;
end
if isempty (ek2)
    ek2=0;
end
if isempty (uk1)
    uk1=0;
end
if isempty (uk2)
    uk2=0;
end

%Realimentación
ek = setpoints - yk;

%Cálculo de la señal de control
be0 = b0*ek;
be1 = b1*ek1;
be2 = b2*ek2;
au1 = a1*uk1;
au2 = a2*uk2;

be01 = be0+be1;
be012 = be01+be2;
au12 = au1+au2;
u = be012 - au12;

%Actualizamos los registros
ek2=ek1;
ek1=ek;
uk2=uk1;
uk1=u;

