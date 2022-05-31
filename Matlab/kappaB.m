function DeltaC = kappaB(k,T,s,t)
%KAPPAB This function uses an evolution of the curvature times the binormal
%curve 

%We respectively need k to be nonzero for this function to work
%Could use complicated tangent function to optimize 
N = tangent(T,s)./k(s,t); 
B = cross(T,N);
DeltaC = k(s,t).*B; 

end

