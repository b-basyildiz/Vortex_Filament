function Tau = torsion(N,B)
BPrime = tangent(B);
l = length(BPrime);
Tau = zeros(3,l);
for i=1:l
    Tau(i) = -mean(BPrime(:,i)./N(:,i));
end
        
        