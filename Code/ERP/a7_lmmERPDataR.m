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




p3s400p400=ERPs400p400(:,326:550,:);
p3s400p600=ERPs400p600(:,326:550,:);
p3s400p800=ERPs400p800(:,326:550,:);

p3s600p400=ERPs600p400(:,376:600,:);
p3s600p600=ERPs600p600(:,376:600,:);
p3s600p800=ERPs600p800(:,376:600,:);

p3s800p400=ERPs800p400(:,426:650,:);
p3s800p600=ERPs800p600(:,426:650,:);
p3s800p800=ERPs800p800(:,426:650,:);

p3l800p800=ERPl800p800(:,426:650,:);
p3l800p1000=ERPl800p1000(:,426:650,:);
p3l800p1200=ERPl800p1200(:,426:650,:);

p3l1000p800=ERPl1000p800(:,476:700,:);
p3l1000p1000=ERPl1000p1000(:,476:700,:);
p3l1000p1200=ERPl1000p1200(:,476:700,:);

p3l1200p800=ERPl1200p800(:,526:750,:);
p3l1200p1000=ERPl1200p1000(:,526:750,:);
p3l1200p1200=ERPl1200p1200(:,526:750,:);



x=-100:4:796;
bs400p400=mean(p3s400p400(:,1:25,:),2);
bs400p600=mean(p3s400p600(:,1:25,:),2);
bs400p800=mean(p3s400p800(:,1:25,:),2);

bs600p400=mean(p3s600p400(:,1:25,:),2);
bs600p600=mean(p3s600p600(:,1:25,:),2);
bs600p800=mean(p3s600p800(:,1:25,:),2);

bs800p400=mean(p3s800p400(:,1:25,:),2);
bs800p600=mean(p3s800p600(:,1:25,:),2);
bs800p800=mean(p3s800p800(:,1:25,:),2);

bl800p800=mean(p3l800p800(:,1:25,:),2);
bl800p1000=mean(p3l800p1000(:,1:25,:),2);
bl800p1200=mean(p3l800p1200(:,1:25,:),2);

bl1000p800=mean(p3l1000p800(:,1:25,:),2);
bl1000p1000=mean(p3l1000p1000(:,1:25,:),2);
bl1000p1200=mean(p3l1000p1200(:,1:25,:),2);

bl1200p800=mean(p3l1200p800(:,1:25,:),2);
bl1200p1000=mean(p3l1200p1000(:,1:25,:),2);
bl1200p1200=mean(p3l1200p1200(:,1:25,:),2);

sizx=size(x);
for i=1:sizx(2);
    berps400p400(:,i,:)=p3s400p400(:,i,:)-bs400p400;
    berps400p600(:,i,:)=p3s400p600(:,i,:)-bs400p600;
    berps400p800(:,i,:)=p3s400p800(:,i,:)-bs400p800;
    
    berps600p400(:,i,:)=p3s600p400(:,i,:)-bs600p400;
    berps600p600(:,i,:)=p3s600p600(:,i,:)-bs600p600;
    berps600p800(:,i,:)=p3s600p800(:,i,:)-bs600p800;
    
    berps800p400(:,i,:)=p3s800p400(:,i,:)-bs800p400;
    berps800p600(:,i,:)=p3s800p600(:,i,:)-bs800p600;
    berps800p800(:,i,:)=p3s800p800(:,i,:)-bs800p800;
 
    berpl800p800(:,i,:)=p3l800p800(:,i,:)-bl800p800;
    berpl800p1000(:,i,:)=p3l800p1000(:,i,:)-bl800p1000;
    berpl800p1200(:,i,:)=p3l800p1200(:,i,:)-bl800p1200;    
    
    berpl1000p800(:,i,:)=p3l1000p800(:,i,:)-bl1000p800;
    berpl1000p1000(:,i,:)=p3l1000p1000(:,i,:)-bl1000p1000;    
    berpl1000p1200(:,i,:)=p3l1000p1200(:,i,:)-bl1000p1200;  
    
    berpl1200p800(:,i,:)=p3l1200p800(:,i,:)-bl1200p800;
    berpl1200p1000(:,i,:)=p3l1200p1000(:,i,:)-bl1200p1000;    
    berpl1200p1200(:,i,:)=p3l1200p1200(:,i,:)-bl1200p1200;       
    
