mu = 0.2;
n = 1000;
a = 0;
b = 1-exp(-mu);
x = linspace(a, b, n);
s = sum(-log(1-x).*(1-x).^((1-mu)/mu));
s = s / (mu^2 * n);