% Exercício 04.a

clear all
clc

x0 = 0;
number_of_iteration = 100;
number_of_temperature_iteration = 5;
epsilon = 0.1;
T0 = 1;
T = T0;

x = zeros(number_of_iteration * number_of_temperature_iteration, 1);
x(1) = x0;

J = @(n) -n + 100 * (n - 0.2).^2 .* (n - 0.8).^2;

B = @(n,t) exp(-n/t);

counter = 1;
counter_temperatures = 1;
Jmin = J(x(counter));
xmin = x(counter);
while counter_temperatures <= number_of_temperature_iteration
    while counter < number_of_iteration * counter_temperatures
        r = 2 * rand - 1;
        xk = x(counter) + epsilon * r;
        Jxk = J(xk);
        dJ = Jxk - J(x(counter));
        counter = counter + 1;
        if dJ < 0
            x(counter) = xk;
        else
            a = rand;
            if B(dJ,T) > a
                x(counter) = xk;
            else
                x(counter) = x(counter - 1);
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
