function [out, fval] = paradoxicalCoord(vars, param)

x0 = [0 0 0 0];

% k_2      = vars(1);
% theta_2  = vars(2);
% k_2i     = vars(3);
% theta_2i = vars(4);
% 
% a = param(1);
% b = param(2);
% c = param(3);
% l_1 = param(4);
% psi = param(5);
% 
% vars = [k_2 theta_2 k_2i theta_2i];
% param = [a, b, c, l_1, psi];

% Численное решение системы уравнений: поиск точки касания кривой
% равновесия и траектории контакта
options = optimoptions(@fsolve,'Algorithm', 'levenberg-marquardt');
[out, fval] = fsolve(@(vars)objParadoxical(vars, param),x0, options);

end