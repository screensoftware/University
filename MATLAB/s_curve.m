function [X, Y] = s_curve(N)

    if ~exist('N', 'var')
        disp("USING DEFAULT N = 4000");
        N = 4000;
    end

    % REAL MANIFOLD
    theta1 = (3 * pi/2) * [0:0.02:0.99];
    theta2 = (3 * pi/2) * [1:0.02:1.99];
    theta = [theta1 theta2];
    height = [0:0.125:1] * 5;
    
    x = (-cos(theta))' * ones(size(height));
    y = ones(size(theta))' * height;
    z = [(-sin(theta1))' * ones(size(height/2)); (2 + sin(theta2))' * ones(size(height/2))];
    
    color = theta' * ones(size(height));

    subplot(1, 3, 1);
    surf(x, y, z, color);
    
    % SAMPLED MANIFOLD
    theta1 = (3 * pi/2) * rand(1, N/2);
    theta2 = (3 * pi/2) * (1 + rand(1, N/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, N);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    
    subplot(1, 3, 2); 
    scatter3(x, y, z, 12, theta, '+');
    
    
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 3); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

end

