function C_out = BSI_Evol(C,s)
    %BSI_EVOL generates the next timestep of a curve.
    
    %ad hoc parameters
    eps = 0.05; 
    delta = 0.0001; 
    
    Delta_C = zeros(size(C));
    h = abs(s(2) - s(1)); 
    
    for i = 1:length(C)
        p = C(:,i); 
        T = Derivative(C,h); 
        %Delta_C(:,i) = Biot_Savart(C,Derivative(C,h),x,s);
        Delta_C(:,i) = V_Evol(C,T,p,s,i);
    end
    
    C_out = C + eps*Delta_C;
    function V = V_Evol(C,T,p,s,i)
        C(:,i)  = [];%deletion 
        T(:,i) = []; 
        s(i) = [];

        %Then use Biot_Savart to find the vector at that point 
        V =Biot_Savart(C,T,p,s); 
    end
end

