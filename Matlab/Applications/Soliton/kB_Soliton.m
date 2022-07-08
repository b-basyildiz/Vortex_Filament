%Curve Generation
iter = 5000;
C = Curve_Gen(iter,'soliton'); 
%Evolution
plot3(C(1,:),C(2,:),C(3,:))
hold on
evol_num = 1;
for i=1:evol_num
    C = C + kappaB(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end