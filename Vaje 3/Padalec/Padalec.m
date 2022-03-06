h = 40000;
v_0 = 0;
g_0 = 9.81; 
m = 105;
S = 1.2;
c_u = 1;
t_z = 0;
Int = @(t_k) linspace(0, t_k, 10000);

% a)

rho_z = 1.225;
t_k = 300;

splosen_f = @(y, g, m, S, c_u, rho_z) - g - (rho_z .* c_u .* S ./ (2 .* m)) .* y .* abs(y);
f_1 = @(y) splosen_f(y, g_0, m, S, c_u, rho_z);
DE_1 = @(t,Y) [Y(2), f_1(Y(2))];
[~,y_1] = ode45(DE_1, Int(t_k), [h, v_0]);

v_ = y_1(:, 2);
format long
povp_hitrost = mean(v_)
%plot(Int, v_)

% b)

Teo_vred = fzero(f_1, -37)

% c)

r = 6371 * 1000

g = @(y) g_0 .* (r ./ (r + y))^2;
f_2 = @(y, y_) splosen_f(y_, g(y), m, S, c_u, rho_z);
DE_2 = @(t,Y) [Y(2), f_2(Y(2),Y(1))];
[~,y_2] = ode45(DE_2, Int(t_k), [h, v_0]);

Visina = y_2(:, 1)(end)

% d)

Tabela_h = [0, 2000, 4000, 6000, 8000, 10000, 15000, 20000, 25000, 30000, 40000];
Tabela_g = [1.225, 1.007, 0.8194, 0.6601, 0.5258, 0.4135, 0.1948, 0.08891, 0.04008, 0.01841, 0.003996];

pomozna_f = @(y) ((y - h)./ h).^2;

inter_p = flip(polyfit(Tabela_h, Tabela_g, 2));
Novi_rho_z = @(y) inter_p(1) + inter_p(2) .* pomozna_f(y) + inter_p(3) .* (pomozna_f(y))^2;

f_3 = @(y, y_) splosen_f(y_, g(y), m, S, c_u, Novi_rho_z(y));
DE_3 = @(t,Y) [Y(2), f_3(Y(2),Y(1))];
[~,y_3] = ode45(DE_3, Int(t_k), [h, v_0]);

Nova_visina = y_3(:, 1)(end)

% e)

t_k2 = 30;
Zac_pogoj = [h, -3];

[~,y_4] = ode45(DE_3, Int(t_k2), Zac_pogoj);
v_1 = y_4(:, 2)(end)
v_2 = y_3(:, 2)(end)

Razlika = v_1 - v_2