function [out, fval] = paradoxicalCoord(a, b, c, l_1, psi)
% Численное решение системы уравнений: поиск точки касания кривой
% равновесия и траектории контакта

    syms k_2 k_2i theta_2;
    % x0 = [k_2 theta_2 k_2i]
    x0 = [0.5 0.5 0.5];
    vars = [k_2 theta_2 k_2i];
    param = [a, b, c, l_1, psi];
    
    options = optimoptions(@fsolve,'Algorithm', 'levenberg-marquardt');
    [out, fval] = fsolve(@(vars)objParadoxical(vars, param),x0, options);
end