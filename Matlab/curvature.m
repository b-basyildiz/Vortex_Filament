function C = curvature(N)
l = length(N);
C = zeros(1,l);
for i = 1:l
    C(:,i) = norm(N(:,i));
end
    