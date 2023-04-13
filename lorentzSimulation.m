clc;
clear;
close all;
%% define parameters
constants=[10;28;8/3]; % Sigma, Rho, Beta
x01 = [0;1;20]; % first primary conditions
x02 = x01 + 0.1; % second primary conditions
tspan = 0:.01:30; % time of simulation
%% solve equations with ode45
[~,X1] = ode45(@(t,x)lorentz(t,x,constants),tspan,x01);
[~,X2] = ode45(@(t,x)lorentz(t,x,constants),tspan,x02);
%% vector fields
[x,y,z] = meshgrid(-20:5:30);
u = zeros(size(x));
v = zeros(size(y));
w = zeros(size(z));
m = 0;
for i = 1:numel(x)
   xprim = lorentz(m,[x(i);y(i);z(i)],constants);
   u(i) = xprim(1);
   v(i) = xprim(2);
   w(i) = xprim(3);
end
%% plots
figure % X-Y-Z plot (3D)
plot3(X1(:,1),X1(:,2),X1(:,3))
hold on; grid on
quiver3(x,y,z,u,v,w,'r')% plot vector fields
xlabel('x1')
ylabel('x2')
zlabel('x3')
title('Lorentz')
figure % difference between two primary conditon
e = X1(:,1)-X2(:,1); % error
plot(tspan,X1(:,1)','LineWidth',1.5)
hold on; grid on
plot(tspan,X2(:,1)','LineWidth',1.5)
xlabel('Time')
ylabel('x(t)')
legend({'first primary condition','second primary condition'})
title({'Chaos Behavior',['Maximume error: ' num2str(max(e))]})
figure % plot x' and x (first p condition)
plot(X1(:,1),X1(:,2))
grid on
xlabel('x')
ylabel('xprim')