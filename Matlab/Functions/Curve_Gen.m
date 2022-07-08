function C = Curve_Gen(iter,c_type)
%CURVE_GEN This function generates a curve given a respective type. 
    switch lower(c_type)
        case 'circle'
            s = linspace(0,2*pi,iter);
            s(end) = [];
            ys = @(s) cos(s); 
            zs = @(s) sin(s);
            C = [zeros(1,length(s));ys(s);zs(s)];
        case 'ellipse'
            %Credit to image analyst on: https://www.mathworks.com/matlabcentral/answers/86615-how-to-plot-an-ellipse
            fontSize = 15;
            x1 = 1;
            x2 = 20;
            y1 = 2;
            y2 = 8;
            eccentricity = 0.85;
            % Make equations:
            a = (1/2) * sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2);
            b = a * sqrt(1-eccentricity^2);
            t = linspace(0, 2 * pi, iter); % Absolute angle parameter
            X = a * cos(t);
            Y = b * sin(t);
            % Compute angles relative to (x1, y1).
            angles = atan2(y2 - y1, x2 - x1);
            x = (x1 + x2) / 2 + X * cos(angles) - Y * sin(angles);
            y = (y1 + y2) / 2 + X * sin(angles) + Y * cos(angles);
            z = zeros(1,iter); 
            % Plot the ellipse as a blue curve.
            C = [x;y;z]; 
            C(:,end) = [];
        case 'soliton'
            %constants
            s0 = -16*pi; 
            t0 = 0;
            tau0 = 1/2;
            v = 1;
            mu = v^2/(v^2 + tau0^2); 
            T = tau0/v; 
            %coordinate equations for analytical
            x = @(s,t) s - (2*mu/v)*tanh(v*(s-2*tau0*t)); 
            y = @(s,t) real((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0 * s + (v^2 - tau0^2)*t));
            z = @(s,t) imag((2*mu/v * sech(v*(s-2*tau0*t))) .* exp(1i*tau0 * s + (v^2 - tau0^2)*t));
            s = linspace(s0,-s0,iter); 
            C = [x(s,0);y(s,0);z(s,0)];
        case 'rough ring'
            %TODO
            error('TODO')
        case 'ring soliton'
            %TODO
            error('TODO')
        otherwise
            error('Specified Curve %s is not able to be generated. \nSelect one of the following curves {circle, ellipse, soliton, rough ring, ring soliton}',c_type)
    end
end

