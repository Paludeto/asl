% EXERCÍCIO 1 ------------------------------
t = -5:0.01:10;

% Funções auxiliares
u = @(x) heaviside(x);
r = @(x) x .* u(x);
delta = @(x) double(x == 0);

x1 = u(t);
x2 = u(t + 3);
x3 = u(t - 2) - u(t + 3);
x4 = exp(-t) .* u(t + 2);
x5 = (t == 2);
x6 = delta(t - 1) + delta(t + 2);
x7 = r(t - 1);
x8 = r(t) - r(t - 2) - r(t - 5) + r(t - 7);
x9 = u(t) - u(t - 2);

% EXERCÍCIO 2 ------------------------------
t1 = -5:0.01:5;

y = t1 .* cos(t1);
yp = (y + fliplr(y)) / 2;
yi = (y - fliplr(y)) / 2;

% Simetria
if all(abs(yp) < 1e-10)
    tipo = 'ímpar';
elseif all(abs(yi) < 1e-10)
    tipo = 'par';
else
    tipo = 'não simétrico';
end

% EXERCÍCIO 3 ------------------------------
tz = -10:0.01:20;
z = tz .* (u(tz) - u(tz - 5));

z1 = (-tz) .* (u(-tz) - u(-tz - 5));
z2 = (4*tz) .* (u(4*tz) - u(4*tz - 5));
z3 = (tz/3) .* (u(tz/3) - u(tz/3 - 5));
z4 = (tz + 2) .* (u(tz + 2) - u(tz + 2 - 5));
z5 = (tz - 3) .* (u(tz - 3) - u(tz - 3 - 5));
z6 = (1 - 3*tz) .* (u(1 - 3*tz) - u(1 - 3*tz - 5));