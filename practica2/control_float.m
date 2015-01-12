close all;
clear all;

global ek

%Planta (motor dc POSICIÓN)
G=tf(52.1,[1.21 1 0]);
%Controlador
C=tf([0.525 5.022 4.4],[0.005 1 0]);

%Periodo de muestreo seleccionado
T2 = 1.84E-3;

%Discretizamos el controlador
C_discrete=c2d(C,T2,'tust');

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

for k=1:pasos
    %Llamamos a la función que simula e lcomportamiento de la planta
    yk = planta(uk, G_discrete);
    %Llamamos a la función que simula el comportamiento del controlador
    uk = controlador(yk, setpoints(k), C_discrete);
    
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
