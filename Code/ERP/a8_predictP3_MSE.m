clear;


clERP = csvread('lmmData.csv',1,0);
PEmean=csvread('PEmeanPre.csv',1,0);
PEbayes=csvread('PEbayesPre.csv',1,0);

P3=clERP(:,6);

SS1=(P3-PEmean).^2;
SS2=(P3-PEbayes).^2;





for isub=1:18;    
        indx = find(clERP(:,1) == isub);
        
        MSE(isub,1) = mean(SS1(indx,1));
        MSE(isub,2) = mean(SS2(indx,1));
end;

mMSE=mean(MSE,1)
[h,p,ci,stats] = ttest(MSE(:,1),MSE(:,2))
[h1,p1,ci1,stats1] = ttest(MSE(:,1))
[h2,p2,ci2,stats2] = ttest(MSE(:,2))

d=(mMSE(1)-mMSE(2))/stats.sd