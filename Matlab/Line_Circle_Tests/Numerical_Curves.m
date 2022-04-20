%defining start and end
a = 0;
b = 4*pi;
%function definitions change time to s
x = @(t) cos(t);
y = @(t) sin(t);
z = @(t) t;
%plotting 
%{
fplot3(x,y,z,[0,4*pi])
D = discrete(x,y,z,a,b,0.1);
hold on
plot3(D(1,:),D(2,:),D(3,:),'r*')
%}

%T, N, B
D = 
T = tangent(D);
N = tangent(T);
B = cross(T(:,1:length(T) - 1),N);
%curvature(K) and torsion(tau)
K =curvature(N);
Tau = torsion(N,B);

