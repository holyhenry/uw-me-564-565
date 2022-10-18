clear all, close all, clc

t = 0:.01:10;

y0 = [2; -3];


x = exp(-t)+exp(-2*t);
plot(t,x,'k');
hold on

A = [0 1; 
    -2 -3];
[t,y] = ode45(@(t,y) A*y, t, y0);
plot(t,y(:,1),'r--')
xlabel('Time [s]')
ylabel('Solution x')
legend('Analytic','ODE45')

%%  eigenvalues of A should be roots of characteristic equation!
eig(A)