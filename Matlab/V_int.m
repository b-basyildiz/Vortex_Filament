%Calculates vector field at given point
function V = V_int(C,T,x,s)
    %r = zeros(3,1); 
    dV = zeros(3,length(s));
   for i = 1:length(s)
       r = x - C(:,i); 
       dV(:,i) = cross_product(r,T(:,i))/abs((norm(r))^3); 
   end
   V = trapz(s,dV,2);
end