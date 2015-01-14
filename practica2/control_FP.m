close all;
clear all;

global ek be0 be1 be2 au1 au2 be01 be012 au12

ukt = numerictype(1, 17, 15);
ekt = numerictype(1, 17, 15);
be0t = numerictype(1, 18, 9);
be1t = numerictype(1, 18, 8);
be2t = numerictype(1, 18, 9);
au1t = numerictype(1, 20, 10);
au2t = numerictype(1, 20, 12);
be01t = numerictype(1, 18, 9);
be012t = numerictype(1, 24, 16);
au12t = numerictype(1, 17, 7);

uka = [];
eka = [];
be0a = [];
be1a = [];
be2a = [];
au1a = [];
au2a = [];
be01a = [];
be012a = [];
au12a = [];

%Planta (motor dc POSICIÓN)
G=tf(52.1,[1.21 1 0]);

%Controlador
C=tf([0.525 5.022 4.4],[0.005 1 0]);

%Periodo de muestreo seleccionado
T2 = 1.84E-3;

%Discretizamos el controlador
C_discrete=c2d(C,T2,'tustin');

%Discretizamos también la planta para simular
G_discrete=c2d(G,T2,'zoh');

% Parámetros para la simulación
pasos=500;
tiempo = pasos*T2; %Simulamos 1 segundo
setpoints = [1*ones(pasos/2,1);-1*ones(pasos/2,1)];

%Condiciones iniciales
uk=0;
yk=0;

%Simulamos el sistema
%Reservamos memoria para los vectores de los graficos
ykg=zeros(pasos,1);
ekg=zeros(pasos,1);
ukg=zeros(pasos,1);

%Definimos escopes para la visualización de rangos
scope0 = NumericTypeScope;
scope1 = NumericTypeScope;
scope2 = NumericTypeScope;
scope3 = NumericTypeScope;
scope4 = NumericTypeScope;
scope5 = NumericTypeScope;
scope6 = NumericTypeScope;
scope7 = NumericTypeScope;
scope8 = NumericTypeScope;
scope9 = NumericTypeScope;

for k=1:pasos
    %Llamamos a la función que simula el comportamiento de la planta
    yk = planta(uk, G_discrete);
    %Llamamos a la función que simula el comportamiento del controlador
    uk = controlador_FP(yk, setpoints(k), C_discrete);
    
    step(scope9,au12);
    step(scope0,ek);
    step(scope1,be0);
    step(scope2,be1);
    step(scope3,be2);
    step(scope4,au1);
    step(scope5,au2);
    step(scope6,be01);
    step(scope7,be012);
    step(scope8,au12);
    
    uka(end+1) = uk;
    eka(end+1) = ek;
    be0a(end+1) = be0;
    be1a(end+1) = be1;
    be2a(end+1) = be2;
    au1a(end+1) = au1;
    au2a(end+1) = au2;
    be01a(end+1) = be01;
    be012a(end+1) = be012;
    au12a(end+1) = au12;
    

    %Para graficar
    ykg(k)=yk;
    ekg(k)=ek;
    ukg(k)=uk;
    
end;

figure(1)
subplot(311)
plot(1:pasos,setpoints,1:pasos,ykg(1:pasos,1));
title('consigna y posición motor (yk)')
subplot(312)
plot(1:pasos,ukg(1:pasos,1));
title('señal de control (uk)')
subplot(313)
plot(1:pasos,ekg(1:pasos,1));
title('error (ek)')
