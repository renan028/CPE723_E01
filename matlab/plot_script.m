
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