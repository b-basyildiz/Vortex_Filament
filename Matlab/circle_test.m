%straight line test for Biot Savart Integral 
%line in terms of z 
iter = 500;
s_span = [0 2*pi];
s = linspace(s_span(1), s_span(2), iter);
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,iter); ys(s); zs(s)];
T = tangent(C,s); 

%Now we will look at all the point a circle around z = 1/2 
r = 2; 
x = @(t) r*cos(t); 
y = @(t) r*sin(t);
t = linspace(0,2*pi,iter); 
point_circle = [x(t);y(t);zeros(1,iter)];
%plotting 

%{
plot3(C(1,:),C(2,:),C(3,:))
hold on 
plot3(point_circle(1,:),point_circle(2,:),point_circle(3,:))
legend('vortex','points')
xlabel('x')
ylabel('y')
zlabel('z')
%}
%}
%sum of vector points goes to zero, no change 

V_circle = zeros(3,iter); 
for i = 1:length(point_circle)
    V_circle(:,i) = V_int(C,T,point_circle(:,i),s); 
end
plot(t,V_circle)
