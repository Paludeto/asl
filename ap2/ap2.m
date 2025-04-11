t = 0:0.001:5;
z1 = 5 * exp(4j * pi * t);
z2 = 2 * exp(-1j * 2 * pi * t);

z3 = (z1 + z2) / 2;

plot(real(t), imag(z3));
% saveas(gcf, "img/z3(t).png")

plot3(real(z3), imag(z3), t);
% saveas(gcf, "img/z3(t)_3d.png")

t1 = 0:0.01:5;
x1 = real(10 * exp((-1 - 2j * pi) * t1));
plot(t1, x1);
% saveas(gcf, "img/x1(t).png")

t2 = 0:0.01:6;
x2 = imag(3 - exp((-2 - 4j * pi) * t2));
plot(t2, x2);
% saveas(gcf, "img/x2(t).png")

t3 = 0:0.01:4;
x3 = 3 - imag(exp((-4 + pi * j) * t3));
plot(t3, x3);
% saveas(gcf, "img/x3(t).png")

t4 = 0:0.001:7;
x4 = zeros(size(t4));   % Inicializa um vetor preenchido com 0s, do tamanho de t4

for k = 1:5
    x4 = x4 + cos(2 * pi * k * t4 + pi / 6);    % Para k de 1 a 5,
end

plot(t4, x4);
% saveas(gcf, "img/x4(t).png")

t5 = 0:0.01:4;
cd = -log(0.7) / 2;
x5 = exp(-cd * t5) .* cos(2 * pi * 2 * t5);

plot(t5, x5);
% saveas(gcf, "img/x5(t).png");