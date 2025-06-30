
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

temp=0

for its=1:6;
    for ips=1:3;
       temp=[temp;squeeze(m(ips,its,:))]
      
    end;
end;

lmmPEData=temp;