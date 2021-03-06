function [] = Curve_Evol(c_type,f_type,iter,evol_num)
%CURVE_EVOL(curve type, function type, # points, # evolutions) 
% DEF: Evolves a curve through a function. 
% Curve types: {'circle', 'ellipse', 'soliton', 'rough ring', 'ring soliton'}
% Function types: {'BSI', kB, kB+} 
    format long
    C = Curve_Gen(c_type,iter); 
    plot3(C(1,:),C(2,:),C(3,:))
    k = 1/length(C); %can be changed 
    k = k^2;
    hold on
    pdC = []; %previous dC values
    for i=1:evol_num
        dC = zeros(size(C)); 
        switch lower(f_type)
            case 'bsi'
                if i < 4
                    V1 = BSI_Evol(C);
                    V2 = BSI_Evol(C + k/2 * V1);
                    V3 = BSI_Evol(C + k/2 * V2);
                    dC = BSI_Evol(C + k*V3); 
                    pdC = [pdC,dC];
                else
                    dC = 1/24 * (-9*pdC(:,1:length(C)) + 37*pdC(:,length(C)+1:2*length(C)) - 59*pdC(:,2*length(C)+1:end) + 55*BSI_Evol(C));
                    pdC(:,1:2*length(C)) = pdC(:,length(C)+1:end);
                    pdC(:,2*length(C)+1:end) = dC;
                end
            case 'kb'
                dC = kappaB(C);
                if i < 4
                    V1 = kappaB(C);
                    V2 = kappaB(C + k/2 * V1);
                    V3 = kappaB(C + k/2 * V2);
                    dC = kappaB(C + k*V3);  
                    pdC = [pdC,dC];
                else
                    dC = 1/24 * (-9*pdC(:,1:length(C)) + 37*pdC(:,length(C)+1:2*length(C)) - 59*pdC(:,2*length(C)+1:end) + 55*kappaB(C));
                    pdC(:,1:2*length(C)) = pdC(:,length(C)+1:end);
                    pdC(:,2*length(C)+1:end) = dC;
                end
            case 'kb+'
                dC = kappaB_Exp(C); 
                if i < 4
                    V1 = kappaB_Exp(C);
                    V2 = kappaB_Exp(C + k/2 * V1);
                    V3 = kappaB_Exp(C + k/2 * V2);
                    dC = kappaB_Exp(C + k*V3);
                    pdC = [pdC,dC];
                else
                    dC = 1/24 * (-9*pdC(:,1:length(C)) + 37*pdC(:,length(C)+1:2*length(C)) - 59*pdC(:,2*length(C)+1:end) + 55*kappaB_Exp(C));
                    pdC(:,1:length(C)) = dC; 
                end
            otherwise
                error('Specified Function %s is not able to be used. \nSelect one of the following curves {BSI, kB, kB+}',f_type)
            
        end
        C = C + k*dC;
        plot3(C(1,:),C(2,:),C(3,:))
    end
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(f_type + " evolution of " + c_type + " (" + iter + " pts, " + evol_num + " evols)")
    hold off
    
end

