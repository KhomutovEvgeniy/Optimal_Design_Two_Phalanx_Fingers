function mu = stabilityCriterion(a, b, c, l_1, l_2, psi)

syms k_2 k_2i theta_2 theta_2i;

% Диапазоны k_2 и theta_2
theta_2_max = pi/2;
theta_2_min = 0;
k_2_min = 0.001;
k_2_max = l_2;

% Координаты (k_2, theta_2) точки касания 
coordTang = paradoxicalCoord(a, b, c, l_1, psi);
k_2_tang = coordTang(1); 
theta_2_tang = coordTang(2);
k_2i = coordTang(3); % Координаты н.у. траектории контакта
theta_2i = 0; % Принятое допущение

k_2_set = linspace(k_2_min, k_2_max, 20);
theta_2_set = linspace(theta_2_min, theta_2_max, 20);

count_stable = 0;
count_nonstable = 0;

f1 = equilibriumCurve(a, b, c, l_1, psi, theta_2);
f2 = solve(singlePointContactTrajectory(k_2, theta_2, k_2i, theta_2i, l_1)==0, theta_2);
f2 = f2(2);

for k=k_2_set
    for t=theta_2_set
    L1 = logical(k <= double(subs(f1,theta_2,t)));
    L2 = logical(t >= double(subs(f2,k_2,k)));
    L3 = logical(t >= theta_2_tang);
    
    if L1 || (L2 && L3)
%         plot(k, t, '*r');
        count_stable = count_stable + 1;
    else
        count_nonstable = count_nonstable + 1;
%         plot(k, t, '+b');
    end
    
    end
end
% Коэффициент стабильности - процент стабильных конфигураций захвата
mu = (count_stable+count_nonstable) / count_stable;
