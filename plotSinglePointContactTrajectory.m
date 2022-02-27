function flag = plotSinglePointContactTrajectory(fig, k_2i, theta_2i, l_1, l_2)

    syms k_2 theta_2;
    k_2_max = l_2;

    f = singlePointContactTrajectory(k_2, theta_2, k_2i, theta_2i, l_1);
    theta_2 = solve(f==0, theta_2); % Параметрическое определение кривой в форме theta_2=f(k_2)
    
    k_2 = linspace(0.001, k_2_max, 1000); % 0.001 для избежания деления на 0
    ang = double(subs(theta_2));
    
    k = 1;
    flag = 0;
    % Определение точек с реальными координатами. Решения могут быть комплексными
    for jj = 1:size(ang,1)
        for j = 1:size(ang,2)
            if isreal(ang(jj,j)) && ang(jj,j) >= 0 && ang(jj,j) <= pi/2
                k_22(jj,k) = k_2(j);
                ang_22(k) = ang(jj,j);  
                flag = 1;
        
                k = k + 1;
            end
        end         
    end

    % Проверка, что для выбранных н.у. существует траектория контакта 
    if flag && (size(k_22,2) > 1)
        figure(fig);    
        plot(k_22, ang_22, 'LineWidth', 2);
    end
end