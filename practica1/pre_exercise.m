h = figure
clf


C = tf([ 0.525 5.022 4.4 ], [ 0.005 1 0])
G = tf([ 52.1 ] , [ 1.21 1 0 ])

C.InputName = 'e';
C.OutputName = 'u';
G.InputName = 'u';
G.OutputName = 'y';
Sum = sumblk('e', 'r', 'y' , '+-');
controlled = connect(G, C, Sum, 'r', 'y');

%%% Part 2, continuous controller
pzmap(C)
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
saveas(h,'pre-exercise/part2-controller-impulse-continuous.jpg')
clf(h)

step(C)
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
saveas(h,'pre-exercise/part2-controller-nyquist-continuous.jpg')
clf(h)


%%% Part 2, continuous system
pzmap(controlled)
saveas(h,'pre-exercise/part2-controlled-pzmap-continuous.jpg')
clf(h)

pole(controlled)
% 
% ans =
% 
%    1.0e+02 *
% 
%   -1.7552          
%   -0.1216 + 0.0857i
%   -0.1216 - 0.0857i
%   -0.0097          

zero(controlled)
% 
% ans =
% 
%    -8.5901
%    -0.9757

impulse(controlled)
saveas(h,'pre-exercise/part2-controlled-impulse-continuous.jpg')
clf(h)

step(controlled)
saveas(h,'pre-exercise/part2-controlled-step-continuous.jpg')
clf(h)

stepinfo(controlled)
% 
% ans = 
% 
%         RiseTime: 0.0513
%     SettlingTime: 0.3475
%      SettlingMin: 0.9078
%      SettlingMax: 1.2021
%        Overshoot: 20.2128
%       Undershoot: 0
%             Peak: 1.2021
%         PeakTime: 0.1439
bode(controlled)
saveas(h,'pre-exercise/part2-controlled-bode-continuous.jpg')
clf(h)

bandwidth(controlled)
% 
% ans =
% 
%    34.1359

nyquist(controlled)
saveas(h,'pre-exercise/part2-controlled-nyquist-continuous.jpg')
clf(h)


%%% Part 2 continuous analysis understanding
% I have learnt that the Ts is dependant on the bandwidth,
% but not from the controller but from the system, so:
Ts = 1/bandwidth(controlled)
% 
% Ts =
% 
%     0.0293

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


%%% Part 2, backward difference
% Equivalent to impulse
% s = (1 - (z^-1))/Ts

% Part 2, forward difference
% Equivalent to left rectangular
% s = (z - 1)/Ts

% Part 2, left-right rectangular
% left rectangular
% c2d zoh
% 1/s = Ts/(z - 1)


% right rectangular
% Equivalent to impulse
% 1/s = Ts/(1 - (z^-1))

% Part 2, Tustin bilinear
% c2d tustin
% 1/s = (Ts/2)*((1 + (z^-1))/(1-(z^-1)))

% Part 2, Simpson
% 1/s = (Ts/3)*((1 + 4*(z^-1) + (z^-2))/(1 - (z^-2)))

% Part 2, Impulse
% c2d impulse

% Part 2, Step
% Equivalent to forward difference

% Part 2, Poles
% c2d matched