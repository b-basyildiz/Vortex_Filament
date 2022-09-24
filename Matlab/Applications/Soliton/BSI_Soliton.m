iter = 1000;
C = Curve_Gen('soliton',iter);
plot3(C(1,:),C(2,:),C(3,:))
hold on
evol_num = 10; 
for i=1:evol_num
    C = C + BSI_Evol(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end
