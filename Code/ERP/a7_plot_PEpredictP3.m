function predictLme4( )
clear;

sDur=[0.4 0.6 0.8];
lDur=[0.8 1 1.2];

clERP = csvread('lmmData.csv',1,0);


ERP=clERP(1:324/2,:);
Dur=sDur;
x=Dur;

for isub=1:18;    
for i=1:3;
    for j=1:3;
        indx1 = find(ERP(:,2) == Dur(i));
        indx2 = find(ERP(:,3) == Dur(j)); 
        indx12 = intersect(indx1,indx2);
        
        indx0 = find(clERP(:,1) == isub);
        indx = intersect(indx0,indx12);
        
        mP3(i,j,isub) = mean(ERP(indx,6));
        mPEMean(i,j,isub) = mean(ERP(indx,4));
        mPEBayes(i,j,isub) = mean(ERP(indx,5));
   
        clear indx1 indx2 indx;
    end;
end;
end;

mmP3(:,1:3) = squeeze(mean(mP3,3));
semP3(:,1:3) = squeeze(std(mP3,0,3))/sqrt(isub);

mmPEMean(:,1:3) = squeeze(mean(mPEMean,3));

mmPEBayes(:,1:3) = squeeze(mean(mPEBayes,3));




subplot(1,3,1); 
errorbar(x,mmP3(:,1),semP3(:,1),'-o','linewidth',2,'Color','r', 'MarkerSize',8,...
   'MarkerEdgeColor','r','MarkerFaceColor','w');
hold on

errorbar(x,mmP3(:,2),semP3(:,2),'-o','linewidth',2,'Color','g', 'MarkerSize',8,...
   'MarkerEdgeColor','g','MarkerFaceColor','w');
hold on

errorbar(x,mmP3(:,3),semP3(:,3),'-o','linewidth',2,'Color','b', 'MarkerSize',8,...
   'MarkerEdgeColor','b','MarkerFaceColor','w');
hold on
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim', [-1, 2]);
set(gca, 'xlim', [0.2, 1]);

subplot(1,3,2); 

plot(mmPEMean(:,1),mmP3(:,1),'o','Color','r', 'MarkerSize',8,...
   'MarkerEdgeColor','r','MarkerFaceColor','w');
hold on

plot(mmPEMean(:,2),mmP3(:,2),'o','Color','g', 'MarkerSize',8,...
   'MarkerEdgeColor','g','MarkerFaceColor','w');
hold on

plot(mmPEMean(:,3),mmP3(:,3),'o','Color','b', 'MarkerSize',8,...
   'MarkerEdgeColor','b','MarkerFaceColor','w');
hold on


subplot(1,3,3); 

plot(mmPEBayes(:,1),mmP3(:,1),'o','Color','r', 'MarkerSize',8,...
   'MarkerEdgeColor','r','MarkerFaceColor','w');
hold on

plot(mmPEBayes(:,2),mmP3(:,2),'o','Color','g', 'MarkerSize',8,...
   'MarkerEdgeColor','g','MarkerFaceColor','w');
hold on

plot(mmPEBayes(:,3),mmP3(:,3),'o','Color','b', 'MarkerSize',8,...
   'MarkerEdgeColor','b','MarkerFaceColor','w');
hold on

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
%set(gca, 'ylim', [-1, 2]);
%set(gca, 'xlim', [0.2, 1]);

ERP=clERP((324/2+1):324,:);
Dur=lDur;
x=Dur;

for isub=1:18;    
for i=1:3;
    for j=1:3;
        indx1 = find(ERP(:,2) == Dur(i));
        indx2 = find(ERP(:,3) == Dur(j)); 
        indx12 = intersect(indx1,indx2);
        
        indx0 = find(clERP(:,1) == isub);
        indx = intersect(indx0,indx12);
        
        mP3(i,j,isub) = mean(ERP(indx,6));
        mPEMean(i,j,isub) = mean(ERP(indx,4));
        mPEBayes(i,j,isub) = mean(ERP(indx,5));
   
        clear indx1 indx2 indx;
    end;
end;
end;

mmP3(:,4:6) = squeeze(mean(mP3,3));
semP3(:,4:6) = squeeze(std(mP3,0,3))/sqrt(isub);

mmPEMean(:,4:6) = squeeze(mean(mPEMean,3));


mmPEBayes(:,4:6) = squeeze(mean(mPEBayes,3));




subplot(1,3,1); 
errorbar(x,mmP3(:,4),semP3(:,4),'-o','linewidth',2,'Color','r', 'MarkerSize',5,...
   'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on

errorbar(x,mmP3(:,5),semP3(:,5),'-o','linewidth',2,'Color','g', 'MarkerSize',5,...
   'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on

errorbar(x,mmP3(:,6),semP3(:,6),'-o','linewidth',2,'Color','b', 'MarkerSize',5,...
   'MarkerEdgeColor','b','MarkerFaceColor','b');
hold on
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim', [-1, 2.5]);
set(gca, 'xlim', [0.2, 1.4]);

subplot(1,3,2); 

plot(mmPEMean(:,4),mmP3(:,4),'o','Color','r', 'MarkerSize',5,...
   'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on

plot(mmPEMean(:,5),mmP3(:,5),'o','Color','g', 'MarkerSize',5,...
   'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on

plot(mmPEMean(:,6),mmP3(:,6),'o','Color','b', 'MarkerSize',5,...
   'MarkerEdgeColor','b','MarkerFaceColor','b');
hold on


subplot(1,3,3); 

plot(mmPEBayes(:,4),mmP3(:,4),'o','Color','r', 'MarkerSize',5,...
   'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on

plot(mmPEBayes(:,5),mmP3(:,5),'o','Color','g', 'MarkerSize',5,...
   'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on

plot(mmPEBayes(:,6),mmP3(:,6),'o','Color','b', 'MarkerSize',5,...
   'MarkerEdgeColor','b','MarkerFaceColor','b');
hold on

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
%set(gca, 'ylim', [-1, 2]);
%set(gca, 'xlim', [0.2, 1]);

subplot(1,3,2);
a=mmPEMean(:);
b=mmP3(:);

%fit data with cumulative normal distribution function
modelFun = @(p,x) x*p(1)+p(2); 
% 设定拟合指数的初始值:，需自己大体估计一个
startingVals = [1 0];
coefEsts = nlinfit(a, b, modelFun, startingVals);
% 作图，需自己设定作图的x范围
xgrid = linspace(-1,1,100);
line(xgrid, modelFun(coefEsts, xgrid), 'Color','k');


set(gca, 'xlim', [-0.3, 0.3]);
set(gca, 'ylim', [-1, 2.5]);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

subplot(1,3,3);
a=mmPEBayes(:);
b=mmP3(:);

%fit data with cumulative normal distribution function
modelFun = @(p,x) x*p(1)+p(2); 
% 设定拟合指数的初始值:，需自己大体估计一个
startingVals = [1 0];
coefEsts = nlinfit(a, b, modelFun, startingVals);
% 作图，需自己设定作图的x范围
xgrid = linspace(-1,1,100);
line(xgrid, modelFun(coefEsts, xgrid), 'Color','k');


set(gca, 'xlim', [-0.3, 0.3]);
set(gca, 'ylim', [-1, 2.5]);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
