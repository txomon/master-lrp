h = figure
clf


C = tf([ 0.525 5.022 4.4 ], [ 0.005 1 0])
G = tf([ 52.1 ] , [ 1.21 1 0 ])

C.InputName = 'e'
C.OutputName = 'u'
G.InputName = 'u'
G.OutputName = 'y'
Sum = sumblk('e', 'r', 'y' , '+-')
controlled = connect(G, C, Sum, 'r', 'y')

%%% Part 2, continuous controller
% Analyze the controller in continuous mode
pzmap(C)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-pzmap-continuous.jpg')
clf(h)

pole(C)
%
% ans =
%
%      0
%   -200

zero(C)
%
% ans =
%
%    -8.5901
%    -0.9757

impulse(C)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-impulse-continuous.jpg')
clf(h)

step(C)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-step-continuous.jpg')
clf(h)

stepinfo(C)
% 
% ans = 
% 
%         RiseTime: 0.0105
%     SettlingTime: 0.0175
%      SettlingMin: 5.2073
%      SettlingMax: 15.0507
%        Overshoot: 1.6178e+03
%       Undershoot: 0
%             Peak: 105
%         PeakTime: 0
% 

bode(C)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-bode-continuous.jpg')
clf(h)

bandwidth(C)
% Warning: The "bandwidth" command returns NaN for models with infinite DC gain. 
% > In warning at 26
%   In DynamicSystem.bandwidth at 37 
% 
% ans =
% 
%    NaN

nyquist(C)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-nyquist-continuous.jpg')
clf(h)


%%% Part 2 controller discretization
% I have learnt that the Ts is dependant on the bandwidth,
% but not from the controller but from the system complete,
% as it's the system which decide what is OK for it:
Ts = 1/bandwidth(controlled)
% 
% Ts =
% 
%     0.0293

Ts1 = Ts/15
Ts2 = Ts/150

% To make discretizations I should use c2d
% 
% help c2d
%  c2d  Converts continuous-time dynamic system to discrete time.
%  
%     SYSD = c2d(SYSC,TS,METHOD) computes a discrete-time model SYSD with 
%     sampling time TS that approximates the continuous-time model SYSC.
%     The string METHOD selects the discretization method among the following:
%        'zoh'       Zero-order hold on the inputs
%        'foh'       Linear interpolation of inputs
%        'impulse'   Impulse-invariant discretization
%        'tustin'    Bilinear (Tustin) approximation.
%        'matched'   Matched pole-zero method (for SISO systems only).
%     The default is 'zoh' when METHOD is omitted. The sampling time TS should 
%     be specified in the time units of SYSC (see "TimeUnit" property).
%  
%     c2d(SYSC,TS,OPTIONS) gives access to additional discretization options. 
%     Use C2DOPTIONS to create and configure the option set OPTIONS. For 
%     example, you can specify a prewarping frequency for the Tustin method by:
%        opt = c2dOptions('Method','tustin','PrewarpFrequency',.5);
%        sysd = c2d(sysc,.1,opt);
%  
%     For state-space models,
%        [SYSD,G] = c2d(SYSC,Ts,METHOD)
%     also returns the matrix G mapping the states xc(t) of SYSC to the states 
%     xd[k] of SYSD:
%        xd[k] = G * [xc(k*Ts) ; u[k]]
%     Given an initial condition x0 for SYSC and an initial input value u0=u(0), 
%     the equivalent initial condition for SYSD is (assuming u(t)=0 for t<0):
%        xd[0] = G * [x0;u0] .
%  
%     See also c2dOptions, d2c, d2d, DynamicSystem.
% 
%     Overloaded methods:
%        DynamicSystem/c2d


% backward difference calculus
% s = ((1 - (z^-1))/Ts)
% controller, with z substitutions for backwards difference

C
% Transfer function from input "e" to output "u":
% 0.525 s^2 + 5.022 s + 4.4
% -------------------------
%       0.005 s^2 + s

