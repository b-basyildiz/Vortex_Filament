iter = 5000;
C = Curve_Gen('ellipse',iter);
plot3(C(1,:),C(2,:),C(3,:))
hold on

evol_num = 3;
for i=1:evol_num
    C = C + kappaB_Exp(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end