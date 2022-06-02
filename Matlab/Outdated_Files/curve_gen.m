%generators curve for given initial conditions and curvature + torsion. 
function [C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s,p)
    %tangent generation and s initialization
    s_dist = s(2) - s(1);
    [T,N,B] = tan_gen(T0,N0,B0,k,tau,s);

    %curve creation
    x = zeros(1,length(s));
    y = zeros(1,length(s));
    z = zeros(1,length(s));
    x(1) = C0(1);
    y(1) = C0(2);
    z(1) = C0(3);
    for i=2:length(s)
        
        x(i) = T(1,i -1)*s_dist+x(i - 1);
        y(i) = T(2,i -1)*s_dist+y(i - 1);
        z(i) = T(3,i -1)*s_dist+z(i - 1);
        
        %{
        x(i) = T(1,i -1)+x(i - 1);
        y(i) = T(2,i -1)+y(i - 1);
        z(i) = T(3,i -1)+z(i - 1);
        %}
        
    end
    C = [x;y;z];
    %plotting
    %
    if p == 1
        plot3(x,y,z)
        xlabel('x')
        ylabel('y')
        zlabel('z')
        title('Curve over given timespan')
    end
    

    %generates tangents of a function based on curvature and torsion 
    function [T,N,B] = tan_gen(T0,N0,B0,k,tau,s)
    %s_span = [s(1);s(end)];
    %Frenet-Serret Theorem for each dimension
    [~,X] = ode45(@TNB,s,[T0(1); N0(1);B0(1)]);
    [~,Y] = ode45(@TNB,s,[T0(2); N0(2);B0(2)]);
    [~,Z] = ode45(@TNB,s,[T0(3); N0(3);B0(3)]);
    T = [X(:,1),Y(:,1),Z(:,1)]'; 
    N = [X(:,2),Y(:,2),Z(:,2)]';
    B = [X(:,3),Y(:,3),Z(:,3)]';
    
    function dcdt = TNB(s,y)
        dcdt = [k(s)*y(2);-1*k(s)*y(1) + tau(s)*y(3); -1*tau(s)*y(2)];
    end
    
    end

end