% ( 0.525 *((1 - (z^-1))/Ts1)^2 + 5.022 *((1 - (z^-1))/Ts1) + 4.4) / ( 0.005 *((1 - (z^-1))/Ts1)^2 + ((1 - (z^-1))/Ts1) )
% ( 0.525 *((1 - (z^-1))/Ts2)^2 + 5.022 *((1 - (z^-1))/Ts2) + 4.4) / ( 0.005 *((1 - (z^-1))/Ts2)^2 + ((1 - (z^-1))/Ts2) )
syms z
backward1 = simplify(( 0.525 *((1 - (z^-1))/Ts1)^2 + 5.022 *((1 - (z^-1))/Ts1) + 4.4) / ( 0.005 *((1 - (z^-1))/Ts1)^2 + ((1 - (z^-1))/Ts1) ))
%  
% backward1 =
%  
% ((44431504810070055682310350753501849971*z^2)/2882303761517117440 - (610937718291869292993*z)/20 + 15132094747964866560)/((200406788765567447*z - 144115188075855872)*(z - 1))
%  
% After seeing what a huge numbers simplify returns, and being unable to
% maintain such precision, following calculations are done:
% 
% First, we shape it to be two polinomes
% ((44431504810070055682310350753501849971*z^2)/2882303761517117440 - (610937718291869292993*z)/20 + 15132094747964866560)/((200406788765567447*z - 144115188075855872)*(z - 1))
% if operating, results are:
% (1.541527489340099e+019*z^2 - 3.054688591459347e+019*z + 1.513209474796487e+019)/(2.004067887655675e+017*z^2 - 3.445219768414234e+017*z + 1.441151880758559e+017)
%
% And from this we can go further to take out 17 numbers out
% (1.541527489340099e+2*z^2 - 3.054688591459347e+2*z + 1.513209474796487e+2)/(2.004067887655675*z^2 - 3.445219768414234*z + 1.441151880758559)
%
% and simplify by taking out exponents
% (154.1527489340099*z^2 - 305.4688591459347*z + 151.3209474796487)/(2.004067887655675*z^2 - 3.445219768414234*z + 1.441151880758559)
%
% finally feeding it to a transfer function
backward1 = tf([154.1527489340099 -305.4688591459347 151.3209474796487],[2.004067887655675 -3.445219768414234 1.441151880758559], Ts1, 'Variable', 'z')
%  
% Transfer function:
% 154.2 z^2 - 305.5 z + 151.3
% ---------------------------
% 2.004 z^2 - 3.445 z + 1.441
%  
% Sampling time: 0.001953

% And now do the same with Ts2
simplify(( 0.525 *((1 - (z^-1))/Ts2)^2 + 5.022 *((1 - (z^-1))/Ts2) + 4.4) / ( 0.005 *((1 - (z^-1))/Ts2)^2 + ((1 - (z^-1))/Ts2) ))
 
% ans =
%  
% ((44745512191237834055313570725564812542339*z^2)/92233720368547758080 - (19387173848189508013191*z)/20 + 484227031934875729920)/((4791819140634464929*z - 4611686018427387904)*(z - 1))

% (4.851318152671669e+020*z^2 - 9.693586924094753e+020*z + 4.842270319348757e+020 )/( 4.791819140634465e+018*z^2 - 9.403505159061852e+018*z + 4.611686018427388e+018)
% Reduce scale
% (485.1318152671669*z^2 - 969.3586924094753*z + 484.2270319348757)/(4.791819140634465*z^2 - 9.403505159061852*z + 4.611686018427388)

backward2 = tf([485.1318152671669 -969.3586924094753 484.2270319348757],[4.791819140634465 -9.403505159061852 4.611686018427388], Ts2, 'Variable', 'z')
% 
% Transfer function:
% 485.1 z^2 - 969.4 z + 484.2
% ---------------------------
% 4.792 z^2 - 9.404 z + 4.612
%  
% Sampling time: 0.0001953

% Part 2, Tustin bilinear
% c2d tustin
tustin1 = c2d(C, Ts1, 'tustin')
tustin2 = c2d(C, Ts2, 'tustin')

% Part 2, Impulse
% c2d impulse
impulse1 = c2d(C, Ts1, 'impulse')
impulse2 = c2d(C, Ts2, 'impulse')

% Part 2, Step response
% c2d zoh
step1 = c2d(C, Ts1, 'zoh')
step2 = c2d(C, Ts2, 'zoh')

% We have been told to analyze the discretization. Will try to do as much
% as posssible using numbers instead of graphs to avoid images in the
% report
discretizations = containers.Map()
discretizations('backward1') = backward1
discretizations('backward2') = backward2
discretizations('tustin1') = tustin1
discretizations('tustin2') = tustin2
discretizations('impulse1') = impulse1
discretizations('impulse2') = impulse2
discretizations('step1') = step1
discretizations('step2') = step2

for name = discretizations.keys
    name = char(name)
    sys = discretizations(name)
    pzmap(sys)
    set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
    saveas(h,['pre-exercise/part2-controller-pzmap-' name '.jpg'])
    clf(h)
    
    disp(['Poles of ' name])
    pole(sys)
    
    disp(['Zeros of ' name])
    zero(sys)
    
    impulse(sys)
    set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
    saveas(h,['pre-exercise/part2-controller-impulse-' name '.jpg'])
    clf(h)

    step(sys)
    set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
    saveas(h,['pre-exercise/part2-controller-step-' name '.jpg'])
    clf(h)

    disp(['Stepinfo of ' name])
    stepinfo(sys)
    
    bode(sys)
    set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
    saveas(h,['pre-exercise/part2-controller-bode-' name '.jpg'])
    clf(h)

    disp(['Bandwidth of ' name])
    bandwidth(sys)
    
    nyquist(sys)
    set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
    saveas(h,['pre-exercise/part2-controller-nyquist-' name '.jpg'])
    clf(h)
