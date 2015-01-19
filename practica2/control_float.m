close all;
clear all;

global ek be0 be1 be2 au1 au2 be01 be012 au12


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

yka = zeros(pasos,1);
eka = zeros(pasos,1);
be0a = zeros(pasos,1);
be1a = zeros(pasos,1);
be2a = zeros(pasos,1);
au1a = zeros(pasos,1);
au2a = zeros(pasos,1);
be01a = zeros(pasos,1);
be012a = zeros(pasos,1);
au12a = zeros(pasos,1);
uka = zeros(pasos,1);

%Condiciones iniciales
uk=0;
yk=0;

% scope0 = NumericTypeScope;
% scope1 = NumericTypeScope;
% scope2 = NumericTypeScope;
% scope3 = NumericTypeScope;
% scope4 = NumericTypeScope;
% scope5 = NumericTypeScope;
% scope6 = NumericTypeScope;
% scope7 = NumericTypeScope;
% scope8 = NumericTypeScope;
% scope9 = NumericTypeScope;
% scope10 = NumericTypeScope;

for k=1:pasos
    %Llamamos a la función que simula e lcomportamiento de la planta
    yk = planta(uk, G_discrete);
    %Llamamos a la función que simula el comportamiento del controlador
    uk = controlador(yk, setpoints(k), C_discrete);
    
%     step(scope0,yk);
%     step(scope1,ek);
%     step(scope2,be0);
%     step(scope3,be1);
%     step(scope4,be2);
%     step(scope5,au1);
%     step(scope6,au2);
%     step(scope7,be01);
%     step(scope8,be012);
%     step(scope9,au12);
%     step(scope10,uk);

    yka(k) = yk;
    eka(k) = ek;
    be0a(k) = be0;
    be1a(k) = be1;
    be2a(k) = be2;
    au1a(k) = au1;
    au2a(k) = au2;
    be01a(k) = be01;
    be012a(k) = be012;
    au12a(k) = au12;
    uka(k) = uk;
    
end;

represent_system(yka,eka,uka,setpoints);


signals = containers.Map();
signals('yk') = yka;
signals('ek') = eka;
signals('be0') = be0a;
signals('be1') = be1a;
signals('be2') = be2a;
signals('au1') = au1a;
signals('au2') = au2a;
signals('be01') = be01a;
signals('be012') = be012a;
signals('au12') = au12a;
signals('uk') = uka;

datainfo = containers.Map();
precinfo = containers.Map();

for name=signals.keys;
    name = char(name); %#ok
    signal = signals(name);
    
    s_max = max(signal);
    
    s_min = min(signal);
    
    s_abs = abs(signal);
    s_abs(s_abs==0) = [];
    s_mod = min(s_abs);
    
    s_diffs = abs(diff(signal));
    s_diffs(s_diffs==0) = [];
    s_var = min(s_diffs);
    
    s_int = ceil(log2(s_max));
    if s_min < 0;
        s_int = s_int + 1;
    end
    
    s_float = ceil(abs(log2(s_var)));
    
    disp(['Analizando señal ' name ':']);
    fprintf('    Max: %f\n', s_max);
    fprintf('    Min: %f\n', s_min);
    fprintf('    Mod: %f\n', s_mod);
    fprintf('    Var: %f\n', s_var);
    fprintf('    Int: %f\n', s_int);
    fprintf('    Flt: %f\n', s_float);
    
    datainfo(name) = [s_max s_min s_mod s_var];
    precinfo(name) = [s_int s_float];
end

k = precinfo('yk');
yk_c_int = k(1);
yk_c_flt = k(2);
k = precinfo('ek');
ek_c_int = k(1);
ek_c_flt = k(2);
k = precinfo('be0');
be0_c_int = k(1);
be0_c_flt = k(2);
k = precinfo('be1');
be1_c_int = k(1);
be1_c_flt = k(2);
k = precinfo('be2');
be2_c_int = k(1);
be2_c_flt = k(2);
k = precinfo('au1');
au1_c_int = k(1);
au1_c_flt = k(2);
k = precinfo('au2');
au2_c_int = k(1);
au2_c_flt = k(2);
k = precinfo('be01');
be01_c_int = k(1);
be01_c_flt = k(2);
k = precinfo('be012');
be012_c_int = k(1);
be012_c_flt = k(2);
k = precinfo('au12');
au12_c_int = k(1);
au12_c_flt = k(2);
k = precinfo('uk');
uk_c_int = k(1);
uk_c_flt = k(2);


