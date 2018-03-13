% Exercicio 1.1.c
clear all
clc
n = 10;
pd = makedist('Exponential','mu', 1);
x = random(pd,n*10,1);
k = (exp(1)-1)/exp(1);
x = x(x<1);
x = x(1:n);
x = sort(x);
s = k*sum(x)/length(x);

