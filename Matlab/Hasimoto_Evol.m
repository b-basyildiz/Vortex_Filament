%iter_list = [2000,2500,5000,10000,50000];
%hold on
%for i = 1:length(iter_list)
T0 = [1;0;0];
N0 = [0,0.6,0.8];
B0 = [0,-0.8,0.6];
C0 = [-48.6655;0;0];
tau0 = 1/2;
v = 1;
t = 0;
%iter =iter_list(i);
iter = 5000;
k = @(s) 2*v*sech(v*(s - 2*tau0*t));
tau = @(s) tau0;
s_span = [-16*pi,16*pi];
[C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,0);

s = linspace(s_span(1),s_span(2),iter); 

C_1 = C'; 
T_1 = T'; 

plot3(C_1(1,:),C_1(2,:),C_1(3,:))
hold on

for i=1:2
    C_2 = Curve_Evol(C_1,T_1,s,1); 
    plot3(C_2(1,:),C_2(2,:),C_2(3,:))
    C_1 = C_2; 
    T_1 = tangent(C_1,s); 
end
legend('C1','C2','C3','C4')


%Constants
tau0 = 1/2;
v = 1;
mu = v^2/(v^2 + tau0^2); 
T = tau0/v; 

%coordinate equations good!
x = @(s,t) s - (2*mu/v)*tanh(v*(s-2*tau0*t)); 
y = @(s,t) real((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));
z = @(s,t) imag((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 

%graphing constants

%plot3(x(s,t),y(s,t),z(s,t))
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

