c = 1;
v = 1;
t = 0;
k = @(s) 2*v*sech(v*(s - c*t));
s_span = linspace(0,4*pi);
plot(s_span,k(s_span))