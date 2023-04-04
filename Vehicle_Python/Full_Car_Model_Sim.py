import numpy
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# This Program calculate state-space matrices of a 2DOF Quarter Car Model
# A Matrix give the system matrix
# B1 Matrix represents the disturbance dynamics
# B2 Matrix represents the actuator dynamics

# m1: chassis mass
#  J: chassis mass inertia
# m2: left front shaft mass
# m3: left rear shaft mass
# m4: right front shaft mass
# m5: right rear shaft mass


#Left
# k1: left front suspension stiffness
# k2: left front tire stiffness
# c1: left front suspension damping
# c2: left front tire damping

# k3: left rear suspension stiffness
# k4: left rear tire stiffness
# c3: left rear suspension damping
# c4: left rear tire damping

# Right
# k5: right front suspension stiffness
# k6: right front tire stiffness
# c5: right front suspension damping
# c6: right front tire damping

# k7: right rear suspension stiffness
# k8: right rear tire stiffness
# c7: right rear suspension damping
# c8: right rear tire damping

# Inertial parameters
m1 = 1000
m2 = 30
m3 = 30
m4 = 30
m5 = 30
J1 = 1000
J2 = 2000
# Geometric Parameters
L1 = 1.2
L2 = 1.5
L3 = 0.5
L4 = 0.5

# Left Front Suspension Parameters
k1 = 15000
k2 = 220000
c1 = 100
c2 = 1000

# Left Rear Suspension Parameters
k3 = 15000
k4 = 220000
c3 = 100
c4 = 1000

# Right Front Suspension Parameters
k5 = 15000
k6 = 220000
c5 = 100
c6 = 1000

# Right Rear Suspension Parameters
k7 = 15000
k8 = 220000
c7 = 100
c8 = 1000

# inertia matrix
M_row1 = [m1, 0, 0, 0, 0, 0, 0]
M_row2 = [0, m2, 0, 0, 0, 0, 0]
M_row3 = [0, 0, m3, 0, 0, 0, 0]
M_row4 = [0, 0, 0, m4, 0, 0, 0]
M_row5 = [0, 0, 0, 0, m5, 0, 0]
M_row6 = [0, 0, 0, 0, 0, J1, 0]
M_row7 = [0, 0, 0, 0, 0, 0, J2]
M = numpy.array((M_row1, M_row2, M_row3, M_row4, M_row5, M_row6, M_row7))
print(M)
M_inv = numpy.linalg.inv(M)

# Rigidity Matrix
K_row1 = [k1+k3+k5+k7, -k1, -k3, -k5, -k7, L1*(k1+k5)-L2*(k3+k7), L3*(k1+k3)-L4*(k5+k7)]
K_row2 = [-k1, k1+k2, 0, 0, 0, -k1*L1, -k1*L3]
K_row3 = [-k3, 0, k3+k4, 0, 0, k3*L2, -k3*L3]
K_row4 = [-k5, 0, 0, k5+k6, 0, -k5*L1, k5*L4]
K_row5 = [-k7, 0, 0, 0, k7+k8, k7*L2, k7*L4]
K_row6 = [L1*(k1+k5)-L2*(k3+k7), -k1*L1,  k3*L2, -k5*L1, k7*L2, L1**2*(k1+k5)+L2**2*(k3+k7), L1*(k1*L3-k5*L4)-L2*(k3*L3-k7*L4)]
K_row7 = [L3*(k1+k3)-L4*(k5+k7), -k1*L3, -k3*L3, k5*L4,  k7*L4, L3*(k1*L1-k3*L2)-L4*(k5*L1-k7*L2), L3**2*(k1+k3)+L4**2*(k5+k7)]
K = numpy.array((K_row1, K_row2, K_row3, K_row4, K_row5, K_row6, K_row7))
print(K)

# Rigidity Matrix
C_row1 = [c1+c3+c5+c7, -c1, -c3, -c5, -c7, L1*(c1+c5)-L2*(c3+c7), L3*(c1+c3)-L4*(c5+c7)]
C_row2 = [-c1, c1+c2, 0, 0, 0, -c1*L1, -c1*L3]
C_row3 = [-c3, 0, c3+c4, 0, 0, c3*L2, -c3*L3]
C_row4 = [-c5, 0, 0, c5+c6, 0, -c5*L1, c5*L4]
C_row5 = [-c7, 0, 0, 0, c7+c8, c7*L2, c7*L4]
C_row6 = [L1*(c1+c5)-L2*(c3+c7), -c1*L1,  c3*L2, -c5*L1, c7*L2, L1**2*(c1+c5)+L2**2*(c3+c7), L1*(c1*L3-c5*L4)-L2*(c3*L3-c7*L4)]
C_row7 = [L3*(c1+c3)-L4*(c5+c7), -c1*L3, -c3*L3, c5*L4,  c7*L4, L3*(c1*L1-c3*L2)-L4*(c5*L1-c7*L2), L3**2*(c1+c3)+L4**2*(c5+c7)]

