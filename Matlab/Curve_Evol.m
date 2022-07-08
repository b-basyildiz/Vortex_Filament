function [] = Curve_Evol(c_type,f_type,iter,evol_num)
%CURVE_EVOL evolves a respective curve type through a given function type
%an indicate number of times. 
    C = Curve_Gen(iter,c_type); 

    plot3(C(1,:),C(2,:),C(3,:))
    hold on

    for i=1:evol_num
        Delta_C = zeros(size(C)); 
        switch lower(f_type)
            case 'bsi'
                Delta_C = BSI_Evol(C);
            case 'kb'
                Delta_C = kappaB(C);
            case 'kb+'
                Delta_C = kappaB_Exp(C); 
            otherwise
                error('Specified Function %s is not able to be used. \nSelect one of the following curves {BSI, kB, kB+}',f_type)
            
        end
        C = C + Delta_C;
        plot3(C(1,:),C(2,:),C(3,:))
    end

    hold off
end

