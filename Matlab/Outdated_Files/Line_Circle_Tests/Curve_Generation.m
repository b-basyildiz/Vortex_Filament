%using Numerical_Curves script curve 
k = @(s) 1/sqrt(2);
tau = @(s) 1/sqrt(2);
iter = 1000;
t_span = linspace(0,4*pi,iter);
t_dist = (t_span(2) - t_span(1));
T0 = [0,1,1];
N0 = [-sqrt(2),0,0];
B0 = [0,-1,1];
C0 = [1,0,0];
[T,N,B] = tan_gen(T0,N0,B0,k,tau,t_span);
x = zeros(1,iter);
y = zeros(1,iter);
z = zeros(1,iter);
x(1) = C0(1);
y(1) = C0(2);
z(1) = C0(3);
for i=2:iter
    x(i) = T(i -1,1)*t_dist+x(i - 1);
    y(i) = T(i -1,2)*t_dist+y(i - 1);
    z(i) = T(i -1,3)*t_dist+z(i - 1);
end

plot3(x,y,z)

xf = @(t) cos(t);
yf = @(t) sin(t);
zf = @(t) t;
%plotting 

hold on
fplot3(xf,yf,zf,[0,4*pi])
title('Approximation vs. Curve')
legend('Approximation','Curve')
xlabel('x')
ylabel('y')
zlabel('z')

%{
%curvature(K) and torsion(tau)
K =curvature(N.');
%Tau = torsion(N,B);
TPrime = tangent(T,t_span);
N(iter,:) = [];
K_error = mean((mean(abs(TPrime - k*N))))
BPrime = tangent(B,t_span);
B(iter,:) = [];
B_error = mean(mean(abs(BPrime + tau*N)))

%}

