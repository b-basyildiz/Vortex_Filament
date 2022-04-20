iter = 500;
s = linspace(0, 2*pi, iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,iter-1); ys(s); zs(s)];
%C = [zeros(1,iter); ys(s); zs(s)];
T = tangent(C,s); 
p = zeros(3,iter-1);
hold on
for e=1:1
    for i=1:iter-1
        p(:,i) = V_Evol(C,T,C(:,i),s,i,e);
    end
    plot(s,p)
end

