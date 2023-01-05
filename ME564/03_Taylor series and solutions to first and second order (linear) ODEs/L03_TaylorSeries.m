clear all, close all
x = -10:.01:10;
y = sin(x);
plot(x,y,'k','LineWidth',2)
axis([-10 10 -10 10])
grid on, hold on

%% First-order Taylor expansion
P = [1 0]; % x + 0;
yT1 = polyval(P,x);
plot(x,yT1,'b--','LineWidth',1.2)

%% Third-order Taylor expansion
P = [-1/factorial(3) 0 1 0]; % -(1/3!)x^3 + x + 0;
yT3 = polyval(P,x);
plot(x,yT3,'r--','LineWidth',1.2)

%% Fifth-order Taylor expansion
P = [1/factorial(5) 0 -1/factorial(3) 0 1 0]; % -(1/3!)x^3 + x + 0;
yT5 = polyval(P,x);
plot(x,yT5,'g--','LineWidth',1.2)

%% Seventh-order Taylor expansion
P = [-1/factorial(7) 0 1/factorial(5) 0 -1/factorial(3) 0 1 0]; % -(1/3!)x^3 + x + 0;
yT7 = polyval(P,x);
plot(x,yT7,'m--','LineWidth',1.2)

%% Ninth-order Taylor expansion
P = [1/factorial(9) 0 -1/factorial(7) 0 1/factorial(5) 0 -1/factorial(3) 0 1 0]; % -(1/3!)x^3 + x + 0;
yT9 = polyval(P,x);
plot(x,yT9,'c--','LineWidth',1.2)