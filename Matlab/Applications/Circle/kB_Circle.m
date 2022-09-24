%Curve Generation
iter = 500;
C = Curve_Gen('circle',iter); 
%Evolution
plot3(C(1,:),C(2,:),C(3,:))
hold on
evol_num = 2;
for i=1:evol_num
    C = C + kappaB(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end

