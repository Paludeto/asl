syms t;
x = heaviside(t) - 2 * heaviside(t-1);
T = 2;
w0 = 2 * pi / T;

% Aproximação com 5 termos (complexa)
for k = -2:2
    a(k + 3) = (1 / T) * int(x * exp(-1j * k * w0 * t), t, 0, T);
    ex(k + 3) = exp(1j * k * w0 * t);
end

xxe5 = sum(a .* ex);
figure;
fplot(real(xxe5), [0 10], 'r--');
title('Fourier Complexa - 5 termos');
grid on;

% Aproximação com 11 termos (complexa)
clear a ex;
for k = -5:5
    a(k + 6) = (1 / T) * int(x * exp(-1j * k * w0 * t), t, 0, T);
    ex(k + 6) = exp(1j * k * w0 * t);
end

xxe11 = sum(a .* ex);
figure;
fplot(real(xxe11), [0 10]);
title('Fourier Complexa - 11 termos');
grid on;

% Aproximação com 3 termos (trigonométrica)
a0 = (1/T) * int(x, t, 0, T);
k = 1:2;
xxt3 = a0;
for n = 1:2
    an = (2/T) * int(x * cos(n * w0 * t), t, 0, T);
    bn = (2/T) * int(x * sin(n * w0 * t), t, 0, T);
    xxt3 = xxt3 + an * cos(n * w0 * t) + bn * sin(n * w0 * t);
end
figure;
fplot(xxt3, [0 10], 'blue');
title('Fourier Trigonométrica - 3 termos');
grid on;

% Aproximação com 6 termos (trigonométrica)
clear a0 a3 b3;
a0 = (1/T) * int(x, t, 0, T);
for n = 1:6
    a6(n) = (2/T) * int(x * cos(n * w0 * t), t, 0, T);
    b6(n) = (2/T) * int(x * sin(n * w0 * t), t, 0, T);
end

k = 1:6;
xxt6 = a0 + sum(a6 .* cos(k * w0 * t)) + sum(b6 .* sin(k * w0 * t));
figure;
fplot(xxt6, [0 10], 'm');
title('Fourier Trigonométrica - 6 termos');
grid on;