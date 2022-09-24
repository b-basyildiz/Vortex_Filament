C1 = Curve_Gen('circle',500);
s = 1:length(C1); 
T1 = Derivative(C1); 
C1xInterpolate = griddedInterpolant(s,C1(1,:));
C1yInterpolate = griddedInterpolant(s,C1(2,:));
C1zInterpolate = griddedInterpolant(s,C1(3,:));
T1xInterpolate = griddedInterpolant(s,T1(1,:));
T1yInterpolate = griddedInterpolant(s,T1(2,:));
T1zInterpolate = griddedInterpolant(s,T1(3,:));
% fplot(@(s) C1yInterpolate(s),[s0,-s0]);
% plot3(C1(1,:),C1(2,:),C1(3,:));
 
% Work out cross product and define the vector
%
% p=[N1xInterpolate(0),N1yInterpolate(0),N1zInterpolate(0)]-[C1xInterpolate(0),C1yInterpolate(0),C1zInterpolate(0)];
 
 
eps=0.001;
p=[-1-eps/10,0,0]; %point we are looking at 
eps = 50; 
%{
plot3(C1(1,:),C1(2,:),C1(3,:))
hold on
plot3(p(1),p(2),p(3),'x')
xlabel('x')
ylabel('y')
hold off
%}
numeratorCross1 = @(s) (p(2)-C1yInterpolate(s)).*T1zInterpolate(s)-(p(3)-C1zInterpolate(s)).*T1yInterpolate(s);
numeratorCross2 = @(s) (p(3)-C1zInterpolate(s)).*T1xInterpolate(s)-(p(1)-C1xInterpolate(s)).*T1zInterpolate(s);
numeratorCross3 = @(s) (p(1)-C1xInterpolate(s)).*T1yInterpolate(s)-(p(2)-C1yInterpolate(s)).*T1xInterpolate(s);
denominator = @(s) norm([p(1)- C1xInterpolate(s),p(2)-C1yInterpolate(s),p(3)-C1zInterpolate(s)]).^3;
integrandX = @(s) numeratorCross1(s)./denominator(s);
integrandY = @(s) numeratorCross2(s)./denominator(s);
integrandZ = @(s) numeratorCross3(s)./denominator(s);
 
integral(integrandX,min(C1(1,:)),max(C1(1,:))) %what about these eps values 
integral(integrandY,min(C1(2,:)),max(C1(2,:)))
integral(integrandZ,min(C1(3,:)),max(C1(3,:)))

%okay now how do we implement this 
