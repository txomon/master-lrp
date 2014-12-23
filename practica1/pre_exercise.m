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


%%% Part 2, backward difference
% Equivalent to impulse
% s = (1 - (z^-1))/Ts
% controlled, with z substitutions for backwards difference
% (4521(s)^2 + 43250(s) + 37890) / ((s)^4 + 200.8*(s)^3 + 4686(s)^2 + 43250*(s) + 37890)
% (4521((1-1/z)/Ts1)^2 + 43250((1-1/z)/Ts1) + 37890) / (((1-1/z)/Ts1)^4 + 200.8*((1-1/z)/Ts1)^3 + 4686((1-1/z)/Ts1)^2 + 43250*((1-1/z)/Ts1) + 37890)
% (4521((1-1/z)/Ts2)^2 + 43250((1-1/z)/Ts2) + 37890) / (((1-1/z)/Ts2)^4 + 200.8*((1-1/z)/Ts2)^3 + 4686((1-1/z)/Ts2)^2 + 43250*((1-1/z)/Ts2) + 37890)
syms z
backward1 = simplify(((4521*((1-1/z)/Ts1)^2 + 43250*((1-1/z)/Ts1) + 37890) / (((1-1/z)/Ts1)^4 + 200.8*((1-1/z)/Ts1)^3 + 4686*((1-1/z)/Ts1)^2 + 43250*((1-1/z)/Ts1) + 37890)))
% 
% backward1 =
%  
% (76049863397038479989809360535535*z^2*(1020318086607685007211156067266964874251*z^2 - 2021859364439128964244098977447419052032*z + 1001573294823934110233018619921239638016))/(6229726493327672946462826420742212981366512179697445788780464356393868101*z^4 - 23024494207872140638905029269429343799672482668787119710948407477543108608*z^3 + 31778357006337593967674177228541713660435674949997291470249429195217174528*z^2 - 19400704518851181839032471226828566639889481457490570393311959236252532736*z + 4417117661945960823958243751857296289568709742189047395304015503231549440)
%  
% After seeing what a huge numbers simplify returns, and being unable to
% maintain such precision, following calculations are done:
% 
% First, lets know what number orders there are and substitute them
% 76049863397038479989809360535535
% 1020318086607685007211156067266964874251
% 2021859364439128964244098977447419052032
% 1001573294823934110233018619921239638016
% 6229726493327672946462826420742212981366512179697445788780464356393868101
% 23024494207872140638905029269429343799672482668787119710948407477543108608
% 31778357006337593967674177228541713660435674949997291470249429195217174528
% 19400704518851181839032471226828566639889481457490570393311959236252532736
% 4417117661945960823958243751857296289568709742189047395304015503231549440
% 
% ans =
% 
%     7.604986339703848e+031
% 
% 
% ans =
% 
%     1.020318086607685e+039
% 
% 
% ans =
% 
%     2.021859364439129e+039
% 
% 
% ans =
% 
%     1.001573294823934e+039
% 
% 
% ans =
% 
%     6.229726493327673e+072
% 
% 
% ans =
% 
%     2.302449420787214e+073
% 
% 
% ans =
% 
%     3.177835700633759e+073
% 
% 
% ans =
% 
%     1.940070451885118e+073
% 
% 
% ans =
% 
%     4.417117661945961e+072

% Substituting:
% 7.604986339703848e+031*z^2*(1.020318086607685e+039*z^2 - 2.021859364439129e+039*z + 1.001573294823934e+039))/(6.229726493327673e+072*z^4 - 2.302449420787214e+073*z^3 + 3.177835700633759e+073*z^2 - 1.940070451885118e+073*z + 4.417117661945961e+072)
% Therefore, we can divide by 10e70
% 7.604986339703848*z^2*(1.020318086607685*z^2 - 2.021859364439129*z + 1.001573294823934))/(6.229726493327673e+002*z^4 - 2.302449420787214e+003*z^3 + 3.177835700633759e+003*z^2 - 1.940070451885118e+003*z + 4.417117661945961e+002)
% Matlab doesn't seem to be able to round this numbers correctly, so doing it by hand
% (7.7595*z^4 - 15.3762*z^3 + 7.617*z^2 )/ (622.9726*z^4 - 2302.4494*z^3 + 3177.8357*z^2 - 1940.07*z + 441.7117)
backward1 = tf([7.7595 -15.3762 7.617 0 0],[622.9726 -2302.4494 3177.8357 -1940.07 441.7117], Ts1, 'Variable', 'z')
% Transfer function:
%        7.76 z^4 - 15.38 z^3 + 7.617 z^2
% ----------------------------------------------
% 623 z^4 - 2302 z^3 + 3178 z^2 - 1940 z + 441.7
%  
% Sampling time: 0.001953

