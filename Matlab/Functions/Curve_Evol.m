function [] = Curve_Evol(c_type,f_type,iter,evol_num)
%CURVE_EVOL(curve type, function type, # points, # evolutions) 
% DEF: Evolves a curve through a function. 
% Curve types: {'circle', 'ellipse', 'soliton', 'rough ring', 'ring soliton'}
% Function types: {'BSI', kB, kB+} 
    format long
    C = Curve_Gen(c_type,iter); 
    plot3(C(1,:),C(2,:),C(3,:))
    %k = 1;
    k = 1/length(C); %can be changed 
    k = k^2;
    %Adams Bashforth 
    C1 = [];
    C2 = [];
    Ct = []; 
    dC = []; 
    hold on
    for i=1:evol_num
        dC = zeros(size(C)); 
        switch lower(f_type)
            case 'bsi'
                % Runge Kutta 4 
                V1 = BSI_Evol(C);
                V2 = BSI_Evol(C + k/2 * V1);
                V3 = BSI_Evol(C + k/2 * V2);
                V4 = BSI_Evol(C + k*V3); 
                dC = V1/6 + V2/3 + V3/3 + V4/6; 
                if i == 1
                    C2 = C + k*dC;  
                    C1 = C2; 
                elseif i == 2
                    C1 = C + k*dC; 
                end
                %If we have enough points, use AM4
                if i > 2 
                    Ct = C + k*dC;
                    dC = 1/24 * (BSI_Evol(C2) - 5*BSI_Evol(C1) + 19*BSI_Evol(C) + 9*BSI_Evol(Ct)); 
                    C2 = C1;
                    C1 = C + k*dC;
                end
            case 'kb'
                % Runge Kutta 4 
                V1 = kappaB(C);
                V2 = kappaB(C + k/2 * V1);
                V3 = kappaB(C + k/2 * V2);
                V4 = kappaB(C + k*V3); 
                dC = V1/6 + V2/3 + V3/3 + V4/6; 
                if i == 1
                    C2 = C + k*dC;  
                    C1 = C2; 
                elseif i == 2
                    C1 = C + k*dC; 
                end
                if i > 2 %If we have enough points, use AM4
                    Ct = C + k*dC;
                    dC = 1/24 * (kappaB(C2) - 5*kappaB(C1) + 19*kappaB(C) + 9*kappaB(Ct)); 
                    C2 = C1;
                    C1 = C + k*dC;
                end
            case 'kb+'
                % Runge Kutta 4 
                V1 = kappaB_Exp(C);
                V2 = kappaB_Exp(C + k/2 * V1);
                V3 = kappaB_Exp(C + k/2 * V2);
                V4 = kappaB_Exp(C + k*V3); 
                dC = V1/6 + V2/3 + V3/3 + V4/6; 
                if i == 1
                    C2 = C + k*dC;  
                    C1 = C2; 
                elseif i == 2
                    C1 = C + k*dC; 
                end
                if i > 2 %If we have enough points, use AM4
                    Ct = C + k*dC;
                    dC = 1/24 * (kappaB_Exp(C2) - 5*kappaB_Exp(C1) + 19*kappaB_Exp(C) + 9*kappaB_Exp(Ct)); 
                    C2 = C1;
                    C1 = C + k*dC;
                end
            otherwise
                error('Specified Function %s is not able to be used. \nSelect one of the following curves {BSI, kB, kB+}',f_type)
            
        end
        C = C1; 
        plot3(C(1,:),C(2,:),C(3,:))
    end
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(f_type + " evolution of " + c_type + " (" + iter + " pts, " + evol_num + " evols)")
    hold off
    
end

