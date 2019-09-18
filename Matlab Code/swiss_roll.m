function [X, Y] = swiss_roll(N)

    if ~exist('N', 'var')
        disp("USING DEFAULT N = 4000");
        N = 4000;
    end

    % REAL MANIFOLD
    theta = (3 * pi/2) * (1 + 2 * [0:0.02:1]); 
    height = [0:0.125:1] * 40;
    
    x = (theta.* cos(theta))'*ones(size(height));
    y = ones(size(theta))' * height;
    z = (theta.* sin(theta))' * ones(size(height));
    color = theta' * ones(size(height));

    subplot(1, 3, 1);
    surf(x, y, z, color);
    
    %SAMPLED MANIFOLD
    theta = (3 * pi/2) * (1 + 2 * rand(1, N));  
    height = 40 * rand(1, N);
    
    x = theta.* cos(theta);
    y = height;
    z = theta.* sin(theta);
    
    %STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    
    subplot(1, 3, 2); 
    scatter3(x, y, z, 10, theta, '+');
    
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 3); 
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

end

