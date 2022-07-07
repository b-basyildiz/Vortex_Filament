iter = 5000; 
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];
eps = 0.001; %ad hoc 

plot3(C(1,:),C(2,:),C(3,:))
hold on

evol_num = 4;
for i=1:evol_num
    T = Derivative(C); 
    kN = Derivative(T); 
    kB = cross(T,kN);
    C = C + eps*kB;
    plot3(C(1,:),C(2,:),C(3,:))
end

