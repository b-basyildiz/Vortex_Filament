%Script that evolutions the vortex curve and plots it
format long

%Circle making 
iter = 15000; 
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];
%h = 2*pi*abs(s(2) - s(1)); 
eps = 10^(-8); %ad hoc 

plot3(C(1,:),C(2,:),C(3,:))
hold on
for i=1:3
    C = C + eps*BSI_Evol(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end

    









