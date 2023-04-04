import numpy
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# This Program calculate state-space matrices of a 2DOF Quarter Car Model
# A Matrix give the system matrix
# B1 Matrix represents the disturbance dynamics
# B2 Matrix represents the actuator dynamics

# m1: chassis mass
# m2: shaft mass
# k1: suspension stiffness
# k2: tire stiffness
# c1: suspension damping
# c2: tire damping

# parameters
m1 = 250
m2 = 30
k1 = 15000
k2 = 220000
c1 = 100
c2 = 1000

# inertia matrix
M_row1 = [m1, 0]
M_row2 = [0, m2]
M = numpy.array((M_row1, M_row2))
print(M)
M_inv = numpy.linalg.inv(M)

# Rigidity Matrix
K_row1 = [k1, -k1]
K_row2 = [-k1, k1 + k2]
K = numpy.array((K_row1, K_row2))
print(K)

# Rigidity Matrix
C_row1 = [c1, -c1]
C_row2 = [-c1, c1 + c2]
C = numpy.array((C_row1, C_row2))
print(K)

# A Matrix
A1 = numpy.concatenate((numpy.zeros((2, 2)), numpy.identity(2)), axis=1)
A2 = numpy.concatenate((-numpy.dot(M_inv, K), -numpy.dot(M_inv, C)), axis=1)
A = numpy.concatenate((A1, A2), axis=0)

# B matrices
B11 = numpy.zeros((2, 2))
B12_row1 = [0, 0]
B12_row2 = [k2 / m2, c2 / m2]
B12 = numpy.array((B12_row1, B12_row2))

B1 = numpy.concatenate((B11, B12), axis=0)
B2 = numpy.transpose([0, 0, 1/m1, -1/m2])

# C matrix
Cc = numpy.identity(4)

# D matrix
Dd1 = numpy.zeros((4, 2))
Dd2 = numpy.zeros((4, 1))

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

# Ode Solution of the system
tsim = numpy.linspace(0, 10, 100)
init_x = numpy.transpose(numpy.array([0, 0, 0, 0]))
print(init_x)
# Initialization
print("tutorial A")
print(numpy.dot(A, init_x))
print("tutorial B1")
print(numpy.dot(B1, numpy.transpose(numpy.array([1, 0]))))
print("tutorial B2")
print(numpy.dot(B2, 0))


# state space function
def quarter_car(x, t):
    w = numpy.transpose(numpy.array([1, 0]))                        # disturbance function (step response)
    z = w[0] - x[0]                                                 # error function
    kp = 13000                                                         # Controller Gain
    u = z * kp                                                      # Control Law
    dxdt = numpy.dot(A, x) + numpy.dot(B1, w) + numpy.dot(B2, u)    # State Space Representation of the  System

    return dxdt
    pass


# ode solver
x_out = odeint(quarter_car, init_x, tsim)

# plots
plt.figure(1)
plt.plot(tsim, x_out)
plt.grid(True)
plt.xlabel("time(s)")
plt.ylabel("Response")
plt.title("Quarter Car Model Responses")
plt.legend(['x1 [m]', 'x2 [m]', 'dx1 [m/s]', 'dx2 [m/s]'])
plt.show()
