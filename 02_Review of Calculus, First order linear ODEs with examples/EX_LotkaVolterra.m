clear all; close all

dt = 0.01;
t = [0:dt:1000];

%% Population growth // Linear ODE x(t) = x(0) * exp(a*t)
a = .5;
x0 = 2;
x = x0 * exp(a*t);

LinearODE = @(t,x) [a*x];

[~,xt] = ode45(LinearODE,t,x0);

figure, box on, hold on
plot(t,x,'-k','LineWidth',2)
plot(t,xt,'--r','LineWidth',2)
xlabel('Time')
ylabel('Population size')
legend('analytical', 'numerical')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])
xlim([0 20])

%% Population growth with saturation // Logistic Eqn x(t) = C1/(1+C2*exp(-a*t))
% C1 = a/b, C2 = (a/b-x0)/x0
b = .025;
C1 = a/b; C2 = (C1-x0)/x0;
x = C1./(1+C2*exp(-a*t));

Logistic = @(t,x) [a*x-b*x^2];

[~,xt] = ode45(Logistic,t,x0);

figure, box on, hold on
plot(t,x,'-k','LineWidth',2)
plot(t,xt,'--r','LineWidth',2)
xlabel('Time')
ylabel('Population size')
legend('analytical', 'numerical')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])
xlim([0 20])

%% Two competing species // Lotka-Volterra equations
d = .005;
c = .5;
x0=[130; 50];

LotkaVolterra = @(t,x) [a*x(1)-b*x(1)*x(2);
                        -c*x(2)+d*x(1)*x(2)];
                                       
[~,xt] = ode45(LotkaVolterra,t,x0);

figure, box on, hold on
plot(t,xt,'-','LineWidth',2);
xlabel('Time')
ylabel('Population size')
legend('Prey', 'Predator')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])
xlim([0 50])

figure, box on, hold on
plot(xt(:,1),xt(:,2),'-','LineWidth',2);
xlabel('Prey')
ylabel('Predator')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])

%% With better accuracy

ode_options = odeset('RelTol',1e-10, 'AbsTol',1e-11);                    
[~,xt] = ode45(LotkaVolterra,t,x0,ode_options);

figure, box on, hold on
plot(xt(:,1),xt(:,2),'-','LineWidth',2);
xlabel('Prey')
ylabel('Predator')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])


%% For several initial conditions
x0_ensemble = [ 50, 10;
               100, 20;
               110, 25;
               150, 30;
               200, 40];

N = size(x0_ensemble,1);

xt = zeros(length(t),2,N);
for i = 1:N           
    [~,xt(:,1:2,i)] = ode45(LotkaVolterra,t,x0_ensemble(i,:)',ode_options);
end    

figure, box on, hold on
for i = 1:N
%     plot(xt(:,1,i),xt(:,2,i),'-','LineWidth',2);
    plot(xt(:,1,i),xt(:,2,i),'-x','LineWidth',2);
end
xlabel('Prey')
ylabel('Predator')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])    

%% Remove interaction
x0=[130; 50];

LotkaVolterra = @(t,x) [a*x(1); %-b*x(1)*x(2);
                        -c*x(2)]; %+d*x(1)*x(2)];
                                       
[~,xt] = ode45(LotkaVolterra,t,x0);

figure, box on, hold on
plot(t,xt,'-','LineWidth',2);
xlabel('Time')
ylabel('Population size')
legend('Prey', 'Predator')
set(gca,'FontSize',16,'LineWidth',2)
set(gcf,'Position',[400 400 600 400])
xlim([0 3])


