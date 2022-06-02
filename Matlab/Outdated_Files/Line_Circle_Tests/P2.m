% Problem definition
f = @(t,u) [u(2); u(3); 4*t.^2 + 8*t - 10 - u(3) - 4*u(2) - 4*u(1)];
U0 = [-3;-2;2];
tspan = [0 5];
utrue = @(t) [ -1*sin(2*t) + t.^2 - 3; 2*t - 2*cos(2*t); 2 + 4*sin(2*t)];   % exact solution

% Part (b)
k = 0.1;
% Compute Backward Euler solution
[tvec,Uvec] = BackwardEulerSys(f,tspan,U0,k);
% True solution at same points as approximate solution
utvec = zeros(3,length(tvec));
for t = 1:length(tvec)
    utvec(:,t) = utrue(tvec(t));
end
EvecB = (sum(abs(utvec - Uvec')))
% Error plot for k=0.1:;
figure
plot(tvec, EvecB)
% Error at t=5
error5B = norm(utrue(5) - Uvec(length(tspan),:));