C = numpy.array((C_row1, C_row2, C_row3, C_row4, C_row5, C_row6, C_row7))
print(C)
print('Check K')
print(K-numpy.transpose(K))
print('Check C')
print(C-numpy.transpose(C))
s = len(M)
print(s)
# A Matrix
A1 = numpy.concatenate((numpy.zeros((s, s)), numpy.identity(s)), axis=1)
A2 = numpy.concatenate((-numpy.dot(M_inv, K), -numpy.dot(M_inv, C)), axis=1)
A = numpy.concatenate((A1, A2), axis=0)

# B matrices

B12_row1 = [0, 0, 0, 0, 0, 0, 0, 0]
B12_row2 = [k2 / m2, c2 / m2, 0, 0, 0, 0, 0, 0]
B12_row3 = [0, 0, k4 / m3, c4 / m3, 0, 0, 0, 0]
B12_row4 = [0, 0, 0, 0, k6 / m4, c6 / m4, 0, 0]
B12_row5 = [0, 0, 0, 0, 0, 0, k8 / m5, c8 / m5]
B12_row6 = [0, 0, 0, 0, 0, 0, 0, 0]
B12_row7 = [0, 0, 0, 0, 0, 0, 0, 0]
sb12 = len(B12_row7)
B11 = numpy.zeros((s, sb12))
B12 = numpy.array((B12_row1, B12_row2, B12_row3, B12_row4, B12_row5, B12_row6, B12_row7))
B1 = numpy.concatenate((B11, B12), axis=0)


B22_row1 = numpy.array([1 / m1, 1 / m1, 0, 0])
B22_row2 = numpy.array([-1 / m2, 0, 0, 0])
B22_row3 = numpy.array([0, -1 / m3, 0, 0])
B22_row4 = numpy.array([0, 0, -1 / m2, 0])
B22_row5 = numpy.array([0, 0, 0, -1 / m3])
B22_row6 = numpy.array([-L1 / J1, L2 / J1, -L1 / J1, L2 / J1])
B22_row7 = numpy.array([-L3 / J2, -L3 / J2, L4 / J2, L4 / J2])
sb22 = len(B22_row7)
B21 = numpy.zeros((s, sb22))
B22 = numpy.array((B22_row1, B22_row2, B22_row3, B22_row4, B22_row5, B22_row6, B22_row7))
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
def full_car(x, t):
    w = numpy.transpose(numpy.array([1, 0, 1, 0, 1, 0, 1, 0]))  # disturbance function (step response)
    z = w[0] - x[0]  # error function
    kp1 = 50  # Controller Gain
    u = z * kp1 * numpy.transpose(numpy.array([0, 0, 0, 0]))  # Control Law
    dxdt = numpy.dot(A, x) + numpy.dot(B1, w) + numpy.dot(B2, u)  # State Space Representation of the  System

    return dxdt
    pass


# ode solver
tsim = numpy.linspace(0, 20, 1000)
init_x = numpy.transpose(numpy.array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]))

# Initialization
print("tutorial A")
print(numpy.dot(A, init_x))
print("tutorial B1")
print(numpy.dot(B1, numpy.transpose(numpy.array([1, 0, 1, 0, 1, 0, 1, 0]))))
print("tutorial B2")
print(numpy.dot(B2, numpy.transpose(numpy.array([0, 0, 0, 0]))))

# Solver
x_out = odeint(full_car, init_x, tsim)

# plots
plt.figure(1)
plt.plot(tsim, x_out)
plt.grid(True)
plt.xlabel("time(s)")
plt.ylabel("Response")
plt.title("Full Car Model Responses")
plt.legend(['x1 [m]', 'x2 [m]', 'x3 [m]', 'theta [rad]', 'dx1 [m/s]', 'dx2 [m/s]', 'dx3 [m/s]', 'dtheta [rad/s]'])
plt.show()
