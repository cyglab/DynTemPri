function kalmaplot( );
load('BayesKalman.mat');
load('PE.mat');
Bayes.te=PE;
context = [1 2];
ts = [0.4 0.6 0.8 0.8 1 1.2];



pts=[zeros(1,18);Bayes.ts];


for isub = 1:18;
    for its = 1:6;
        for ips = 1:3;         
            if its >= 1 && its <=3;
                indx0 = find(Bayes.context(:,isub) == 1); 
                indx1 = find(pts(:,isub) == ts(ips));
                indx2 = intersect(indx0, indx1);
                clear indx0 indx1;
                
            else if its > 3;
                indx0 = find(Bayes.context(:,isub) == 2); 
                indx1 = find(pts(:,isub) == ts(ips+3));
                indx2 = intersect(indx0, indx1);
                clear indx0 indx1;
                
            end;
        end;
            indx3 = find(Bayes.ts(:,isub) == ts(its));
            indx = intersect(indx2, indx3);
            clear indx3;
            

            m(ips,its,isub) = mean (Bayes.te(indx,isub),1);
            clear indx2 indx0 indx;
        end;
    end;
end;


tm=mean(m(:,:,:),3);
tse=1.96*std(m(:,:,:),0,3)/sqrt(18);


plt.m=tm(1,1:3)';
plt.se=tse(1,1:3)';
plt.color='r';
plt.xrange=[0.4 1.2];
plt.yrange=[0 4];
plt.x=[0.4 0.6 0.8];
d_plotpic(plt);

hold on;

plt.m=tm(2,1:3)';
plt.se=tse(2,1:3)';
plt.color='g';
plt.xrange=[0.4 1.2];
plt.yrange=[0 4];
plt.x=[0.4 0.6 0.8];
d_plotpic(plt);

hold on;

plt.m=tm(3,1:3)';
plt.se=tse(3,1:3)';
plt.color='b';
plt.xrange=[0.4 1.2];
plt.yrange=[0 4];
plt.x=[0.4 0.6 0.8];
d_plotpic(plt);

hold on;

plt.m=tm(1,4:6)';
plt.se=tse(1,4:6)';
plt.color='r';
plt.xrange=[0.4 1.2];
plt.yrange=[0 4];
plt.x=[0.8 1.0 1.2];
d_plotpic(plt);

hold on;

plt.m=tm(2,4:6)';
plt.se=tse(2,4:6)';
plt.color='g';
plt.xrange=[0.4 1.2];
plt.yrange=[0 4];
plt.x=[0.8 1.0 1.2];
d_plotpic(plt);

hold on;

plt.m=tm(3,4:6)';
plt.se=tse(3,4:6)';
plt.color='b';
plt.xrange=[0.4 1.2];
plt.yrange=[-0.5 0.5];
plt.x=[0.8 1.0 1.2];
d_plotpic(plt);

hold on;
    
  
function d_plotpic(plt);
m=plt.m;
se=plt.se;
color=plt.color;
xrange=plt.xrange;
yrange=plt.yrange;
x=plt.x

y1=m-se;
y2=m+se;


[xx,yy]=fill2line(x,y1,y2);
h=fill(xx,yy,color,'EdgeColor',color,'FaceAlpha',0.5,'EdgeAlpha',0.3);
set(h,'edgecolor','white');
set(gca, 'ylim',yrange);      %[0.7, 1.0000001]
set(gca, 'xlim',xrange);            %[0, 24]

hold on;

plot(x,m,'-',...
                'LineWidth',1,...
                'Color',color)
            hold on;
hold on;

function d_plotpic2(plt);
m=plt.m;
se=plt.se;
color=plt.color;
xrange=plt.xrange;
yrange=plt.yrange;
x=plt.x

y1=m-se;
y2=m+se;


[xx,yy]=fill2line(x,y1,y2);
h=fill(xx,yy,color,'EdgeColor',color,'FaceAlpha',0.5,'EdgeAlpha',0.3);
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