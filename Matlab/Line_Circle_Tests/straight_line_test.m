%straight line test for Biot Savart Integral 
%line in terms of z 
iter = 500;
s_span = [-5 5];
s = linspace(s_span(1), s_span(2), iter);
C = [zeros(1,iter); zeros(1,iter); s];
T = tangent(C,s); 
%V = V_int(C,T,point,s);

%Now we will look at all the point a circle around z = 0, 
r = 2; 
x = @(t) r*cos(t); 
y = @(t) r*sin(t);
t = linspace(0,2*pi,iter); 
point_circle = [x(t);y(t);zeros(1,iter)];
%sum of vector points goes to zero, no change 
V_circle = zeros(3,iter); 
for i = 1:length(point_circle)
    V_circle(:,i) = V_int(C,T,point_circle(:,i),s); 
end
%V_sum = [trapz(V_circle(1,:)),trapz(V_circle(2,:)),trapz(V_circle(3,:))];
plot(t,V_circle)

%{
%Analytical Solution for the Straight Line
 %x plane 
 p0 = [-1;0;0];
 v_approx = zeros(3,iter);
 v_actual = zeros(3,iter); 
 for i=1:iter
     p = [-1+2*i*1/iter;0;0];
     v_approx(:,i) = V_int(C,T,p,s);
     v_actual(:,i) = vfield_line(p,s_span); 
 end
 plot(s,v_actual(2,:))

%}
 %{
 hold on
 plot(s,v_approx(2,:))
 legend('actual','approx')
 %}
