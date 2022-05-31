%Calculates vector field at given point
function V = Biot_Savart(C,T,x,s)
    dV = zeros(3,length(s));
   for i = 1:length(s)
       dV(:,i) = cross(T(:,i),x - C(:,i))/((norm(x - C(:,i)))^3); 
   end
   V = trapz(s,dV,2);
end