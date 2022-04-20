%generates tangents of a function based on curvature and torsion 
function [T,N,B] = tan_gen(T0,N0,B0,k,tau,t_span)

%Frenet-Serret Theorem for each dimension
[s,x] = ode45(@TNB,t_span,[T0(1); N0(1);B0(1)]);
[s,y] = ode45(@TNB,t_span,[T0(2); N0(2);B0(2)]);
[s,z] = ode45(@TNB,t_span,[T0(3); N0(3);B0(3)]);

T = [x(:,1),y(:,1),z(:,1)];
N = [x(:,2),y(:,2),z(:,2)];
B = [x(:,3),y(:,3),z(:,3)];

function dcdt = TNB(s,y)
    dcdt = [k(s)*y(2);-k(s)*y(1) + tau(s)*y(3); -tau(s)*y(2)];
end

end