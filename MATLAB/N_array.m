function D_array(D1, D2, D3)
    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    theta1 = (3 * pi/2) * rand(1, N1/2);
    theta2 = (3 * pi/2) * (1 + rand(1, N1/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, N1);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 1); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    theta1 = (3 * pi/2) * rand(1, N2/2);
    theta2 = (3 * pi/2) * (1 + rand(1, N2/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, N2);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 2); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');
    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    theta1 = (3 * pi/2) * rand(1, N3/2);
    theta2 = (3 * pi/2) * (1 + rand(1, N3/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, N3);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    Y = lle(X);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 3); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

end

