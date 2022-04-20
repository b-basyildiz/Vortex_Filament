%This is for field evolution 
%Takes in Curve, Tangent, Point, S, and index I.  
function V = V_Evol(C,T,x,s,i,e)
    %Then find the index of the point, and take that index out of Curve &
    %Tangent matricies.

    del_w = e; 
    del_arr=  [i]; 
    for d =1:del_w
        if(i - d > 0)
            del_arr = [del_arr, i - d]; 
        else
            del_arr = [del_arr,length(C)+ (i-d)]; 
        end
    end
    
    for d = 1:del_w
        if(i+d <= length(C))
            del_arr = [del_arr,i+d];
        else
            del_arr = [del_arr,1+i+d-length(C)];
        end
    end
    C(:,del_arr)  = [];%deletion 
    T(:,del_arr) = []; 
    s(del_arr) = []; 
    
    %Then use V_int to find the vector at that point 
    V =V_int(C,T,x,s); 
