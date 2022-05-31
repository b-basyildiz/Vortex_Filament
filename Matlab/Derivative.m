function T = Derivative(C,h)
%This function takes in a curve and 
l = length(C); 
T = zeros(3,l);

%This is the most rudimentary finite differnce method,
%using a two steps of a forward Euler and then the BDF2 method

%Forward Euler Steps

T(:,1) = (C(:,2) - C(:,1))/h; 
T(:,2) = (C(:,3) - C(:,2))/h; 
%BDF2 Steps
for i = 3:l
    T(:,i) = (1/(2*h)) * (3*C(:,i) - 4*C(:,i-1) + C(:,i-2));
end



%Spectral Methods 
%The accuracy of these methods can be increased by using more points, but
%the computational time will increase. 
%{
d = 5;
for i = 1:l
    lb = 0;ub=0;
    if i <= d
        lb = 1 - i;
        ub = 2*d + 1 - i;
    else
        lb = -d;
        ub = d;
    end
        
    coeff = fdcoeffF(1,0,lb:ub);
    coeff(isnan(coeff))=0;
    T(:,i) = sum(C .* coeff,2); 
end
%}




        

    