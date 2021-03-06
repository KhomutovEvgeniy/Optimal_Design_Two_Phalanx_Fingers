function f = objParadoxical(vars, param)
%objParadoxical
%    F = objParadoxical(A,B,C,K_2,K_2I,L_1,PSI,THETA_2,THETA_2I)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    25-Feb-2022 18:05:30

k_2 = vars(1);
theta_2 = vars(2);
k_2i = vars(3);
theta_2i = 0;

a = param(1);
b = param(2);
c = param(3);
l_1 = param(4);
psi = param(5);

t2 = cos(theta_2);
t3 = cos(theta_2i);
t4 = sin(theta_2);
t5 = a.^2;
t6 = b.^2;
t7 = c.^2;
t8 = k_2i.^2;
t9 = l_1.^2;
t12 = -theta_2;
t10 = t2.^2;
t11 = l_1.*t2;
t13 = k_2i.*l_1.*t3.*2.0;
t14 = -t5;
t15 = -t6;
t16 = psi+t12;
t20 = t5.*t6.*4.0;
t17 = cos(t16);
t18 = sin(t16);
t19 = t9.*t10;
t21 = t18.^2;
t22 = c.*t17;
t27 = t8+t13+t19;
t23 = t22.*2.0;
t24 = l_1+t22;
t28 = sqrt(t27);
t25 = l_1+t23;
t29 = -t28;
t26 = l_1.*t25;
t30 = t6+t7+t14+t26;
t31 = t7+t14+t15+t26;
t32 = (t5+t6-t7-t26).^2;
t33 = -t32;
t34 = c.*t18.*t30;
t35 = t24.*t30;
t36 = t20+t33;
t37 = sqrt(t36);
t38 = 1.0./t37;
t39 = c.*t18.*t37;
t40 = t24.*t37;
t41 = t34+t40;
t42 = t35+t39;
t43 = 1.0./t41;
t44 = t18.*t42.*t43;
t45 = t17+t44;
f = [t11+t29+c.*t2.*t45;-l_1.*t4-c.*t4.*t45+c.*t2.*(t18+t18.*t43.*(t34-t22.*t37+c.*l_1.*t18.*t24.*2.0+l_1.*t7.*t21.*t38.*(t5+t6-t7-t26).*2.0)-t43.*t44.*(t39-t22.*t30+l_1.*t7.*t21.*2.0+c.*l_1.*t18.*t24.*t38.*(t5+t6-t7-t26).*2.0)-t17.*t42.*t43)+(t2.*t4.*t9)./t28;k_2+t11+t29];
