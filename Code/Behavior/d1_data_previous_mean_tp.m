function b_mean_total( )
clear;

%read data from xlsx files
data=xlsread('centraldata.xlsx');

data(:,5)=data(:,5)/1000;
data(:,6)=data(:,6)/1000;

context = [1 2];
ts = [0.4 0.6 0.8 0.8 1 1.2];

pts=[0;data(:,5)];


for isub = 1:18;
    for its = 1:6;
        for ips = 1:3;         
            if its >= 1 && its <=3;
                indx0 = find(data(:,1) == 1); 
                indx1 = find(pts == ts(ips));
                indx2 = intersect(indx0, indx1);
                clear indx0 indx1;
                
            else if its > 3;
                indx0 = find(data(:,1) == 2); 
                indx1 = find(pts == ts(ips+3));
                indx2 = intersect(indx0, indx1);
                clear indx0 indx1;
                
            end;
        end;
            indx3 = find(data(:,5) == ts(its));
            indx0 = intersect(indx2, indx3);
            clear indx3;
            
            indx3 = find(data(:,2) == isub);
            indx = intersect(indx0, indx3);

            m(ips,its,isub) = mean (data(indx,6),1);
            clear indx2 indx0 indx;
        end;
    end;
end;

% lmm data of tp
    inum=0;
for i=1:18;
    for j = 1:6;
        for k = 1:3;
            inum=inum+1;
            if j >= 1 && j <=3;
                lmmTp0(inum,1)=1;
                lmmTp0(inum,3)=ts(k);
                else if j > 3;
                        lmmTp0(inum,1)=2;
                        lmmTp0(inum,3)=ts(k+3);
                    end;
            end;
            lmmTp0(inum,2)=i;
            lmmTp0(inum,4)=ts(j);
            lmmTp0(inum,5)=m(k,j,i);
                       
        end;
    end;
end;

lmmTp=[zeros(1,5); lmmTp0]

csvwrite('lmmTp.csv',lmmTp);

tm=mean(m(:,:,:),3);
tse=1.96*std(m(:,:,:),0,3)/sqrt(18);

x=[0.4 0.6 0.8 0.8 1 1.2];
%plot([0.4 0.6 0.8 0.8 1 1.2],mt,'o');

%C = linspecer(4);



%subplot(1,2,1);

errorbar(x(1:3),tm(1,1:3),tse(1,1:3),'r','linewidth',1.5,'Color','r', 'MarkerSize',5,...
    'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;

errorbar(x(1:3),tm(2,1:3),tse(2,1:3),'-o','linewidth',1.5,'Color','g', 'MarkerSize',5,...
    'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on;

errorbar(x(1:3),tm(3,1:3),tse(3,1:3),'-o','linewidth',1.5,'Color','b', 'MarkerSize',5,...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;

%subplot(1,2,2);

errorbar(x(4:6),tm(1,4:6),tse(1,4:6),'-o','linewidth',1.5,'Color','r', 'MarkerSize',5,...
    'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;

errorbar(x(4:6),tm(2,4:6),tse(2,4:6),'-o','linewidth',1.5,'Color','g', 'MarkerSize',5,...
    'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on;

errorbar(x(4:6),tm(3,4:6),tse(3,4:6),'-o','linewidth',1.5,'Color','b', 'MarkerSize',5,...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;



