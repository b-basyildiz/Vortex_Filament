%Script that evolutions the vortex curve and plots it

%Circle making 
iter = 500;
s = linspace(0, 2*pi, iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,iter-1); ys(s); zs(s)];
%C = [zeros(1,iter); ys(s); zs(s)];
T = tangent(C,s); 

%First test iteration 

C_1 = C; 
plot3(C_1(1,:),C_1(2,:),C_1(3,:))

hold on
for e=2:4
    C_2 = Curve_Evol(C,T,s,e); 
    plot3(C_2(1,:),C_2(2,:),C_2(3,:))
end
%C_diff = C_2 -C_1;
%plot(C_diff(1,:))


