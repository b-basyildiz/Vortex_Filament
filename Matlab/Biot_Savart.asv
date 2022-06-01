%Calculates vector field at given point
function V = Biot_Savart(C,T,p,s)
    dV = zeros(3,length(s));
    for i = 1:length(s)
        dV(:,i) = cross(T(:,i),p - C(:,i))/((norm(p - C(:,i)))^3);
    end
    %dV(isnan(dV)) = 0;
    dV
    V = trapz(s,dV,2);
    plot(dV(1,:))
    end