end;


indx1=find(x>=200);
indx2=find(x<=400);
indx=intersect(indx1,indx2);

erps400p400=mean(berps400p400(:,indx,:),2);
erps400p600=mean(berps400p600(:,indx,:),2);
erps400p800=mean(berps400p800(:,indx,:),2);

erps600p400=mean(berps600p400(:,indx,:),2);
erps600p600=mean(berps600p600(:,indx,:),2);
erps600p800=mean(berps600p800(:,indx,:),2);

erps800p400=mean(berps800p400(:,indx,:),2);
erps800p600=mean(berps800p600(:,indx,:),2);
erps800p800=mean(berps800p800(:,indx,:),2);

erpl800p800=mean(berpl800p800(:,indx,:),2);
erpl800p1000=mean(berpl800p1000(:,indx,:),2);
erpl800p1200=mean(berpl800p1200(:,indx,:),2);

erpl1000p800=mean(berpl1000p800(:,indx,:),2);
erpl1000p1000=mean(berpl1000p1000(:,indx,:),2);
erpl1000p1200=mean(berpl1000p1200(:,indx,:),2);

erpl1200p800=mean(berpl1200p800(:,indx,:),2);
erpl1200p1000=mean(berpl1200p1000(:,indx,:),2);
erpl1200p1200=mean(berpl1200p1200(:,indx,:),2);


fs400p400=squeeze(mean(erps400p400([4 5 36 9 53 40 14 13 44],:,:),1));
fs400p600=squeeze(mean(erps400p600([4 5 36 9 53 40 14 13 44],:,:),1));
fs400p800=squeeze(mean(erps400p800([4 5 36 9 53 40 14 13 44],:,:),1));

fs600p400=squeeze(mean(erps600p400([4 5 36 9 53 40 14 13 44],:,:),1));
fs600p600=squeeze(mean(erps600p600([4 5 36 9 53 40 14 13 44],:,:),1));
fs600p800=squeeze(mean(erps600p800([4 5 36 9 53 40 14 13 44],:,:),1));

fs800p400=squeeze(mean(erps800p400([4 5 36 9 53 40 14 13 44],:,:),1));
fs800p600=squeeze(mean(erps800p600([4 5 36 9 53 40 14 13 44],:,:),1));
fs800p800=squeeze(mean(erps800p800([4 5 36 9 53 40 14 13 44],:,:),1));

fl800p800=squeeze(mean(erpl800p800([4 5 36 9 53 40 14 13 44],:,:),1));
fl800p1000=squeeze(mean(erpl800p1000([4 5 36 9 53 40 14 13 44],:,:),1));
fl800p1200=squeeze(mean(erpl800p1200([4 5 36 9 53 40 14 13 44],:,:),1));

fl1000p800=squeeze(mean(erpl1000p800([4 5 36 9 53 40 14 13 44],:,:),1));
fl1000p1000=squeeze(mean(erpl1000p1000([4 5 36 9 53 40 14 13 44],:,:),1));
fl1000p1200=squeeze(mean(erpl1000p1200([4 5 36 9 53 40 14 13 44],:,:),1));

fl1200p800=squeeze(mean(erpl1200p800([4 5 36 9 53 40 14 13 44],:,:),1));
fl1200p1000=squeeze(mean(erpl1200p1000([4 5 36 9 53 40 14 13 44],:,:),1));
fl1200p1200=squeeze(mean(erpl1200p1200([4 5 36 9 53 40 14 13 44],:,:),1));



%lineStyles = linspecer(6);  %makes N colors for you to use: lineStyles(ii,:)

%C = linspecer(6);


lmm=[fs400p400; fs400p600; fs400p800;...
    fs600p400; fs600p600; fs600p800;...
    fs800p400; fs800p600; fs800p800;...
    fl800p800; fl800p1000; fl800p1200;...
    fl1000p800; fl1000p1000; fl1000p1200;...
    fl1200p800; fl1200p1000; fl1200p1200];
lmm0=[0;lmm];

clERP = csvread('lmmData.csv',0,0);

clERP(:,6)=lmm0;
csvwrite('lmmData.csv', clERP)

