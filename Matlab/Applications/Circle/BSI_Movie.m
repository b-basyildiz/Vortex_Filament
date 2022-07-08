function M = BSI_Movie
%BSI_Movie is a movie of the BSI integral on a circle over time.
close all

%circle generation
iter = 500; 
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];
%load('C2.mat');
T = Derivative(C);
f = figure;
loops = iter; 

crosses = zeros(3,length(s)-1);
norms = zeros(1,length(s)-1);

for j =1:length(s)
    Ct = C;
    Tt = T;
    st = s;
    Ct(:,j)  = [];%deletion 
    Tt(:,j) = []; 
    st(j) = [];
    
    dV = zeros(3,length(st));

    for i = 1:length(st)
        crosses(:,i) = cross(Tt(:,i),C(:,j) - Ct(:,i)); 
        norms(i) = norm(C(:,j) - Ct(:,i))^3;
        dV(:,i) = crosses(:,i)/norms(i); 
    end

    cla; 
    plot(dV(1,:))
    %legend('Numerator','Denominator')

    drawnow
    M(j) = getframe;

end

end

