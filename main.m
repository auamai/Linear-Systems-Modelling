%{
This is a model of a simple rotational mechanical system with a single
input and single output
%}

%System parameters 
J = 1; %Motor shaft polar inertia (kg-m^2)
b = 4; %Motor shaft damping constant (N-m-s)
kR = 40; %Torsional spring constant (N-m/rad)

A = [0 1; (-kR/J) (-b/J)]; %System Matrix
B = [0; 1/J]; %Input Matrix
C = [1 0]; %Output Matrix
D = 0; %Feedforward Matrix

%State-space model definition
SysModel = ss(A,B,C,D);

% SysModeltf = tf(SysModel);

% SysModelzpk = zpk(SysModel);

% [num,den] = tfdata(SysModel, 'v');
% [z,p,k] = zpkdata(SysModel, 'v');

% SysModelss = ss(SysModeltf);
