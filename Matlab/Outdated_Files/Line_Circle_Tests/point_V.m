%calculates vector field on the s curve
function V = point_V(p,C,T,s)
    %produce cirlce around point in C
    esp = 0.01; 
    iter = 100; 
    q = linsapce(0,2*pi,iter);
    tol = 10^(-4); 
    for c = C
        x_esp = @(q) esp*cos(q) + p(1);
        y_esp = @(q) esp*sin(q) + p(2); 
        esp_circle = [x_esp(q),y_esp(q),zeros(1,iter) + p(3)];
        delete_list = [];
        for ec = esp_circle
            for c = C
                if norm(ec - c) < tol
                    delete_list = [delete_list ec];
                    return
                end
            end
        end
        filter = ismember(esp_circle,delete_list);
        esp_filt = esp_circle(filter); 
        V = [zeros(1,length(esp_filt)),zeros(1,length(esp_filt)),zeros(1,length(esp_filt))];
        i = 1;
        for e = esp_filt
            V(:,i) = V_int(C,T,e,s); 
        end
    end
end