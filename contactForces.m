function [f1,f2] = contactForces(a, b, c, l_1, psi, K, T_a, k_1, theta_2, k_2)
    
M = -l_1*(l_1+2*c*cos(theta_2-psi))+a^2-b^2-c^2;
N =  l_1*(l_1+2*c*cos(theta_2-psi))-a^2-b^2+c^2;
cot_beta = (c*sin(theta_2-psi).*sqrt(4*a^2*b^2-N.^2)+M.*(l_1+c*cos(theta_2-psi)))./...
            -((l_1+c*cos(theta_2-psi)).*sqrt(4*a^2*b^2-N.^2)+M*c.*sin(theta_2-psi));

h = c*(cos(theta_2-psi)-sin(theta_2-psi).*cot_beta);
R = -h./(h+l_1);

T_2 = K*theta_2*T_a;

f1 = (k_2.*(1+R)+R*l_1.*cos(theta_2))*T_a./(k_1.*k_2)-(k_2+l_1.*cos(theta_2)).*T_2./(k_1.*k_2);
f2 = -R./k_2*T_a+T_2./k_2;
end