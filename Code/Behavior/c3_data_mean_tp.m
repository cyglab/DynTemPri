function b_mean_total( )
clear;

%read data from xlsx files
data=xlsread('centraldata.xlsx');

data(:,5)=data(:,5)/1000;
data(:,6)=data(:,6)/1000;

context = [1 2];
ts = [0.4 0.6 0.8 0.8 1 1.2];

for isub = 1:18;
    for its = 1:6;
        if its >= 1 && its <=3;
            indx1 = find(data(:,1) == 1);   
        else if its > 3;
                indx1 = find(data(:,1) == 2);           
            end;
        end;
            indx2 = find(data(:,5) == ts(its));
            indx0 = intersect(indx1, indx2);
            
            indx3 = find(data(:,2) == isub);
            indx = intersect(indx0, indx3);

            m(its,isub) = mean (data(indx,6),1);
    end;
end;


tm=mean(m(:,:),2);
tse=1.96*std(m(:,:),0,2)/sqrt(18);

x=[0.4 0.6 0.8 0.8 1 1.2];
%plot([0.4 0.6 0.8 0.8 1 1.2],mt,'o');

%C = linspecer(4);





errorbar(x(1:3),tm(1:3),tse(1:3),'o','linewidth',1,'Color','k', 'MarkerSize',5,...
    'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on;

errorbar(x(4:6),tm(4:6),tse(4:6),'o','linewidth',1,'Color','k', 'MarkerSize',5,...
    'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on;

