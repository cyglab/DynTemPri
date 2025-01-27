clear;

%eeglab;

%clear;

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
load('./chan.mat');


s400 = (ERPs400p400 + ERPs400p600 + ERPs400p800)/3;
s600 = (ERPs600p400 + ERPs600p600 + ERPs600p800)/3;
s800 = (ERPs800p400 + ERPs800p600 + ERPs800p800)/3;

l800 = (ERPl800p800 + ERPl800p1000 + ERPl800p1200)/3;
l1000 = (ERPl1000p800 + ERPl1000p1000 + ERPl1000p1200)/3;
l1200 = (ERPl1200p800 + ERPl1200p1000 + ERPl1200p1200)/3;



nerp1=s400(:,326:550,:);
nerp2=s600(:,376:600,:);
nerp3=s800(:,426:650,:);
nerp4=l800(:,426:650,:);
nerp5=l1000(:,476:700,:);
nerp6=l1200(:,526:750,:);

x=-100:4:796;
base1=mean(nerp1(:,1:25,:),2);
base2=mean(nerp2(:,1:25,:),2);
base3=mean(nerp3(:,1:25,:),2);
base4=mean(nerp4(:,1:25,:),2);
base5=mean(nerp5(:,1:25,:),2);
base6=mean(nerp6(:,1:25,:),2);

sizx=size(x);
for i=1:sizx(2);
    berp1(:,i,:)=nerp1(:,i,:)-base1;
    berp2(:,i,:)=nerp2(:,i,:)-base2;
    berp3(:,i,:)=nerp3(:,i,:)-base3;
    berp4(:,i,:)=nerp4(:,i,:)-base4;
    berp5(:,i,:)=nerp5(:,i,:)-base5;
    berp6(:,i,:)=nerp6(:,i,:)-base6;
end;


erp1=mean(berp1,3);
erp2=mean(berp2,3);
erp3=mean(berp3,3);
erp4=mean(berp4,3);
erp5=mean(berp5,3);
erp6=mean(berp6,3);


dif = erp4-erp3;

indx1=find(x(1,:)>200);
indx2=find(x(1,:)<400);
indx=intersect(indx1,indx2);
topdif=mean(dif(:,indx),2);
topoplot(topdif,chan,'style','both', 'electrodes','on');


