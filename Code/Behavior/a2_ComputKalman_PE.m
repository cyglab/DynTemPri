clear;

load('BayesKalman.mat');

sizData = size(Bayes.ss);

for i=1:sizData(1);
    for j=1:sizData(2);
           t0=0.03;
           
           ss=Bayes.ss(i,j);
           spr=Bayes.spr(i,j);
                     
           PE(i,j) = t0*(exp(spr)-1) - t0*(exp(ss)-1);
            
        end;
    end;



savepath='./';
save(strcat(savepath,'PE.mat'),'PE');
                      