%Creamos las precisiones de las señales
global ykt ekt be0t be1t be2t au1t au2t be01t be012t au12t ukt

ykt = numerictype(1, 1 + yk_c_int + yk_c_flt, yk_c_flt);
ekt = numerictype(1, 1 + ek_c_int + ek_c_flt, ek_c_flt);
be0t = numerictype(1, 1 + be0_c_int + be0_c_flt, be0_c_flt);
be1t = numerictype(1, 1 + be1_c_int + be1_c_flt, be1_c_flt);
be2t = numerictype(1, 1 + be2_c_int + be2_c_flt, be2_c_flt);
au1t = numerictype(1, 1 + au1_c_int + au1_c_flt, au1_c_flt);
au2t = numerictype(1, 1 + au2_c_int + au2_c_flt, au2_c_flt);
be01t = numerictype(1, 1 + be01_c_int + be01_c_flt, be01_c_flt);
be012t = numerictype(1, 1 + be012_c_int + be012_c_flt, be012_c_flt);
au12t = numerictype(1, 1 + au12_c_int + au12_c_flt, au12_c_flt);
ukt = numerictype(1, 1 + uk_c_int + uk_c_flt, uk_c_flt);

%Creamos las precisiones de la ecuación
global a1t a2t b0t b1t b2t
as = C_discrete.den{1,1};
bs = C_discrete.num{1,1};
%Parámetros del controlador
[a b c] = calculate_precision(as(2));
a1t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(as(3));
a2t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(1));
b0t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(2));
b1t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(3));
b2t = numerictype(a,a+b+c,c);


yka_d1 = zeros(pasos,1);
eka_d1 = zeros(pasos,1);
be0a_d1 = zeros(pasos,1);
be1a_d1 = zeros(pasos,1);
be2a_d1 = zeros(pasos,1);
au1a_d1 = zeros(pasos,1);
au2a_d1 = zeros(pasos,1);
be01a_d1 = zeros(pasos,1);
be012a_d1 = zeros(pasos,1);
au12a_d1 = zeros(pasos,1);
uka_d1 = zeros(pasos,1);

% scope0 = NumericTypeScope;
% scope1 = NumericTypeScope;
% scope2 = NumericTypeScope;
% scope3 = NumericTypeScope;
% scope4 = NumericTypeScope;
% scope5 = NumericTypeScope;
% scope6 = NumericTypeScope;
% scope7 = NumericTypeScope;
% scope8 = NumericTypeScope;
% scope9 = NumericTypeScope;
% scope10 = NumericTypeScope;


for k=1:pasos
    %Llamamos a la función que simula el comportamiento de la planta
    yk = planta(uk, G_discrete);
    
    %Llamamos a la función que simula el comportamiento del controlador
    uk = controlador_FP(yk, setpoints(k), C_discrete);
    
%     step(scope0,yk);
%     step(scope1,ek);
%     step(scope2,be0);
%     step(scope3,be1);
%     step(scope4,be2);
%     step(scope5,au1);
%     step(scope6,au2);
%     step(scope7,be01);
%     step(scope8,be012);
%     step(scope9,au12);
%     step(scope10,uk);
    
    yka_d1(k) = yk;
    eka_d1(k) = ek;
    be0a_d1(k) = be0;
    be1a_d1(k) = be1;
    be2a_d1(k) = be2;
    au1a_d1(k) = au1;
    au2a_d1(k) = au2;
    be01a_d1(k) = be01;
    be012a_d1(k) = be012;
    au12a_d1(k) = au12;
    uka_d1(k) = uk;
end;

represent_system(yka_d1,eka_d1,uka_d1,setpoints);

yk_d1_int = yk_c_int;
yk_d1_flt = yk_c_flt   ;
ek_d1_int = ek_c_int;
ek_d1_flt = ek_c_flt  ;
be0_d1_int = be0_c_int;
be0_d1_flt = be0_c_flt - 4;
be1_d1_int = be1_c_int;
be1_d1_flt = be1_c_flt - 4;
be2_d1_int = be2_c_int;
be2_d1_flt = be2_c_flt - 6;
au1_d1_int = au1_c_int;
au1_d1_flt = au1_c_flt  - 8;
au2_d1_int = au2_c_int;
au2_d1_flt = au2_c_flt - 10 ;
be01_d1_int = be01_c_int;
be01_d1_flt = be01_c_flt - 4;
be012_d1_int = be012_c_int;
be012_d1_flt = be012_c_flt - 4;
au12_d1_int = au12_c_int;
au12_d1_flt = au12_c_flt - 13;
uk_d1_int = uk_c_int;
uk_d1_flt = uk_c_flt;


