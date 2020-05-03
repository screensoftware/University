function K_array(K1, K2, K3)

    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    theta1 = (3 * pi/2) * rand(1, 5000/2);
    theta2 = (3 * pi/2) * (1 + rand(1, 5000/2));
    theta = [theta1 theta2];
    height = 5 * rand(1, 5000);
    
    x = -cos(theta);
    y = height;
    z = [(-sin(theta1)) (2 + sin(theta2))];
    
    X = [x; y; z];
    
        Y = lle(X, 2, K1);
    subplot(1, 3, 1); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');
    
        Y = lle(X, 2, K2);
    subplot(1, 3, 2); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');
    
        Y = lle(X, 2, K3);
    subplot(1, 3, 3); cla;
    scatter(Y(1,:), Y(2,:), 12, theta,'+');

end

