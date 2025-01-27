function BayesKalman(  );

clear;

%read data from xlsx files
data=xlsread('centraldata.xlsx');

data(:,5)=data(:,5)/1000;
data(:,6)=data(:,6)/1000;


for isub=1:18;
    
indx = find (data(:,2)==isub);
subData = data(indx,:);
clear indx;


k.data=subData;




[a1]=fitModel(k);
[E ss se ts tp te spr sig2pr sig2ps]=fitFun(a1,k);

paras(:,isub)=a1';
Es(isub)=E;
sss(:,:,isub)=ss;
ses(:,:,isub)=se;
tss(:,:,isub)=ts;
tps(:,:,isub)=tp;
tes(:,:,isub)=te;
sprs(:,:,isub)=spr;
sig2prs(:,:,isub)=sig2pr;
sig2pss(:,:,isub)=sig2ps;
context(:,isub)=subData(:,1);

end;

Bayes.para=squeeze(paras);
Bayes.ss=squeeze(sss);
Bayes.se=squeeze(ses);
Bayes.ts=squeeze(tss);
Bayes.tp=squeeze(tps);
Bayes.te=squeeze(tes);
Bayes.spr=squeeze(sprs);
Bayes.sig2pr=squeeze(sig2prs);
Bayes.sig2ps=squeeze(sig2pss);
Bayes.context=context;

Bayes.E=squeeze(Es);

savepath='./';
save(strcat(savepath,'BayesKalman.mat'),'Bayes');
clear Bayes;




function [a1]=fitModel(k);

% begin to fit data
options=optimset('fminsearch');
options.TolX=0.001;
options.Display='final';
            

r0=rand(1,3)*0.1;
c0=[0.2 0.2 0.2]; 
c1=c0+r0;
          
            
[a1,sfval,sexit,soutput]=fminsearch(@fitFun,c1,options,k);
            
               

function [E ss se ts tp te spr sig2pr sig2ps]=fitFun(a1,k);
t0=0.03;
sigm=a1(1);
q=a1(2);
wp=a1(3);

sig2m=sigm^2;

ts=k.data(:,5);
tp=k.data(:,6);

ss=log(1+ts/t0);
sizedata=size(ss);

sig2pi_0 = 0.1;
spi_0 = 0.8;

for ii=1:sizedata(1);
       ki=(sig2pi_0+q)/(sig2pi_0 + q +sig2m);
       sig2pi=ki*sig2m;
       spi=(1-ki)*spi_0 + ki*ss(ii);
       
       w=sig2pi/(sig2pi+sig2m);
       se(ii,1)=w*ss(ii)+(1-w)*spi;
       
       sig2ps(ii,1) = sig2pi*sig2m/(sig2pi+sig2m);
       
       spi_0 = spi;
       sig2pi_0 = sig2pi;
       
       spr(ii)=spi;
       sig2pr(ii)=sig2pi;
end;

te=(exp(se)-1).*t0;   

logPro=-log(normpdf(tp,(te),(te.*wp)));
E=sum(logPro);


