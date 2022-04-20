%Vortex Line Evolution
%Takes in Vorted Curve, Tangent, and S. Returns evolved Vortec Curve. 
function V = Curve_Evol(C,T,s,e)
    eps = 0.05; 
    iter = length(C); 
    Delta_C = zeros(size(C)); 
    for i = 1:iter
        x = C(:,i); 
        %V_Evol(C,T,x,s,i,iter);
        Delta_C(:,i) = V_Evol(C,T,x,s,i,e); 
    end
    V = C + eps*Delta_C; 