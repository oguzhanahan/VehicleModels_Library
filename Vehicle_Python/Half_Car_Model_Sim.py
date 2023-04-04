import numpy
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# This Program calculate state-space matrices of a 2DOF Quarter Car Model
# A Matrix give the system matrix
# B1 Matrix represents the disturbance dynamics
# B2 Matrix represents the actuator dynamics

# m1: chassis mass
#  J: chassis mass inertia
# m2: front shaft mass
# m3: rear shaft mass

# k1: front suspension stiffness
# k2: front tire stiffness
# c1: front suspension damping
# c2: front tire damping

# k3: rear suspension stiffness
# k4: rear tire stiffness
# c3: rear suspension damping
# c4: rear tire damping

# Inertial parameters
m1 = 500
m2 = 30
m3 = 30
J = 500
# Geometric Parameters
L1 = 1.2
L2 = 1.5
# Front Suspension Parameters
k1 = 15000
k2 = 220000
c1 = 100
c2 = 1000

# Rear Suspension Parameters
k3 = 15000
k4 = 220000
c3 = 100
c4 = 1000

# inertia matrix
M_row1 = [m1, 0, 0, 0]
M_row2 = [0, m2, 0, 0]
M_row3 = [0, 0, m3, 0]
M_row4 = [0, 0, 0, J]
M = numpy.array((M_row1, M_row2, M_row3, M_row4))
print(M)
M_inv = numpy.linalg.inv(M)

# Rigidity Matrix
K_row1 = [k1 + k3, -k1, -k3, k1 * L1 - k3 * L2]
K_row2 = [-k1, k1 + k2, 0, -k1 * L1]
K_row3 = [-k3, 0, k3 + k4, k3 * L2]
K_row4 = [k1 * L1 - k3 * L2, -k1 * L1, k3 * L2, k1 * L1 ** 2 + k3 * L2 ** 2]

K = numpy.array((K_row1, K_row2, K_row3, K_row4,))
print(K)

# Rigidity Matrix
C_row1 = [c1 + c3, -c1, -c3, c1 * L1 - c3 * L2]
C_row2 = [-c1, c1 + c2, 0, -c1 * L1]
C_row3 = [-c3, 0, c3 + c4, c3 * L2]
C_row4 = [c1 * L1 - c3 * L2, -c1 * L1, c3 * L2, c1 * L1 ** 2 + c3 * L2 ** 2]

C = numpy.array((C_row1, C_row2, C_row3, C_row4,))
print(C)
s = len(M)
print(s)
# A Matrix
A1 = numpy.concatenate((numpy.zeros((s, s)), numpy.identity(s)), axis=1)
A2 = numpy.concatenate((-numpy.dot(M_inv, K), -numpy.dot(M_inv, C)), axis=1)
A = numpy.concatenate((A1, A2), axis=0)

# B matrices
B11 = numpy.zeros((s, s))
B12_row1 = [0, 0, 0, 0]
B12_row2 = [k2 / m2, c2 / m2, 0, 0]
B12_row3 = [0, 0, k4 / m3, c4 / m3]
B12_row4 = [0, 0, 0, 0]
B12 = numpy.array((B12_row1, B12_row2, B12_row3, B12_row4))
B1 = numpy.concatenate((B11, B12), axis=0)

B21 = numpy.zeros((s, 2))
B22_row1 = numpy.array([1 / m1, 1 / m1])
B22_row2 = numpy.array([-1 / m2, 0])
B22_row3 = numpy.array([0, -1 / m3])
B22_row4 = numpy.array([-L1 / m1, L2 / m1])
B22 = numpy.array((B22_row1, B22_row2, B22_row3, B22_row4))
B2 = numpy.concatenate((B21, B22), axis=0)
# C matrix
Cc = numpy.identity(2 * s)

# D matrix
sc = len(Cc)
sb1 = len(B1[0])
sb2 = len(B2[0])
Dd1 = numpy.zeros((sc, sb1))
Dd2 = numpy.zeros((sc, sb2))

# System is xdot=Ax + B1w  + B2u
# Output is y=Ccx   + Dd1w + Dd2u

print("Autonomous system matrix")
print(A)
print("disturbance matrix")
print(B1)
print("Actuator matrix")
print(B2)

D, V = numpy.linalg.eig(A)

print(D)


# state space function
def half_car(x, t):
    w = numpy.transpose(numpy.array([1, 0, 1, 0]))  # disturbance function (step response)
    z = w[0] - x[0]  # error function
    kp1 = 50  # Controller Gain
    u = z * kp1 * numpy.transpose(numpy.array([1, 1.2]))  # Control Law
    dxdt = numpy.dot(A, x) + numpy.dot(B1, w) + numpy.dot(B2, u)  # State Space Representation of the  System

    return dxdt
    pass


# ode solver
tsim = numpy.linspace(0, 10, 1000)
init_x = numpy.transpose(numpy.array([0, 0, 0, 0, 0, 0, 0, 0]))

# Initialization
print("tutorial A")
print(numpy.dot(A, init_x))
print("tutorial B1")
print(numpy.dot(B1, numpy.transpose(numpy.array([1, 0, 1, 0]))))
print("tutorial B2")
print(numpy.dot(B2, numpy.transpose(numpy.array([0, 0]))))

# Solver
x_out = odeint(half_car, init_x, tsim)

# plots
plt.figure(1)
plt.plot(tsim, x_out)
plt.grid(True)
plt.xlabel("time(s)")
plt.ylabel("Response")
plt.title("Half Car Model Responses")
plt.legend(['x1 [m]', 'x2 [m]', 'x3 [m]', 'theta [rad]', 'dx1 [m/s]', 'dx2 [m/s]', 'dx3 [m/s]', 'dtheta [rad/s]'])
plt.show()
