clear

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

t = 0:0.01:4; %Array of time values

U = zeros(size(t)); %Zero single input of same size as t

x0 = [0.4; 0.2]; %Initial state vector

CharPoly = poly(A) %Find the characteristic polynomial from A

Poles = roots(CharPoly) %Find the system poles

Eigs0 = eig(A); %Calculate open-loop system eigenvalues

damp(A); %Calculate eigenvalues, zeta, and wn from ABCD

[Yo,t,Xo] = lsim(SysModel,U,t,x0); %Open-loop response

figure;
subplot(311), plot(t,Xo(:,1)); grid;
axis ([0 4 -0.2 0.5]);
set(gca, 'FontSize',18);
ylabel('{\itx}_1 (\itrad)')
subplot(312), plot(t,Xo(:,2)); grid; axis([0 4 -2 1]);
set(gca, 'FontSize',18);
xlabel('\ittime (sec)'); ylabel('{\itx}_2 (\itrad/s)');
subplot(313), plot(t,Yo); grid;
axis([0 4 -0.2 0.7]);
set(gca, 'FontSize',18);
ylabel('{\ity} (\itrad)'); xlabel('\ittime (sec)');


