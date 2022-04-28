%iter_list = [2000,2500,5000,10000,50000];
%hold on
%for i = 1:length(iter_list)
%constants

s0 = -16*pi; 
t0 = 0;
tau0 = 1/2;
v = 1;
%coordinate equations for analytical
x = @(s,t) s - (2*mu/v)*tanh(v*(s-2*tau0*t)); 
y = @(s,t) real((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0 * s + (v^2 - tau0^2)*t));
z = @(s,t) imag((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0 * s + (v^2 - tau0^2)*t));
%Tangent 
Tx = @(s,t) 1 - 2*mu * sech(v*(s-2*tau0*t)).^2; 
Ty = @(s,t) real(-1*v*(2*mu/v * sech(v*(s-2*tau0*t))).*(tanh(v*(s-2*tau0*t)) - 1i*T).*exp(1i*tau0 * s + (v^2 - tau0^2)*t));
Tz = @(s,t) imag(-1*v*(2*mu/v * sech(v*(s-2*tau0*t))).*(tanh(v*(s-2*tau0*t)) - 1i*T).*exp(1i*tau0 * s + (v^2 - tau0^2)*t));
%Normal 
Nx = @(s,t) 2*mu*sech(v*(s-2*tau0*t)).^2 * sinh(v*(s-2*tau0*t));
Ny = @(s,t) real(-1* (1- 2*mu*(tanh(v*(s-2*tau0*t)) - 1i*T).*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 
Nz = @(s,t) imag(-1* (1- 2*mu*(tanh(v*(s-2*tau0*t)) - 1i*T).*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 
%Binormal
Bx = @(s,t) 2*mu*T*sech(v*(s-2*tau0*t));
By = @(s,t) real(1i*mu*(1-T^2 - 2*1i*T*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));
Bz = @(s,t) imag(1i*mu*(1-T^2 - 2*1i*T*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));

%constants
T0 = [Tx(s0,t0);Ty(s0,t0);Tz(s0,t0)];
N0 = [Nx(s0,t0); Ny(s0,t0); Nz(s0,t0)];
B0 = [Bx(s0,t0); By(s0,t0); Bz(s0,t0)];
C0 = [x(s0,t0);y(s0,t0);z(s0,t0)]; 

%curve generation
iter = 5000;
k = @(s) 2*v*sech(v*(s - 2*tau0*t0));
tau = @(s) tau0;
s = linspace(s0,-s0,iter); 
[C1,T1,N1,B1] = c_gen(C0,T0,N0,B0,k,tau,s);

%Analytical Solution Comparison

plot3(C1(1,:),C1(2,:),C1(3,:))
%{
hold on
plot3(x(s,t0),y(s,t0),z(s,t0))
legend('Approx','Analytical')
%}

%plot(s,vecnorm(C1 - [x(s,t0);y(s,t0);z(s,t0)]))


%multi-time plotting
%{
hold on

for i=1:2
    C_2 = Curve_Evol(C_1,T_1,s,1); 
    plot3(C_2(1,:),C_2(2,:),C_2(3,:))
    C_1 = C_2; 
    T_1 = tangent(C_1,s); 
end
legend('C1','C2','C3','C4')
%}

%{
C_act = [x(s,t); y(s,t); z(s,t)]; 
C_diff = C_act - C_1; 
plot(s,vecnorm(C_diff))
%}
%{
end
title("Iteration Count vs Error for t = 0")
xlabel('s value')
ylabel('Absolute Error')
legend('1000','2500','5000','10000','50000')
%}


kB = zeros(3,length(B));
for i=1:length(B)
    kB(:,i) = B(:,i)*k(s(i));
end
plot(s,k(s))
hold on
plot(s,vecnorm(kB))
legend('Act','Calc')
%}