%Creamos las precisiones de las señales
ykt = numerictype(1, 1 + yk_d1_int + yk_d1_flt, yk_d1_flt);
ekt = numerictype(1, 1 + ek_d1_int + ek_d1_flt, ek_d1_flt);
be0t = numerictype(1, 1 + be0_d1_int + be0_d1_flt, be0_d1_flt);
be1t = numerictype(1, 1 + be1_d1_int + be1_d1_flt, be1_d1_flt);
be2t = numerictype(1, 1 + be2_d1_int + be2_d1_flt, be2_d1_flt);
au1t = numerictype(1, 1 + au1_d1_int + au1_c_flt, au1_d1_flt);
au2t = numerictype(1, 1 + au2_d1_int + au2_d1_flt, au2_d1_flt);
be01t = numerictype(1, 1 + be01_d1_int + be01_d1_flt, be01_d1_flt);
be012t = numerictype(1, 1 + be012_d1_int + be012_d1_flt, be012_d1_flt);
au12t = numerictype(1, 1 + au12_d1_int + au12_d1_flt, au12_d1_flt);
ukt = numerictype(1, 1 + uk_d1_int + uk_d1_flt, uk_d1_flt);

%Creamos las precisiones de la ecuación
as = C_discrete.den{1,1};
bs = C_discrete.num{1,1};
%Parámetros del controlador
[a b c] = calculate_precision(as(2));
b = b;
c = c - 17;
a1t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(as(3));
b = b;
c = c - 16;
a2t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(1));
b = b;
c = c - 10;
b0t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(2));
b = b;
c = c - 8;
b1t = numerictype(a,a+b+c,c);
[a b c] = calculate_precision(bs(3));
b = b;
c = c - 9;
b2t = numerictype(a,a+b+c,c);




yka_d2 = zeros(pasos,1);
eka_d2 = zeros(pasos,1);
be0a_d2 = zeros(pasos,1);
be1a_d2 = zeros(pasos,1);
be2a_d2 = zeros(pasos,1);
au1a_d2 = zeros(pasos,1);
au2a_d2 = zeros(pasos,1);
be01a_d2 = zeros(pasos,1);
be012a_d2 = zeros(pasos,1);
au12a_d2 = zeros(pasos,1);
uka_d2 = zeros(pasos,1);

% scope0 = NumericTypeScope;
% scope1 = NumericTypeScope;
% scope2 = NumericTypeScope;
% scope3 = NumericTypeScope;
% scope4 = NumericTypeScope;
% scope5 = NumericTypeScope;
% scope6 = NumericTypeScope;
% scope7 = NumericTypeScope;
% scope8 = NumericTypeScope;
% scope9 = NumericTypeScope;
% scope10 = NumericTypeScope;


for k=1:pasos
    %Llamamos a la función que simula el comportamiento de la planta
    yk = planta(uk, G_discrete);
    
    %Llamamos a la función que simula el comportamiento del controlador
    uk = controlador_FP(yk, setpoints(k), C_discrete);
    
%     step(scope0,yk);
%     step(scope1,ek);
%     step(scope2,be0);
%     step(scope3,be1);
%     step(scope4,be2);
%     step(scope5,au1);
%     step(scope6,au2);
%     step(scope7,be01);
%     step(scope8,be012);
%     step(scope9,au12);
%     step(scope10,uk);
    
    yka_d2(k) = yk;
    eka_d2(k) = ek;
    be0a_d2(k) = be0;
    be1a_d2(k) = be1;
    be2a_d2(k) = be2;
    au1a_d2(k) = au1;
    au2a_d2(k) = au2;
    be01a_d2(k) = be01;
    be012a_d2(k) = be012;
    au12a_d2(k) = au12;
    uka_d2(k) = uk;
end;
represent_system(yka_d2,eka_d2,uka_d2,setpoints);

nt = containers.Map();
nt('ykt') = ykt;
nt('ekt ') = ekt;
nt('be0t') = be0t;
nt('be1t ') = be1t;
nt('be2t') = be2t;
nt('au1t') = au1t;
nt('au2t') = au2t;
nt('be01t') = be01t;
nt('be012t') = be012t;
nt('au12t') = au12t;
nt('ukt') = ukt;
nt('a1t') = a1t;
nt('a2t') = a2t;
nt('b0t') = b0t;
nt('b1t') = b1t;
nt('b2t') = b2t;

for name=nt.keys();
    name = char(name);
    type = fi(nt(name));
    disp(['Signal type ' name]);
    disp(type);
end