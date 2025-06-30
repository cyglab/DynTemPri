%eeglab;
load('chan.mat')
load('lmemeanPE.mat')
lmemeanPE=lmeERP;
clear lmeERP;

load('lmeBayesPE.mat')
lmeBayesPE=lmeERP;
clear lmeERP;

dAIC=lmemeanPE.AIC-lmeBayesPE.AIC;



elec=1:62;

times=-100:4:796;


indx1=find(times>=200);
indx2=find(times<=400);
indx=intersect(indx1,indx2);

mAIC=mean(dAIC(indx,:),1);





topoplot(mAIC,chan,'style','both', 'electrodes','on');
caxis([-10 10])


