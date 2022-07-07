function Delta_C = BSI_Evol(C)
    %BSI_EVOL generates the next timestep of a curve using the Biot Savart
    %Integral
    
    Delta_C = zeros(size(C));
    
    for i = 1:length(C)
        p = C(:,i); 
        T = Derivative(C); 
        Delta_C(:,i) = V_Evol(C,T,p,i);
    end
    Delta_C = 1/length(C) * Delta_C;
    
    function V = V_Evol(C,T,p,i)
        %V_Evol is a helper function that removes the respective point we
        %are taking the BSI off so that a singularity does not arise.
        %V_Evol uses flip to minimize the trapezoidal error (see 
        %Biot_Savart for details). 
        
        C(:,i)  = [];
        T(:,i) = []; 
        
        flip = 0;
        if i < length(C)*0.3 || i > length(C)*0.7
            flip = 0;
        end 
        
        V =Biot_Savart(C,T,p,flip);
    end
end

