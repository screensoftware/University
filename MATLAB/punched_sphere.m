function [X, Y] = punched_sphere(N)

    if ~exist('N', 'var')
        disp("USING DEFAULT N = 4000");
        N = 4000;
    end

    % REAL MANIFOLD
    t = linspace(2, pi, 40);
    s = linspace(0, 2*pi, 20);
    
    [theta, phi] = meshgrid(t, s);
    R = 5 * ones(size(theta));
    
    x = R.*sin(theta).*cos(phi);
    y = R.*sin(theta).*sin(phi);
    z = R.*cos(theta);
    
    subplot(1, 3, 1);
    surf(x, y, z);
    
    % SAMPLED MANIFOLD
    theta = (pi - 2) * rand(1, N) + 2;
    phi = 2* pi * rand(1, N);
    R = 5;

    x = R.*sin(theta).*cos(phi);
    y = R.*sin(theta).*sin(phi);
    z = R.*cos(theta);
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    
    subplot(1, 3, 2); 
    scatter3(x, y, z, 12, z, '+');
    
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 3); cla;
    scatter(Y(1,:), Y(2,:), 12, z,'+');

end

