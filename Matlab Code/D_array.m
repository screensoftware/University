function D_array(D1, D2, D3)
    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    theta1 = (3 * pi/2) * rand(1, 5000/2);
    theta2 = (3 * pi/2) * (1 + rand(1, 5000/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, 5000);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    % STORING THE SAMPLED MANIFOLD TO OUTPUT
    X = [x; y; z];
    
    Y = lle_D(X, 2, 12, D1);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 1); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');
    
    
    Y = lle_D(X, 2, 12, D2);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 2); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');
    
    
    Y = lle_D(X, 2, 12, D3);

    % SCATTERPLOT OF EMBEDDING
    subplot(1, 3, 3); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

end

