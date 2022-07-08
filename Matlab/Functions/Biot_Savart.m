function V = Biot_Savart(C,T,p,flip)
%BIOT_SAVART discretely calcuates the velocity vector for a given point,
%given a vorticity filament curve and its tangents. The flip variable is
%used to minimize the error from the trapeziodal quadrature. 
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