function V = Biot_Savart(C,T,p,flip)
%BIOT_SAVART(curve,tangent,curve point, flip bool) 
% DEF: Uses the Biot Savart integral to calculate the vector field at a
%  point. 
% TEST: Flip boolean is testing variable used for numerical integration.
    dV = zeros(3,length(C));
    s = 1:length(C); 
    
    for i = 1:length(C)
        dV(:,i) = cross(T(:,i),p - C(:,i))/((norm(p - C(:,i)))^3);
    end
    
    if flip == 1
        dV_temp = zeros(3,length(C)); 
        split = floor(length(C)/2);
        dV_temp(:,1:split) = dV(:,split + 1:end); 
        dV_temp(:,split+1:end) = dV(:,1:split); 
        dV = dV_temp; 
    end 
    
    V = trapz(s,dV,2);
end