% Exercicio 2
a = -1;
b = 1;
xy = (b-a) * rand(20, 2) + a;
s = sum(xy.^2,2);
PI = 4 * length(s(s<1)) / length(s);

xy = (b-a) * rand(1000000, 2) + a;
s = sum(xy.^2,2);
PI_2 = 4 * length(s(s<1)) / length(s);
