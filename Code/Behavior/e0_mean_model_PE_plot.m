subplot(1,2,1);
dur=[0.4 0.6 0.8];
pe=[0.2 0 -0.2];
plot(dur,pe,'LineWidth',1.5);
hold on;

dur=[0.8 1 1.2];
plot(dur,pe,'LineWidth',1.5);
hold on;

x=[0:0.2:1.6];
sizx=size(x);
y=zeros(sizx(2));
plot(x,y,'--k')

set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([-0.4 0.4])

subplot(1,2,2);
e4_BayesKalman_PE_plot;
hold on;
x=[0:0.2:1.6];
sizx=size(x);
y=zeros(sizx(2));
plot(x,y,'--k')

set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([-0.4 0.4])