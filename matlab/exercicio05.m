% Exercicio 05

clear all
clc

x0 = [0, 0];
number_of_iteration = 100;
number_of_temperature_iteration = 10;
epsilon = 0.1;
T0 = 1;
T = T0;

x = zeros(number_of_iteration * number_of_temperature_iteration, 2);
x(1,:) = x0;

J = @(n) (1 - n(:,1)).^2 + 100 * (n(:,2) - n(:,1).^2).^2;

B = @(n,t) exp(-n/t);

counter = 1;
counter_temperatures = 1;
Jmin = J(x(counter,:));
xmin = x(counter,:);
while counter_temperatures <= number_of_temperature_iteration
    while counter < number_of_iteration * counter_temperatures
        r = 2 * rand(1,2) - 1;
        xk = x(counter,:) + epsilon * r;
        Jxk = J(xk);
        dJ = Jxk - J(x(counter,:));
        counter = counter + 1;
        if dJ < 0
            x(counter,:) = xk;
        else
            a = rand;
            if B(dJ,T) > a
                x(counter,:) = xk;
            else
                x(counter,:) = x(counter - 1,:);
            end
        end
        if Jxk < Jmin
            Jmin = Jxk;
            xmin = xk;
        end
    end
    counter_temperatures = counter_temperatures + 1;
    T = T0 / log2(counter_temperatures + 1);
end

figure
plot(1:length(x),x)
title('Graph of states')
xlabel('iteration')
ylabel('states')
path_e0 = strcat('../figs/ex5_','states','.eps');
print(path_e0,'-depsc2','-painters')

figure
plot(1:length(x),J(x))
title('Graph of cost function (J)')
xlabel('iteration')
ylabel('J')
path_e0 = strcat('../figs/ex5_','j','.eps');
print(path_e0,'-depsc2','-painters')