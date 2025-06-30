function p3diffplot( )

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



a1=s400(:,326:550,:);
a2=s600(:,376:600,:);
a3=s800(:,426:650,:);
a4=l800(:,426:650,:);
a5=l1000(:,476:700,:);
a6=l1200(:,526:750,:);

x=-100:4:796;
b1=mean(a1(:,1:25,:),2);
b2=mean(a2(:,1:25,:),2);
b3=mean(a3(:,1:25,:),2);
b4=mean(a4(:,1:25,:),2);
b5=mean(a5(:,1:25,:),2);
b6=mean(a6(:,1:25,:),2);

sizx=size(x);
for i=1:sizx(2);
    c1(:,i,:)=a1(:,i,:)-b1;
    c2(:,i,:)=a2(:,i,:)-b2;
    c3(:,i,:)=a3(:,i,:)-b3;
    c4(:,i,:)=a4(:,i,:)-b4;
    c5(:,i,:)=a5(:,i,:)-b5;
    c6(:,i,:)=a6(:,i,:)-b6;
end;



d1=mean(c1([5 4 36 9 53 40 14 13 44],:,:),1);
d2=mean(c2([5 4 36 9 53 40 14 13 44],:,:),1);
d3=mean(c3([5 4 36 9 53 40 14 13 44],:,:),1);
d4=mean(c4([5 4 36 9 53 40 14 13 44],:,:),1);
d5=mean(c5([5 4 36 9 53 40 14 13 44],:,:),1);
d6=mean(c6([5 4 36 9 53 40 14 13 44],:,:),1);
dif=d4-d3;

m1=mean(d1(:,:,[1:18]),3);
m2=mean(d2(:,:,[1:18]),3);
m3=mean(d3(:,:,[1:18]),3);
m4=mean(d4(:,:,[1:18]),3);
m5=mean(d5(:,:,[1:18]),3);
m6=mean(d6(:,:,[1:18]),3);
mdif=mean(dif(:,:,[1:18]),3);

se1=std(d1(:,:,[1:18]),0,3)/sqrt(18);
se2=std(d2(:,:,[1:18]),0,3)/sqrt(18);
se3=std(d3(:,:,[1:18]),0,3)/sqrt(18);
se4=std(d4(:,:,[1:18]),0,3)/sqrt(18);
se5=std(d5(:,:,[1:18]),0,3)/sqrt(18);
se6=std(d6(:,:,[1:18]),0,3)/sqrt(18);
sedif=std(dif(:,:,[1:18]),0,3)/sqrt(18);



subplot(3,2,5);

plt.m=m3';
plt.se=se3';
plt.color= 'b';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m4';
plt.se=se4';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=mdif';
plt.se=sedif';
plt.color= 'k';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

fill ([200 200 400 400],[-1 2 2 -1],'k','facealpha',0.1);


set(gca, 'xlim', [-100, 800]);
set(gca, 'ylim', [-2, 2.5]);
set(gca,'ydir','reverse')
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')


plot([-200, 2000],[0,0],'--k','LineWidth',1);
plot([0, 0],[-10,10],'--k','LineWidth',1);








function d_plotpic(plt);
m=plt.m;
se=plt.se;
color=plt.color;
xrange=plt.xrange;
yrange=plt.yrange;
x=plt.x;

y1=m-se;
y2=m+se;


[xx,yy]=fill2line(x,y1,y2);
h=fill(xx,yy,color,'EdgeColor',color,'FaceAlpha',0.2,'EdgeAlpha',0.2);
set(h,'edgecolor','white');
set(gca, 'ylim',yrange);      %[0.7, 1.0000001]
set(gca, 'xlim',xrange);            %[0, 24]

hold on;

plot(x,m,'-',...
                'LineWidth',2,...
                'Color',color)
            hold on;
hold on;


            
function [xx,yy]=fill2line(x,y1,y2)


sizX=size(x);
xx(1:sizX(2))=x;
xx(sizX(2)+1:sizX(2)*2)=x(1,sizX(2):-1:1);

yy(1:sizX(2))=y1';
yy(sizX(2)+1:sizX(2)*2)=y2(sizX(2):-1:1,1);





