
C = Curve_Gen('circle',1000); 

plot3(C(1,:),C(2,:),C(3,:))
hold on 

evol_num = 2;
for i=1:evol_num
    C = C + BSI_Evol(C); 
    plot3(C(1,:),C(2,:),C(3,:))
end



    









