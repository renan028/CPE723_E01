% Exercicio 03

clear all
clc

x0 = 2;
number_of_iteration = 100000;
epsilon = 0.1;

x = zeros(number_of_iteration, 1);
x(1) = x0;

J = @(n) n.^2;

T = 0.1;
B = @(n) exp(-n/T);

counter = 1;
while counter < number_of_iteration
    r = 2 * rand - 1;
    xk = x(counter) + epsilon * r;
    dJ = J(xk) - J(x(counter));
    counter = counter + 1;
    if dJ < 0
        x(counter) = xk;
    else
        a = rand;
        if B(dJ) > a
            x(counter) = xk;
        else
            x(counter) = x(counter - 1);
        end
    end
end

figure
plot(1:length(x),x)
title('Graph of states')
xlabel('iteration')
ylabel('states')
path_e0 = strcat('../figs/ex3_','states','.eps');
print(path_e0,'-depsc2','-painters')

figure
plot(1:length(x),J(x))
title('Graph of cost function (J)')
xlabel('iteration')
ylabel('J')
path_e0 = strcat('../figs/ex3_','j','.eps');
print(path_e0,'-depsc2','-painters')