end

% Comparisons for different graphics

bode(continuous, backward1, backward2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-bode-backward-comparison.jpg')
clf(h)

bode(continuous, tustin1, tustin2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-bode-tustin-comparison.jpg')
clf(h)

bode(continuous, impulse1, impulse2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-bode-impulse-comparison.jpg')
clf(h)

bode(continuous, step1, step2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-bode-step-comparison.jpg')
clf(h)


step(continuous, backward1, backward2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-step-backward-comparison.jpg')
clf(h)

step(continuous, tustin1, tustin2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-step-tustin-comparison.jpg')
clf(h)

step(continuous, impulse1, impulse2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-step-impulse-comparison.jpg')
clf(h)

step(continuous, step1, step2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-step-step-comparison.jpg')
clf(h)


impulse(continuous, backward1, backward2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-impulse-backward-comparison.jpg')
clf(h)

impulse(continuous, tustin1, tustin2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-impulse-tustin-comparison.jpg')
clf(h)

impulse(continuous, impulse1, impulse2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-impulse-impulse-comparison.jpg')
clf(h)

impulse(continuous, step1, step2)
set(findall(gcf, 'Type', 'Line'), 'LineWidth', 2)
saveas(h,'pre-exercise/part2-controller-impulse-step-comparison.jpg')
clf(h)


%%% Part 4
%
% Discretize the system with all the methods and extract the gains in
% continuous vs discrete in open loop

% backward difference calculus
% s = ((1 - (z^-1))/Ts)
% in
% (52.1/(1.21*s^2+s))
% (52.1/(1.21*((1 - (z^-1))/Ts1)^2+((1 - (z^-1))/Ts1)))
% (52.1/(1.21*((1 - (z^-1))/Ts2)^2+((1 - (z^-1))/Ts2)))

% For backward1
simplify((52.1/(1.21*((1 - (z^-1))/Ts1)^2+((1 - (z^-1))/Ts1))))
%  
% ans =
%  
% (13207326276619016024896892279671245*z^2)/(2305843009213693952*(34932167115046832599*z - 34875875514357121024)*(z - 1))
%  
% (13207326276619016024896892279671245*z^2)/(2305843009213693952*(34932167115046832599*z - 34875875514357121024)*(z - 1))
% (1.320732627661902e+034*z^2)/((8.054809333891523e+037*z - 8.041829374498741e+037)*(z - 1))
% (1.320732627661902*z^2)/(8054.809333891523*z^2 - 16096.63870839027*z + 8041.829374498741))

b1 = tf([1.320732627661902 0 0],[8054.809333891523 -16096.63870839027 8041.829374498741])

simplify((52.1/(1.21*((1 - (z^-1))/Ts2)^2+((1 - (z^-1))/Ts2))))
% 
% ans =
%  
% (135243021072578701571098576170921405*z^2)/(73786976294838206464*(1116208149581634949793*z - 1116028016459427872768)*(z - 1))
%  
% (135243021072578701571098576170921405*z^2)/(73786976294838206464*(1116208149581634949793*z - 1116028016459427872768)*(z - 1))
% (1.352430210725787e+035*z^2)/(8.236162427328532e+040*z^2 -1.647099570681524e+041*z + 8.234833279486711e+040)
% (1.352430210725787*z^2)/(823616.2427328532*z^2 -1647099.570681524*z + 823483.3279486711)
b2 = tf([1.352430210725787 0 0],[823616.2427328532 -1647099.570681524 823483.3279486711])


t1 = c2d(G, Ts1, 'tustin')
t2 = c2d(G, Ts2, 'tustin')

i1 = c2d(G, Ts1, 'impulse')
i2 = c2d(G, Ts2, 'impulse')

s1 = c2d(G, Ts1, 'zoh')
s2 = c2d(G, Ts2, 'zoh')


factories = containers.Map()
factories('continuous') = G
factories('backward1') = b1
factories('backward2') = b2
factories('tustin1') = t1
factories('tustin2') = t2
factories('impulse1') = i1
factories('impulse2') = i2
factories('step1') = s1
factories('step2') = s2

for name = factories.keys
    name = char(name)
    sys = factories(name)
    disp(['Gain of ' name ':'])
    allmargin(sys)
end
