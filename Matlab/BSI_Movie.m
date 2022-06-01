close all

iter = 500; % we need iteration # + 1 so that we don't overlap at the end point
s = linspace(0,2*pi,iter);
s(end) = [];
ys = @(s) cos(s); 
zs = @(s) sin(s);
C = [zeros(1,length(s));ys(s);zs(s)];
h = 2*pi*abs(s(2) - s(1)); 
T = Derivative(C,h);

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

    for i = 1:length(st)
        crosses(:,i) = cross(Tt(:,i),C(:,j) - Ct(:,i)); 
        norms(i) = norm(C(:,j) - Ct(:,i));
    end

    cla; 
    plot(crosses(1,:))
    hold on
    plot(norms)
    legend('Numerator','Denominator')

    drawnow
    M(j) = getframe;
end

movie(M,30)
