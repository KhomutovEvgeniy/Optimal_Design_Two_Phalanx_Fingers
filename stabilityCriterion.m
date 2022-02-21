function mu = stabilityCriterion(vars, param)

syms k_2 k_2i theta_2 theta_2i;

% l_1 = param(1);
% l_2 = param(2);
% psi = param(3);
% 
% a = vars(1);
% b = vars(2);
% c = vars(3);

a = param(1);
b = param(2);
c = param(3);
l_1 = param(4);
psi = param(5);
l_2 = 2/3;

% Диапазоны k_2 и theta_2
theta_2_max = pi/2;
theta_2_min = 0;
k_2_min = 0;
k_2_max = l_2;


% 
% k_2      = vars(1);
% theta_2  = vars(2);

% varS = [k_2 theta_2 k_2i theta_2i];
% paramS = [a b c l_1 psi];

coordTang = paradoxicalCoord(vars, param);
k_2_tang = coordTang(1); % Координаты (k_2, theta_2) точки касания
theta_2_tang = coordTang(2);

k_2i = coordTang(3); % Координаты н.у. траектории контакта
theta_2i = coordTang(4);

k_2_set = linspace(k_2_min+0.001,k_2_max,20);
theta_2_set = linspace(theta_2_min,theta_2_max,20);

count_stable = 0;
count_nonstable = 0;

f1 = equilibriumCurve(a,b,c,l_1,psi,theta_2);
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
mu = count_stable / (count_stable+count_nonstable);
% mu = 1 / mu;
