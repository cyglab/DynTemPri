function p3mutiplot( );

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




a1=ERPs400p400(:,326:550,:);
a2=ERPs400p600(:,326:550,:);
a3=ERPs400p800(:,326:550,:);

a4=ERPs600p400(:,376:600,:);
a5=ERPs600p600(:,376:600,:);
a6=ERPs600p800(:,376:600,:);

a7=ERPs800p400(:,426:650,:);
a8=ERPs800p600(:,426:650,:);
a9=ERPs800p800(:,426:650,:);

a10=ERPl800p800(:,426:650,:);
a11=ERPl800p1000(:,426:650,:);
a12=ERPl800p1200(:,426:650,:);

a13=ERPl1000p800(:,476:700,:);
a14=ERPl1000p1000(:,476:700,:);
a15=ERPl1000p1200(:,476:700,:);

a16=ERPl1200p800(:,526:750,:);
a17=ERPl1200p1000(:,526:750,:);
a18=ERPl1200p1200(:,526:750,:);



x=-100:4:796;
b1=mean(a1(:,1:25,:),2);
b2=mean(a2(:,1:25,:),2);
b3=mean(a3(:,1:25,:),2);

b4=mean(a4(:,1:25,:),2);
b5=mean(a5(:,1:25,:),2);
b6=mean(a6(:,1:25,:),2);

b7=mean(a7(:,1:25,:),2);
b8=mean(a8(:,1:25,:),2);
b9=mean(a9(:,1:25,:),2);

b10=mean(a10(:,1:25,:),2);
b11=mean(a11(:,1:25,:),2);
b12=mean(a12(:,1:25,:),2);

b13=mean(a13(:,1:25,:),2);
b14=mean(a14(:,1:25,:),2);
b15=mean(a15(:,1:25,:),2);

b16=mean(a16(:,1:25,:),2);
b17=mean(a17(:,1:25,:),2);
b18=mean(a18(:,1:25,:),2);

sizx=size(x);
for i=1:sizx(2);
    c1(:,i,:)=a1(:,i,:)-b1;
    c2(:,i,:)=a2(:,i,:)-b2;
    c3(:,i,:)=a3(:,i,:)-b3;
    c4(:,i,:)=a4(:,i,:)-b4;
    c5(:,i,:)=a5(:,i,:)-b5;
    c6(:,i,:)=a6(:,i,:)-b6;
    c7(:,i,:)=a7(:,i,:)-b7;
    c8(:,i,:)=a8(:,i,:)-b8;
    c9(:,i,:)=a9(:,i,:)-b9;
    c10(:,i,:)=a10(:,i,:)-b10;
    c11(:,i,:)=a11(:,i,:)-b11;
    c12(:,i,:)=a12(:,i,:)-b12;
    c13(:,i,:)=a13(:,i,:)-b13;
    c14(:,i,:)=a14(:,i,:)-b14;
    c15(:,i,:)=a15(:,i,:)-b15;
    c16(:,i,:)=a16(:,i,:)-b16;
    c17(:,i,:)=a17(:,i,:)-b17;
    c18(:,i,:)=a18(:,i,:)-b18;    
    
end;

d1=mean(c1([4 5 36 9 53 40 14 13 44],:,:),1);
d2=mean(c2([4 5 36 9 53 40 14 13 44],:,:),1);
d3=mean(c3([4 5 36 9 53 40 14 13 44],:,:),1);
d4=mean(c4([4 5 36 9 53 40 14 13 44],:,:),1);
d5=mean(c5([4 5 36 9 53 40 14 13 44],:,:),1);
d6=mean(c6([4 5 36 9 53 40 14 13 44],:,:),1);
d7=mean(c7([4 5 36 9 53 40 14 13 44],:,:),1);
d8=mean(c8([4 5 36 9 53 40 14 13 44],:,:),1);
d9=mean(c9([4 5 36 9 53 40 14 13 44],:,:),1);
d10=mean(c10([4 5 36 9 53 40 14 13 44],:,:),1);
d11=mean(c11([4 5 36 9 53 40 14 13 44],:,:),1);
d12=mean(c12([4 5 36 9 53 40 14 13 44],:,:),1);
d13=mean(c13([4 5 36 9 53 40 14 13 44],:,:),1);
d14=mean(c14([4 5 36 9 53 40 14 13 44],:,:),1);
d15=mean(c15([4 5 36 9 53 40 14 13 44],:,:),1);
d16=mean(c16([4 5 36 9 53 40 14 13 44],:,:),1);
d17=mean(c17([4 5 36 9 53 40 14 13 44],:,:),1);
d18=mean(c18([4 5 36 9 53 40 14 13 44],:,:),1);


m1=mean(d1,3);
m2=mean(d2,3);
m3=mean(d3,3);
m4=mean(d4,3);
m5=mean(d5,3);
m6=mean(d6,3);
m7=mean(d7,3);
m8=mean(d8,3);
m9=mean(d9,3);
m10=mean(d10,3);
m11=mean(d11,3);
m12=mean(d12,3);
m13=mean(d13,3);
m14=mean(d14,3);
m15=mean(d15,3);
m16=mean(d16,3);
m17=mean(d17,3);
m18=mean(d18,3);

se1=std(d1,0,3)/sqrt(18);
se2=std(d2,0,3)/sqrt(18);
se3=std(d3,0,3)/sqrt(18);
se4=std(d4,0,3)/sqrt(18);
se5=std(d5,0,3)/sqrt(18);
se6=std(d6,0,3)/sqrt(18);
se7=std(d7,0,3)/sqrt(18);
se8=std(d8,0,3)/sqrt(18);
se9=std(d9,0,3)/sqrt(18);
se10=std(d10,0,3)/sqrt(18);
se11=std(d11,0,3)/sqrt(18);
se12=std(d12,0,3)/sqrt(18);
se13=std(d13,0,3)/sqrt(18);
se14=std(d14,0,3)/sqrt(18);
se15=std(d15,0,3)/sqrt(18);
se16=std(d16,0,3)/sqrt(18);
se17=std(d17,0,3)/sqrt(18);
se18=std(d18,0,3)/sqrt(18);

subplot(2,3,1);
plt.m=m1';
plt.se=se1';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m2';
plt.se=se2';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m3';
plt.se=se3';
plt.color= 'b';
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

subplot(2,3,2);
plt.m=m4';
plt.se=se4';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m5';
plt.se=se5';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m6';
plt.se=se6';
plt.color= 'b';
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

subplot(2,3,3);
plt.m=m7';
plt.se=se7';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m8';
plt.se=se8';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m9';
plt.se=se9';
plt.color= 'b';
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

subplot(2,3,4);
plt.m=m10';
plt.se=se10';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m11';
plt.se=se11';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m12';
plt.se=se12';
plt.color= 'b';
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

subplot(2,3,5);
plt.m=m13';
plt.se=se13';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m14';
plt.se=se14';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m15';
plt.se=se15';
plt.color= 'b';
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

subplot(2,3,6);
plt.m=m16';
plt.se=se16';
plt.color= 'r';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m17';
plt.se=se17';
plt.color= 'g';
plt.xrange=[0.2 1];
plt.yrange=[-1 2];  
plt.x=x;
d_plotpic(plt);

hold on

plt.m=m18';
plt.se=se18';
plt.color= 'b';
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





