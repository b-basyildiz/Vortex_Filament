function V = vfield_line(p,s_span)
%This is the analytic solution of a vector field of a straight line
V_0 =  (s_span(1)- p(3))/(p(1)^2 + p(2)^2 + sqrt((p(3)-s_span(1))^2 +p(1)^2 + p(2)^2))*[p(2);-1*p(1); 0];
V_1 = (s_span(2)- p(3))/(p(1)^2 + p(2)^2 + sqrt((p(3)-s_span(2))^2 +p(1)^2 + p(2)^2))*[p(2);-1*p(1); 0];
V = V_1 - V_0; 

