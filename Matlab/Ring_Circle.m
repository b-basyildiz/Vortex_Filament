%Script that evolutions the vortex curve and plots it

%Circle making 
iter = 500; % we need iteration # + 1 so that we don't overlap at the end point
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C0 = [zeros(1,length(s));ys(s);zs(s)];
h = 2*pi*abs(s(2) - s(1)); 
T = Derivative(C0,h);


%First test iteration 
%{
C1 = BSI_Evol(C0,s); 

plot3(C0(1,:),C0(2,:),C0(3,:))
hold on
plot3(C1(1,:),C1(2,:),C1(3,:))
%}

%individual Curve evolution error checking 

V = zeros(3,iter);
%{
for i=1:1
    V(:,i) = Biot_Savart(C0,Derivative(C0,h),C0(:,i),s);
end
%}
%plot(V(1,:))

i = 50;
p = C0(:,i);
C0(:,i) = [];
T(:,i) = [];
s(i) = [];
Biot_Savart(C0,T,p,s);







