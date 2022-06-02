T0 = [1,0,0];
N0 = [0,1,0];
B0 = [0,0,1];
k = 1;
tau = 1;
t_span = linspace(0,4*pi,100);
[t,x] = ode45(@TNB,t_span,[T0(1); N0(1);B0(1)]);
[t,y] = ode45(@TNB,t_span,[T0(2); N0(2);B0(2)]);
[t,z] = ode45(@TNB,t_span,[T0(3); N0(3);B0(3)]);

x1 = @(t) -1*sin(t);
y = @(t) cos(t);
z = @(t) 1;
hold on
plot(t_span,x(:,1))
plot(t_span,x1(t_span))
legend('Approx','Real')

function dcdt = TNB(t,y)
    k = 1;
    tau = 1;
    dcdt = [k*y(2);-k*y(1) + tau*y(3); -tau*y(2)];
end
