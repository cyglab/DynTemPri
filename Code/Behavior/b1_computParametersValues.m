clear;


load('./BayesKalman.mat');

KalmanPara=Bayes.para';

mKalm=mean(KalmanPara,1);
[H,P,CIkalm1,STATS] = ttest(KalmanPara(:,1));
[H,P,CIkalm2,STATS] = ttest(KalmanPara(:,2));
[H,P,CIkalm3,STATS] = ttest(KalmanPara(:,3));



