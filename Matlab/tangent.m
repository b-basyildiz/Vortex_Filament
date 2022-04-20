function T = tangent(D,s)
%make better difference method soon 
l = length(D); 
T = zeros(3,l);
h = abs(s(2) - s(1)); 
for i = 1:(l - 1)
    T(:,i) = (D(:,i+1) - D(:,i))/h;
end
%last tangent is approx the other tangent
T(:,l) = T(:,l-1);
    