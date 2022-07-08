iter = 5000; 
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];

plot3(C(1,:),C(2,:),C(3,:))
hold on

evol_num = 3;
for i=1:evol_num
    C = C + kappaB_Exp(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end
