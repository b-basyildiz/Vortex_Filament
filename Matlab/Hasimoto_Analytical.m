%constants
tau0 = 1/2;
v = 1;
mu = v^2/(v^2 + tau0^2); 
T = tau0/v; 

%s & t initialization
s0 = -16*pi; 
t0 = 0;


%coordinate equations good!
x = @(s,t) s - (2*mu/v)*tanh(v*(s-2*tau0*t)); 
y = @(s,t) real((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));
z = @(s,t) imag((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 

%graphing constants
iter =1000;
s_span = [-16*pi,16*pi];
ss = linspace(s_span(1),s_span(2),iter); 
tt = 0;

plot3(x(ss,tt),y(ss,tt),z(ss,tt))


%Tangent 
Tx = @(s,t) 1 - 2*mu * sech(v*(s-2*tau0*t)).^2; 
Ty = @(s,t) real(-1*v*(2*mu/v * sech(v*(s-2*tau0*t)))*(tanh(v*(s-2*tau0*t)) - 1i*T).*exp(1i*tau0*s + (v^2 - tau0^2)*t));
Tz = @(s,t) imag(-1*v*(2*mu/v * sech(v*(s-2*tau0*t)))*(tanh(v*(s-2*tau0*t)) - 1i*T).*exp(1i*tau0*s + (v^2 - tau0^2)*t));
T0 = [Tx(s0,t0);Ty(s0,t0);Tz(s0,t0)]; 

%Normal 
Nx = @(s,t) 2*mu*sech(v*(s-2*tau0*t)).^2 * sinh(v*(s-2*tau0*t));
Ny = @(s,t) real(-1* (1- 2*mu*(tanh(v*(s-2*tau0*t)) - 1i*T).*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 
Nz = @(s,t) imag(-1* (1- 2*mu*(tanh(v*(s-2*tau0*t)) - 1i*T).*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t)); 
N0 = [Nx(s0,t0); Ny(s0,t0); Nz(s0,t0)]; 

%Binormal
Bx = @(s,t) 2*mu*T*sech(v*(s-2*tau0*t));
By = @(s,t) real(1i*mu*(1-T^2 - 2*1i*T*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));
Bz = @(s,t) imag(1i*mu*(1-T^2 - 2*1i*T*tanh(v*(s-2*tau0*t))) .* exp(1i*tau0*s + (v^2 - tau0^2)*t));
B0 = [Bx(s0,t0); By(s0,t0); Bz(s0,t0)];

C0 = [x(s0,t0);y(s0,t0);z(s0,t0)];


%Hasimoto parts
%{
r = 2*mu/v*sech(eta)
eta = v*(s - 2*tau0*t)
%}
