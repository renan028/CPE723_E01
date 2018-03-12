% Exercicio 1.1.c
clear all
clc
n = 10000;
pd = makedist('Exponential','mu', 1);
x = random(pd,n,1);
x = x(x<1);
x = x(1:100);
x = sort(x); 
q = pdf(pd,x);
f = x.*exp(-x);

hold on
plot(x,q)
plot(x,f)

w = f./ q;
s = sum(w)/n;