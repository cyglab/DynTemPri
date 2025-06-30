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

a1 = permute(ERPs400p400,[2 1 3]);
a2 = permute(ERPs400p600,[2 1 3]);
a3 = permute(ERPs400p800,[2 1 3]);

a4 = permute(ERPs600p400,[2 1 3]);
a5 = permute(ERPs600p600,[2 1 3]);
a6 = permute(ERPs600p800,[2 1 3]);

a7 = permute(ERPs800p400,[2 1 3]);
a8 = permute(ERPs800p600,[2 1 3]);
a9 = permute(ERPs800p800,[2 1 3]);

a10 = permute(ERPl800p800,[2 1 3]);
a11 = permute(ERPl800p1000,[2 1 3]);
a12 = permute(ERPl800p1200,[2 1 3]);

a13 = permute(ERPl1000p800,[2 1 3]);
a14 = permute(ERPl1000p1000,[2 1 3]);
a15 = permute(ERPl1000p1200,[2 1 3]);

a16 = permute(ERPl1200p800,[2 1 3]);
a17 = permute(ERPl1200p1000,[2 1 3]);
a18 = permute(ERPl1200p1200,[2 1 3]);

b1=a1(326:550,:,:);
b2=a2(326:550,:,:);
b3=a3(326:550,:,:);

b4=a4(376:600,:,:);
b5=a5(376:600,:,:);
b6=a6(376:600,:,:);

b7=a7(426:650,:,:);
b8=a8(426:650,:,:);
b9=a9(426:650,:,:);

b10=a10(426:650,:,:);
b11=a11(426:650,:,:);
b12=a12(426:650,:,:);

b13=a13(476:700,:,:);
b14=a14(476:700,:,:);
b15=a15(476:700,:,:);

b16=a16(526:750,:,:);
b17=a17(526:750,:,:);
b18=a18(526:750,:,:);


x=-100:4:796;
base1=mean(b1(1:25,:,:),1);
base2=mean(b2(1:25,:,:),1);
base3=mean(b3(1:25,:,:),1);

base4=mean(b4(1:25,:,:),1);
base5=mean(b5(1:25,:,:),1);
base6=mean(b6(1:25,:,:),1);

base7=mean(b7(1:25,:,:),1);
base8=mean(b8(1:25,:,:),1);
base9=mean(b9(1:25,:,:),1);

base10=mean(b10(1:25,:,:),1);
base11=mean(b11(1:25,:,:),1);
base12=mean(b12(1:25,:,:),1);

base13=mean(b13(1:25,:,:),1);
base14=mean(b14(1:25,:,:),1);
base15=mean(b15(1:25,:,:),1);

base16=mean(b16(1:25,:,:),1);
base17=mean(b17(1:25,:,:),1);
base18=mean(b18(1:25,:,:),1);

sizx=size(x);
for i=1:sizx(2);
    c1(i,:,:)=b1(i,:,:)-base1;
    c2(i,:,:)=b2(i,:,:)-base2;
    c3(i,:,:)=b3(i,:,:)-base3;
    c4(i,:,:)=b4(i,:,:)-base4;
    c5(i,:,:)=b5(i,:,:)-base5;
    c6(i,:,:)=b6(i,:,:)-base6;
    c7(i,:,:)=b7(i,:,:)-base1;
    c8(i,:,:)=b8(i,:,:)-base2;
    c9(i,:,:)=b9(i,:,:)-base3;
    c10(i,:,:)=b10(i,:,:)-base4;
    c11(i,:,:)=b11(i,:,:)-base5;
    c12(i,:,:)=b12(i,:,:)-base6;    
    c13(i,:,:)=b13(i,:,:)-base1;
    c14(i,:,:)=b14(i,:,:)-base2;
    c15(i,:,:)=b15(i,:,:)-base3;
    c16(i,:,:)=b16(i,:,:)-base4;
    c17(i,:,:)=b17(i,:,:)-base5;
    c18(i,:,:)=b18(i,:,:)-base6;      
end;

d1 = permute(c1,[3 2 1]);
d2 = permute(c2,[3 2 1]);
d3 = permute(c3,[3 2 1]);
d4 = permute(c4,[3 2 1]);
d5 = permute(c5,[3 2 1]);
d6 = permute(c6,[3 2 1]);
d7 = permute(c7,[3 2 1]);
d8 = permute(c8,[3 2 1]);
d9 = permute(c9,[3 2 1]);
d10 = permute(c10,[3 2 1]);
d11 = permute(c11,[3 2 1]);
d12 = permute(c12,[3 2 1]);
d13 = permute(c13,[3 2 1]);
d14 = permute(c14,[3 2 1]);
d15 = permute(c15,[3 2 1]);
d16 = permute(c16,[3 2 1]);
d17 = permute(c17,[3 2 1]);
d18 = permute(c18,[3 2 1]);


erp0=[d1;d2;d3;d4;d5;d6;d7;d8;d9;d10;d11;d12;d13;d14;d15;d16;d17;d18];
erp=permute(erp0,[3 2 1]);

lmmData=csvread('lmmData.csv',1,0);

n=0

% bUnifPE
n=n+1
for i=1:225;
    for j=1:62;
        temp=double(squeeze(erp(i,j,:)));
        tbl = table(lmmData(:,1),lmmData(:,4),temp,'VariableNames',{'sub','model','erp'});
        lme = fitlme(tbl,'erp~model+(1|sub)+(model-1|sub)');
        lmeERP.b(i,j)=lme.Coefficients{2,2};
        lmeERP.se(i,j)=lme.Coefficients{2,3};
        lmeERP.t(i,j)=lme.Coefficients{2,4};
        lmeERP.df(i,j)=lme.Coefficients{2,5};
        lmeERP.p(i,j)=lme.Coefficients{2,6};
        lmeERP.AIC(i,j)=lme.ModelCriterion{1,1};
        lmeERP.BIC(i,j)=lme.ModelCriterion{1,2};
    end;
end;

savepath='./';
save(strcat(savepath,'lmemeanPE.mat'),'lmeERP');
clear lmeERP;


n=n+1
for i=1:225;
    for j=1:62;
        temp=double(squeeze(erp(i,j,:)));
        tbl = table(lmmData(:,1),lmmData(:,5),temp,'VariableNames',{'sub','model','erp'});
        lme = fitlme(tbl,'erp~model+(1|sub)+(model-1|sub)');
        lmeERP.b(i,j)=lme.Coefficients{2,2};
        lmeERP.se(i,j)=lme.Coefficients{2,3};
        lmeERP.t(i,j)=lme.Coefficients{2,4};
        lmeERP.df(i,j)=lme.Coefficients{2,5};
        lmeERP.p(i,j)=lme.Coefficients{2,6};
        lmeERP.AIC(i,j)=lme.ModelCriterion{1,1};
        lmeERP.BIC(i,j)=lme.ModelCriterion{1,2};
    end;
end;

savepath='./';
save(strcat(savepath,'lmeBayesPE.mat'),'lmeERP');
clear lmeERP;



