function DeltaC = kappaB(C)
%KAPPAB(curve) 
% DEF: Uses a kappa Binormal approximation to calculate the BSI integral. 
    T = Derivative(C); 
    kN = Derivative(T); 
    k = vecnorm(kN); 
    N = kN ./ k;
    B = cross(T,N);
    DeltaC = k .* B; 

end

