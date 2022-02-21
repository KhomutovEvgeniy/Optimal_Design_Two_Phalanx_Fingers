function f = singlePointContactTrajectory(k_2, theta_2, k_2i, theta_2i, l_1) 

    f = k_2.^2 - k_2i.^2+2.*l_1.*(k_2.*cos(theta_2)-k_2i.*cos(theta_2i));
end