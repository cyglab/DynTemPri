clear;

load('lmemeanPE.mat')
lmemeanPE=lmeERP;
clear lmeERP;

load('lmeBayesPE.mat')
lmeBayesPE=lmeERP;
clear lmeERP;

dAIC=lmemeanPE.AIC-lmeBayesPE.AIC;

sizAIC=size(dAIC);

for i=1:sizAIC(1);
    for j=1:sizAIC(2);
        if abs(dAIC(i,j))<4;
            zaic(i,j)=0;
        else zaic(i,j)=1;
        end;
    end;
end;

dAIC=dAIC.*zaic;

a(:,1)=dAIC(:,1);
a(:,2)=dAIC(:,32);
a(:,3)=dAIC(:,33);
a(:,4)=dAIC(:,3);
a(:,5)=dAIC(:,2);
a(:,6)=dAIC(:,34);
a(:,7)=dAIC(:,35);
a(:,8)=dAIC(:,8);
a(:,9)=dAIC(:,7);
a(:,10)=dAIC(:,6);
a(:,11)=dAIC(:,5);
a(:,12)=dAIC(:,4);
a(:,13)=dAIC(:,36);
a(:,14)=dAIC(:,37);
a(:,15)=dAIC(:,38);
a(:,16)=dAIC(:,39);
a(:,17)=dAIC(:,12);
a(:,18)=dAIC(:,11);
a(:,19)=dAIC(:,10);
a(:,20)=dAIC(:,9);
a(:,21)=dAIC(:,53);
a(:,22)=dAIC(:,40);
a(:,23)=dAIC(:,41);
a(:,24)=dAIC(:,42);
a(:,25)=dAIC(:,43);
a(:,26)=dAIC(:,17);
a(:,27)=dAIC(:,16);
a(:,28)=dAIC(:,15);
a(:,29)=dAIC(:,14);
a(:,30)=dAIC(:,13);
a(:,31)=dAIC(:,44);
a(:,32)=dAIC(:,45);
a(:,33)=dAIC(:,46);
a(:,34)=dAIC(:,47);
a(:,35)=dAIC(:,21);
a(:,36)=dAIC(:,20);
a(:,37)=dAIC(:,19);
a(:,38)=dAIC(:,18);
a(:,39)=dAIC(:,48);
a(:,40)=dAIC(:,49);
a(:,41)=dAIC(:,50);
a(:,42)=dAIC(:,51);
a(:,43)=dAIC(:,52);
a(:,44)=dAIC(:,26);
a(:,45)=dAIC(:,25);
a(:,46)=dAIC(:,24);
a(:,47)=dAIC(:,23);
a(:,48)=dAIC(:,22);
a(:,49)=dAIC(:,54);
a(:,50)=dAIC(:,55);
a(:,51)=dAIC(:,56);
a(:,52)=dAIC(:,57);
a(:,53)=dAIC(:,28);
a(:,54)=dAIC(:,27);
a(:,55)=dAIC(:,58);
a(:,56)=dAIC(:,59);
a(:,57)=dAIC(:,60);
a(:,58)=dAIC(:,30);
a(:,59)=dAIC(:,29);
a(:,60)=dAIC(:,61);



elec=1:60;

times=-100:4:796;

[x y] = meshgrid(times, elec);


pcolor(x,y,a');  
colormap jet,shading interp
caxis([-10 10])

hold on;

fill ([200 200 400 400],[1 60 60 1],'k','facealpha',0,'LineWidth',2);
plot([0, 0],[1,60],'--k','LineWidth',2);

set(gca, 'ylim', [1, 60]);
set(gca, 'xlim', [-100, 796]);
set(gca, 'YDir', 'reverse');
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

