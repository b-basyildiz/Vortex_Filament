%Script that evolutions the vortex curve and plots it

%Circle making 
iter = 100000; % we need iteration # + 1 so that we don't overlap at the end point
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];
h = 2*pi*abs(s(2) - s(1)); 
T = Derivative(C,h); 


%First test iteration 

C1 = C; 

C2 = BSI_Evol(C1,s); 


plot3(C1(1,:),C1(2,:),C1(3,:))
hold on
plot3(C2(1,:),C2(2,:),C2(3,:))

%{
diff = C2 - C1;
plot(s,diff(1,:))
title('Diff in BSI Evolution with BDF2')
xlabel('s')
ylabel('Difference')
%}



