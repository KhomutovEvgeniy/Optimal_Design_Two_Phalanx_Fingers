function x = paradoxicalPoint(vars, param)

syms k_2 theta_2 k_2i theta_2i;

a = param(1);
b = param(2);
c = param(3);
l_1 = param(4);
psi = param(5);

F1 = singlePointcontactTrajectory(k_2, theta_2, k_2i, theta_2i, l_1);
F2 = h(a, b, c, l_1, psi, theta_2)*cos(theta_2);

f_1 = solve(F1, k_2);
f_1 = f_1(2);

f_2 = F2;

f_1d = diff(f_1, theta_2);
f_2d = diff(f_2, theta_2);

k_2      = vars(1);
theta_2  = vars(2);
k_2i     = vars(3);
theta_2i = vars(4);

F3 = f_1 - f_2;
F4 = f_1d - f_2d;

F5 = k_2 - f_1;

x = [double(subs(F3));
    double(subs(F4));
    double(subs(F5))];


% f_2 = h(a, b, c, l_1, psi, theta_2)*cos(theta_2);
% 
% f_1 = f_1(2);
% 
% f_1d = diff(f_1, theta_2);
% f_2d = diff(f_2, theta_2);

% x = [f_1d - f_2d];
end