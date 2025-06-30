subplot(2,2,1);
c1_oneSub_plot;
hold on;

y=[0:0.2:1.6]
plot(y,y,'--k')
set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([0.2 1.4])

subplot(2,2,2);
c3_data_mean_tp;
hold on;
c2_BayesKalman_te_plot;
hold on;

y=[0:0.2:1.6]
plot(y,y,'--k')
set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([0.2 1.4])


subplot(2,2,3);
d1_data_previous_mean_tp;
hold on;

y=[0:0.2:1.6]
plot(y,y,'--k')
set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([0.2 1.4])

subplot(2,2,4);
d2_BayesKalman_pre_te_plot;
hold on;

y=[0:0.2:1.6]
plot(y,y,'--k')
set(gca, 'Fontname', 'Arial','FontSize',16);
xlim([0.2 1.4])
ylim([0.2 1.4])



