
function u = controlador_FP(yk, setpoints, C)

%Simula el cálculo de la señal de control del controlador C en tiempo
%discreto. Implementación directa.

global ek be0 be1 be2 au1 au2 be01 be012 au12
global ykt ekt be0t be1t be2t au1t au2t be01t be012t au12t ukt
global a1t a2t b0t b1t b2t

as = C.den{1,1};
bs = C.num{1,1};

%Parámetros del controlador
a1 = fi(as(2),a1t);
a2 = fi(as(3),a2t);
b0 = fi(bs(1),b0t);
b1 = fi(bs(2),b1t);
b2 = fi(bs(3),b2t);

yk = fi(yk, ykt)

% u(k)=b0.e(k)+b1*e(k-1)+b2*e(k-2)-a1*u(k-1)-a2*u(k-2);

%Registros
persistent ek1 ek2 uk1 uk2

%Inicializamos los registros (reset)
if isempty (ek1)
    ek1=fi(0,ekt);
end
if isempty (ek2)
    ek2=fi(0,ekt);
end
if isempty (uk1)
    uk1=fi(0,ukt);
end
if isempty (uk2)
    uk2=fi(0,ukt);
end

%Realimentación
ek = fi(setpoints - yk,ekt);

%Cálculo de la señal de control
be0 = fi(b0*ek, be0t);
be1 = fi(b1*ek1, be1t);
be2 = fi(b2*ek2, be2t);
au1 = fi(a1*uk1, au1t);
au2 = fi(a2*uk2, au2t);

be01 = fi(be0+be1, be01t);
be012 = fi(be01+be2, be012t);
au12 = fi(au1+au2, au12t);
u = fi(be012 - au12, ukt);

%Actualizamos los registros
ek2=ek1;
ek1=ek;
uk2=uk1;
uk1=u;

