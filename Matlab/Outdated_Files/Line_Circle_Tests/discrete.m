function D = discrete(x,y,z,a,b,gamma)
%Discritization
length = ceil((b - a)/gamma);
D = zeros(3,length);
k = 1;
for j=a:gamma:b
    D(1,k) = x(j);
    k = k + 1;
end
k = 1;
for j=a:gamma:b
    D(2,k) = y(j);
    k = k + 1;
end
k = 1;
for j=a:gamma:b
    D(3,k) = z(j);
    k = k + 1;
end


