% Exercicio 1.1.c
clear all
clc
n = 10000;
pd = makedist('Exponential','mu', 0.2);
x = random(pd,n,1);
x = x(x<1);
x = x(1:1000);
q = pdf(pd,x);
q = q / sum(q);
w = x.*exp(-x)./ q;
s = sum(w)/length(x);
