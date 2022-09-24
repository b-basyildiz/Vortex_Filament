function DeltaC = kappaB_Exp(C)
%KAPPAB This function uses an evolution of the curvature times the binormal
%curve plus an expansion 
    T = Derivative(C); 
    kN = Derivative(T); 
    k = vecnorm(kN); 
    N = kN ./ k;
    B = cross(T,N);
    DeltaC = (k .* B + k .* B.^3);
    DeltaC = DeltaC/length(C); 
end
