function x = plotStableZones(fig, a, b, c, l_1, psi, k_2i, theta_2i, theta_2_tang, theta_2_min, theta_2_max, k_2_min, k_2_max)
    syms k_2 theta_2;

    f1 = equilibriumCurve(a, b, c, l_1, psi, theta_2);
    f2 = solve(singlePointContactTrajectory(k_2, theta_2, k_2i, theta_2i, l_1)==0, theta_2);
    k_2_set = linspace(k_2_min+0.001, k_2_max, 20);
    theta_2_set = linspace(theta_2_min, theta_2_max, 20);
        figure(fig);
    for k=k_2_set
        for t=theta_2_set
        L1 = logical(k <= double(subs(f1,theta_2,t)));
        L2 = logical(t >= min(double(subs(f2,k_2,k)))) || ~isreal(min(double(subs(f2,k_2,k))));
        L3 = logical(t >= theta_2_tang);
        
        if L1 || (L2 && L3)
            plot(k, t, '*r');
        else
            plot(k, t, '+b');
        end
        end
    end

end