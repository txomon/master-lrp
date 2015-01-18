# coding=utf-8
from __future__ import absolute_import, unicode_literals, print_function
from collections import defaultdict
from matplotlib import pyplot as plt

__author__ = 'javier'

import control
import numpy as np

steps = 500
Ts = 1.84e-3
time = steps * Ts
setpoints = np.concatenate((np.ones(steps / 2), np.ones(steps / 2) * -1))

G = control.tf([52.1], [1.21, 1, 0])
C = control.tf([0.525, 5.022, 4.4], [0.005, 1, 0])

C_discrete = control.sample_system(C, Ts, method='tustin')
G_discrete = control.sample_system(G, Ts, method='zoh')


def factory(ctrl_in, sys):
    global fyk1, fyk2, fuk1, fuk2
    # Simulate controller's transfer function
    den = sys.den[0][0]
    num = sys.num[0][0]

    # Transfer function parameters
    a1 = den[1]
    a2 = den[2]
    b0 = num[0]
    b1 = num[1]

    # TF calculation: y(k)=b0.u(k)+b1*u(k-1)-a1*y(k-1)-a2*y(k-2)

    # Calculate transfer function
    bu0 = b0 * ctrl_in
    bu1 = b1 * fuk1
    ay1 = a1 * fyk1
    ay2 = a2 * fyk2

    bu01 = bu0 + bu1
    ay12 = ay1 + ay2
    y = bu01 - ay12

    # Update registries
    fyk2 = fyk1
    fyk1 = y
    fuk1 = ctrl_in
    return y


def controller(g_out, ref_sig, sys):
    global uk1, uk2, ek1, ek2
    global ek, be0, be1, be2, au1, au2, be01, be012, au12
    # Simulate controller's transfer function
    den = sys.den[0][0]
    num = sys.num[0][0]

    # Transfer function parameters
    a1 = den[1]
    a2 = den[2]
    b0 = num[0]
    b1 = num[1]
    b2 = num[2]

    # u(k)=b0.e(k)+b1*e(k-1)+b2*e(k-2)-a1*u(k-1)-a2*u(k-2);

    # Feedback calculation
    ek = ref_sig - g_out

    # Control signal calculation
    be0 = b0 * ek
    be1 = b1 * ek1
    be2 = b2 * ek2
    au1 = a1 * uk1
    au2 = a2 * uk2

    be01 = be0 + be1
    be012 = be01 + be2
    au12 = au1 + au2
    u = be012 - au12

    # Update registries
    ek2 = ek1
    ek1 = ek
    uk2 = uk1
    uk1 = u

    return u


def represent_system(motor, ref, error):
    fig = plt.figure()
    plt.subplot(311)
    plt.plot(
        xrange(steps),
        setpoints,
        xrange(steps),
        motor
    )
    plt.title('Consigna y posición del motor (yk)')

    plt.subplot(312)
    plt.plot(
        xrange(steps),
        ref,
    )
    plt.title('Señal de control (uk)')
    plt.subplot(313)
    plt.plot(
        xrange(steps),
        error,
    )
    plt.title('Error (ek)')
    plt.show()


ek, be0, be1, be2, au1, au2, be01, be012, au12 = (0,) * 9
ek1, ek2, uk1, uk2, fyk1, fyk2, fuk1 = (0,) * 7
uk = 0
yk = 0

float_sig = defaultdict(list)

for step in xrange(steps):
    # Gather factory output
    yk = factory(uk, G_discrete)
    # Call the controller
    uk = controller(yk, setpoints[step], C_discrete)

    float_sig['uk'].append(uk)
    float_sig['yk'].append(yk)
    float_sig['ek'].append(ek)
    float_sig['be0'].append(be0)
    float_sig['be1'].append(be1)
    float_sig['be2'].append(be2)
    float_sig['au1'].append(au1)
    float_sig['au2'].append(au2)
    float_sig['be01'].append(be01)
    float_sig['be012'].append(be012)
    float_sig['au12'].append(au12)

represent_system(
    float_sig['yk'],
    float_sig['ek'],
    float_sig['uk'],
)

float_calc = {}
for name, signal in float_sig.iteritems():
    s_max = np.amax(signal)
    s_min = np.amin(signal)
    s_abs = np.absolute(signal)
    s_dif = np.diff(signal)

    s_mod = np.amin(s_abs[s_abs != 0])
    s_var = np.amin(np.absolute(s_dif[s_dif != 0]))

    s_int = np.ceil(np.log2(np.amax(s_abs)))
    s_int = s_int if s_min >= 0 else s_int + 1

    s_flt = np.ceil(np.abs(np.log2(s_var)))

    print("Signal", name, "being analyzed:")
    print("    Max:", s_max)
    print("    Min:", s_min)
    print("    Mod:", s_mod)
    print("    Var:", s_var)
    print("    Int:", s_int)
    print("    Flt:", s_flt)

    float_calc[name] = {'int': s_int
        , 'flt': s_flt
        , 'max': s_max
        , 'min': s_min
        , 'mod': s_mod
        , 'var': s_var
    }

