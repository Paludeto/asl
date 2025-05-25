t = 0:0.01:5;

x1 = cos(2*pi*t) .* (t >= 0);
x2 = (2 * (exp(-0.9*t))) .* cos(2*pi*t) .* heaviside(t);

dx1 = -2 * pi * sin(2*pi*t) .* (t >= 0);
dx2 = (-1.8 * exp(-0.9*t) .* cos(2*pi*t) - 4*pi * exp(-0.9*t) .* sin(2*pi*t)) .* (t >= 0);

a1 = 1; a2 = 1;
ys = a1 * dx1 + a2 * dx2;

xt = a1 * x1 + a2 * x2;
yt = dx1 + dx2;

if max(abs(ys - yt)) < 1e-10
    tipo1 = 'linear';
else
    tipo1 = 'não linear';
end

x1b = double(t >= 0);
x2b = exp(-0.9*t) .* double(t >= 0);
b1 = 1; b2 = 2;
zs = b1 * (2*x1b + 5) + b2 * (2*x2b + 5);
xtb = b1*x1b + b2*x2b;
zt = 2 * xtb + 5;

if max(abs(zs - zt)) < 1e-10
    tipo2 = 'linear';
else
    tipo2 = 'não linear';
end