backward2 = simplify(((4521*((1-1/z)/Ts2)^2 + 43250*((1-1/z)/Ts2) + 37890) / (((1-1/z)/Ts2)^4 + 200.8*((1-1/z)/Ts2)^3 + 4686*((1-1/z)/Ts2)^2 + 43250*((1-1/z)/Ts2) + 37890)))
% 
% backward2 =
%  
% (778750601185673905399799862788415*z^2*(1027527569892336728050634425808249834835099*z^2 - 2053138295938042157760531319291856990240768*z + 1025611053899708528878611066799349389328384))/(4814150793025026253773432446585373394725320321321292319419875221134024757327141*z^4 - 19073305118650880741151343541789079945637471209366261294494541157094384811900928*z^3 + 28335842920717944983123127881353049703707883405634345621586523769703085058818048*z^2 - 18708372164329421810673448754577611871631034888568011459515404514970226682494976*z + 4631683569492647816942839400347516314130799386625622561578303360316525185597440)
% 778750601185673905399799862788415
% 1027527569892336728050634425808249834835099
% 2053138295938042157760531319291856990240768
% 1025611053899708528878611066799349389328384
% 4814150793025026253773432446585373394725320321321292319419875221134024757327141
% 19073305118650880741151343541789079945637471209366261294494541157094384811900928
% 28335842920717944983123127881353049703707883405634345621586523769703085058818048
% 18708372164329421810673448754577611871631034888568011459515404514970226682494976
% 4631683569492647816942839400347516314130799386625622561578303360316525185597440
% 
% ans =
% 
%   7.7875e+032
% 
% 
% ans =
% 
%   1.0275e+042
% 
% 
% ans =
% 
%   2.0531e+042
% 
% 
% ans =
% 
%   1.0256e+042
% 
% 
% ans =
% 
%   4.8142e+078
% 
% 
% ans =
% 
%   1.9073e+079
% 
% 
% ans =
% 
%   2.8336e+079
% 
% 
% ans =
% 
%   1.8708e+079
% 
% 
% ans =
% 
%   4.6317e+078

% (8.0019*z^4 + 15.89*z^3 + 7.987*z^2)/(48142*z^4 - 190733.0511*z^3 + 283358.4292*z^2 - 187083.7216*z + 46316.8356)
backward2 = tf([8.0019 15.89 7.987 0 0], [48141.5079 -190733.0511 283358.4292 -187083.7216 46316.8356], Ts2, 'Variable', 'z')  
% Transfer function:
%                    8.002 z^4 + 15.89 z^3 + 7.987 z^2
% -----------------------------------------------------------------------
% 4.814e004 z^4 - 1.907e005 z^3 + 2.834e005 z^2 - 1.871e005 z + 4.632e004
%  
% Sampling time: 0.0001953

% Part 2, forward difference
% Equivalent to left rectangular
% s = (z - 1)/Ts

% Part 2, left-right rectangular
% left rectangular
% c2d zoh
% 1/s = Ts/(z - 1)
zoh1 = c2d(controlled, Ts1, 'zoh')
zoh2 = c2d(controlled, Ts2, 'zoh')

% right rectangular
% Equivalent to impulse
% 1/s = Ts/(1 - (z^-1))

% Part 2, Tustin bilinear
% c2d tustin
% 1/s = (Ts/2)*((1 + (z^-1))/(1-(z^-1)))
tustin1 = c2d(controlled, Ts1, 'tustin')
tustin2 = c2d(controlled, Ts2, 'tustin')

% Part 2, Simpson
% 1/s = (Ts/3)*((1 + 4*(z^-1) + (z^-2))/(1 - (z^-2)))

% Part 2, Impulse
% c2d impulse
impulse1 = c2d(controlled, Ts1, 'impulse')
impulse2 = c2d(controlled, Ts2, 'impulse')

% Part 2, Step
% Equivalent to forward difference

% Part 2, Poles
% c2d matched
matched1 = c2d(controlled, Ts1, 'matched')
matched2 = c2d(controlled, Ts2, 'matched')


%%% Part 3
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

