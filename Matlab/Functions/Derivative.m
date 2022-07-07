function T = Derivative(C)
%
l = length(C); 
T = zeros(3,l);
h = norm(C(:,2) - C(:,1));

%First two steps need to be spectral to start BDF2

T(:,1) = sum(C(:,1:10).*fdcoeffF(1,0,0:9),2)/h; 
T(:,2) = sum(C(:,2:11).*fdcoeffF(1,1,1:10),2)/h; 

%BDF2 Steps
for i = 3:l
    T(:,i) = (1/(2*h)) * (3*C(:,i) - 4*C(:,i-1) + C(:,i-2));
end





        

    