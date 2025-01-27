
clear;

load('./ERPs400p400.mat');
load('./ERPs400p600.mat');
load('./ERPs400p800.mat');

load('./ERPs600p400.mat');
load('./ERPs600p600.mat');
load('./ERPs600p800.mat');

load('./ERPs800p400.mat');
load('./ERPs800p600.mat');
load('./ERPs800p800.mat');

load('./ERPl800p800.mat');
load('./ERPl800p1000.mat');
load('./ERPl800p1200.mat');

load('./ERPl1000p800.mat');
load('./ERPl1000p1000.mat');
load('./ERPl1000p1200.mat');

load('./ERPl1200p800.mat');
load('./ERPl1200p1000.mat');
load('./ERPl1200p1200.mat');


load('./times.mat');

s400 = (ERPs400p400 + ERPs400p600 + ERPs400p800)/3;
s600 = (ERPs600p400 + ERPs600p600 + ERPs600p800)/3;
s800 = (ERPs800p400 + ERPs800p600 + ERPs800p800)/3;

l800 = (ERPl800p800 + ERPl800p1000 + ERPl800p1200)/3;
l1000 = (ERPl1000p800 + ERPl1000p1000 + ERPl1000p1200)/3;
l1200 = (ERPl1200p800 + ERPl1200p1000 + ERPl1200p1200)/3;


b1erp = permute(s400,[2 1 3]);
b2erp = permute(s600,[2 1 3]);
b3erp = permute(s800,[2 1 3]);
b4erp = permute(l800,[2 1 3]);
b5erp = permute(l1000,[2 1 3]);
b6erp = permute(l1200,[2 1 3]);

base1=mean(b1erp(201:251,:,:),1);
base2=mean(b2erp(201:251,:,:),1);
base3=mean(b3erp(201:251,:,:),1);
base4=mean(b4erp(201:251,:,:),1);
base5=mean(b5erp(201:251,:,:),1);
base6=mean(b6erp(201:251,:,:),1);

x=times;
sizx=size(x);
for i=1:sizx(2);
    berp1(i,:,:)=b1erp(i,:,:)-base1;
    berp2(i,:,:)=b2erp(i,:,:)-base2;
    berp3(i,:,:)=b3erp(i,:,:)-base3;
    berp4(i,:,:)=b4erp(i,:,:)-base4;
    berp5(i,:,:)=b5erp(i,:,:)-base5;
    berp6(i,:,:)=b6erp(i,:,:)-base6;
end;


%[6 7 9 10 11 12 14 16 18]
erp1=mean(berp1(:,:,[1:18]),3);
erp2=mean(berp2(:,:,[1:18]),3);
erp3=mean(berp3(:,:,[1:18]),3);
erp4=mean(berp4(:,:,[1:18]),3);
erp5=mean(berp5(:,:,[1:18]),3);
erp6=mean(berp6(:,:,[1:18]),3);

ferp1=mean(erp1(:,[5 4 36 9 53 40 14 13 44]),2);
ferp2=mean(erp2(:,[5 4 36 9 53 40 14 13 44]),2);
ferp3=mean(erp3(:,[5 4 36 9 53 40 14 13 44]),2);
ferp4=mean(erp4(:,[5 4 36 9 53 40 14 13 44]),2);
ferp5=mean(erp5(:,[5 4 36 9 53 40 14 13 44]),2);
ferp6=mean(erp6(:,[5 4 36 9 53 40 14 13 44]),2);






dif=ferp4-ferp3;

%C = linspecer(2);

subplot(2,3,2);
plot(x,ferp3, 'color',[72 143 49]./255,'LineWidth',2);
hold on;
plot(x,ferp4, 'color',[222 66 91]./255,'LineWidth',2);
hold on;
plot(x,dif,'color','k','LineWidth',1);
hold on;
fill ([1000 1000 1300 1300],[-5 2.5 2.5 -5],'k','facealpha',0.1);
hold on;
fill ([230 230 900 900],[-5 2.5 2.5 -5],'k','facealpha',0.1);

set(gca, 'xlim', [-200, 1600]);
set(gca, 'ylim', [-6.5, 3.5]);
set(gca,'ydir','reverse')

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')


plot([-200, 2000],[0,0],'--k','LineWidth',1);
plot([0, 0],[-10,10],'--k','LineWidth',1);


