function punched_sphere_array()

    % SPHERE
    t = linspace(0, pi, 40);
    s = linspace(0, 2*pi, 20);
    
    [theta, phi] = meshgrid(t, s);
    R = 5 * ones(size(theta));
    
    x = R.*sin(theta).*cos(phi);
    y = R.*sin(theta).*sin(phi);
    z = R.*cos(theta);
    
    subplot(1, 3, 1);
    surf(x, y, z);

    % PUNCHED SPHERE
    t = linspace(0.5, pi, 40);
    s = linspace(0, 2*pi, 20);
    
    [theta, phi] = meshgrid(t, s);
    R = 5 * ones(size(theta));
    
    x = R.*sin(theta).*cos(phi);
    y = R.*sin(theta).*sin(phi);
    z = R.*cos(theta);
    
    subplot(1, 3, 2);
    surf(x, y, z);
    
    % PUNCHED SPHERE
    t = linspace(2, pi, 40);
    s = linspace(0, 2*pi, 20);
    
    [theta, phi] = meshgrid(t, s);
    R = 5 * ones(size(theta));
    
    x = R.*sin(theta).*cos(phi);
    y = R.*sin(theta).*sin(phi);
    z = R.*cos(theta);
    
    subplot(1, 3, 3);
    surf(x, y, z);
    


end

