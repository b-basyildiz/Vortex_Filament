function V = BSInterpolate(C,T,p)
%BIOT_SAVART(curve,tangent,curve point, curve paramerization) 
% DEF: Uses the Biot Savart integral to calculate the vector field at a
%  point. 
% TEST: Flip boolean is testing variable used for numerical integration.
s = 1:length(C); 
CxInterpolate = griddedInterpolant(s,C(1,:));
CyInterpolate = griddedInterpolant(s,C(2,:));
CzInterpolate = griddedInterpolant(s,C(3,:));
TxInterpolate = griddedInterpolant(s,T(1,:));
TyInterpolate = griddedInterpolant(s,T(2,:));
TzInterpolate = griddedInterpolant(s,T(3,:));

numeratorCross1 = @(s) (p(2)-CyInterpolate(s)).*TzInterpolate(s)-(p(3)-CzInterpolate(s)).*TyInterpolate(s);
numeratorCross2 = @(s) (p(3)-CzInterpolate(s)).*TxInterpolate(s)-(p(1)-CxInterpolate(s)).*TzInterpolate(s);
numeratorCross3 = @(s) (p(1)-CxInterpolate(s)).*TyInterpolate(s)-(p(2)-CyInterpolate(s)).*TxInterpolate(s);
denominator = @(s) norm([p(1)- CxInterpolate(s),p(2)-CyInterpolate(s),p(3)-CzInterpolate(s)]).^3;
integrandX = @(s) numeratorCross1(s)./denominator(s);
integrandY = @(s) numeratorCross2(s)./denominator(s);
integrandZ = @(s) numeratorCross3(s)./denominator(s);

eps=1;
V = [integral(integrandX,p(1)-eps,p(1)+eps) 
integral(integrandY,p(2)-eps,p(2)+eps)
integral(integrandZ,p(3)-eps,p(3)+eps)];
%V = V * length(C) * length(C); 

end