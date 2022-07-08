function DeltaC = kappaB(C)
%KAPPAB This function uses an evolution of the curvature times the binormal
%curve 
    T = Derivative(C); 
    kN = Derivative(T); 
    k = vecnorm(kN); 
    N = kN ./ k;
    B = cross(T,N);
    DeltaC = 1/length(C) * k .* B; 

end

