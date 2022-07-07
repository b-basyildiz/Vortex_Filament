%generators curve for given initial conditions and curvature + torsion. 
function [C,T,N,B] = Frenet_Serret(C0,T0,N0,B0,k,tau,s,t)
    [~,X] = ode89(@TNB,s,[C0(1);T0(1); N0(1);B0(1)]);
    [~,Y] = ode89(@TNB,s,[C0(2);T0(2); N0(2);B0(2)]);
    [~,Z] = ode89(@TNB,s,[C0(3);T0(3); N0(3);B0(3)]);
    C = [X(:,1),Y(:,1),Z(:,1)]'; 
    T = [X(:,2),Y(:,2),Z(:,2)]';
    N = [X(:,3),Y(:,3),Z(:,3)]';
    B = [X(:,4),Y(:,4),Z(:,4)]';
    
    function dcdt = TNB(s,y)
        dcdt = [y(2);k(s,t)*y(3);-1*k(s,t)*y(2) + tau(s)*y(4); -1*tau(s)*y(3)];
    end
    
end