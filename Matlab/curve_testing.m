%Initial conditions and generation for base vorteex
%{
T0 = [0,1,1];
N0 = [-sqrt(2),0,0];
B0 = [0,-1,1];
C0 = [1,0,0];
k = @(s) 1/sqrt(2);
tau = @(s) 1/sqrt(2);
s_span = [0,16*pi];
iter =500;
s = linspace(s_span(1),s_span(2),iter);
[C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,0);
%V = V_int(C',T',[0;0;8*pi],s)
V = V_int(C',T',[0;0;8*pi],s);
V_sum = 0;
for i=1:length(s)
    V_sum = V_sum + V_int(C',T',[0;0;s(i)],s);
end
V_sum
%legend('x','y','z')
%}
%{
plot3(C(:,1),C(:,2),C(:,3))
hold on
plot3(zeros(1,iter),zeros(1,iter),s)
%}

%Initial conditions for Hasimoto Transfer

T0 = [1,0,0];
N0 = [0,1,0];
B0 = [0,0,1];
C0 = [1,0,0];
c = 1;
v = 1;
t = 0;
iter =1000;
k = @(s) 2*v*sech(v*(s - c*t));
tau = @(s) 1/2*c;
s_span = [-2*pi,2*pi];
s = linspace(-2*pi,2*pi,1000); 
[C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,1);
%V = V_int(C,T,[1,1,1],s)


%testing arclength concergence
%{
t_iter = 0.1;
t_span = -2*pi:t_iter:2*pi; 
arc = zeros(length(t_span),1);
for i=1:length(t_span)
    t = t_span(i);
    [C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,0);
    arc(i) = norm(T);
end
if(arc == arc(1))
    arc(1) 
end
%}

%{
T0 = [0,0,1];
N0 = [1,0,0];
B0 = [0,1,0];
C0 = [1,0,0];
k = 0;
tau = 0;
t_span = [0,4*pi];
iter =1000;
s_span = [-2*pi,2*pi];
[C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,1);
%}
