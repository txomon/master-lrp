function [ m ] = represent_system(motor, reference, error, setpoints)
%REPRESENT_SYSTEM Summary of this function goes here
%   Detailed explanation goes here

figure;
subplot(311);
pasos = size(setpoints,1);
plot(1:pasos,setpoints,1:pasos,motor(1:pasos,1));
title('Consigna y posición motor (yk)');
subplot(312);
plot(1:pasos,reference(1:pasos,1));
title('Señal de control (uk)');
subplot(313);
plot(1:pasos,error(1:pasos,1));
title('Error (ek)');

m=1;

end

