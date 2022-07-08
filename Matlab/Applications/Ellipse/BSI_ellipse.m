%% Ellipse Creation
    %Credit to image analyst on: https://www.mathworks.com/matlabcentral/answers/86615-how-to-plot-an-ellipse
    fontSize = 15;
    x1 = 1;
    x2 = 20;
    y1 = 2;
    y2 = 8;
    eccentricity = 0.85;
    numPoints = 500; % Less for a coarser ellipse, more for a finer resolution.
    % Make equations:
    a = (1/2) * sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2);
    b = a * sqrt(1-eccentricity^2);
    t = linspace(0, 2 * pi, numPoints); % Absolute angle parameter
    X = a * cos(t);
    Y = b * sin(t);
    % Compute angles relative to (x1, y1).
    angles = atan2(y2 - y1, x2 - x1);
    x = (x1 + x2) / 2 + X * cos(angles) - Y * sin(angles);
    y = (y1 + y2) / 2 + X * sin(angles) + Y * cos(angles);
    z = zeros(1,numPoints); 
    % Plot the ellipse as a blue curve.
    C = [x;y;z]; 
    C(:,end) = [];

%% Ellipse Evolution
    plot3(C(1,:),C(2,:),C(3,:))
    hold on
    
    evol_num = 2;
    for i=1:evol_num
        C = C + BSI_Evol(C); 
        plot3(C(1,:),C(2,:),C(3,:))
    end