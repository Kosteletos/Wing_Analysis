
close
clear all
prev = 'low6f311';
new = 'low7';
mid1 = 'low6f3';
mid2 = 'low6f313';
mid3 = 'low9f308';

data = load(strcat('Data/',prev));
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;

data2 = load(strcat('Data/',new));
cd2 = data2.cdswp;
alpha2 = data2.alpha;
cl2 = data2.clswp;
lovd2 = data2.lovdswp;

data3 = load(strcat('Data/',mid1));
cd3 = data3.cdswp;
alpha3 = data3.alpha;
cl3 = data3.clswp;
lovd3 = data3.lovdswp;

data4 = load(strcat('Data/',mid2));
cd4 = data4.cdswp;
alpha4 = data4.alpha;
cl4 = data4.clswp;
lovd4 = data4.lovdswp;

data5 = load(strcat('Data/',mid3));
cd5 = data5.cdswp;
alpha5 = data5.alpha;
cl5 = data5.clswp;
lovd5 = data5.lovdswp;
%{
data6 = load('Data/naca4412par9');
cd6 = data6.cdswp;
alpha6 = data6.alpha;
cl6 = data6.clswp;
lovd6 = data6.lovdswp;

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','L/D vs \alpha')
plot(alpha,lovd,'-' ,'color','r','linewidth',1.5)
hold on
plot(alpha2,lovd2,'-' ,'color','g','linewidth',1.5)
plot(alpha3,lovd3,'-' ,'color','b','linewidth',1.5)
plot(alpha4,lovd4,'-' ,'color','c','linewidth',1.5)
plot(alpha5,lovd5,'-' ,'color','r','linewidth',1.5)
legend(prev,new,mid1,mid2,mid3,'location','northwest')
hold off

%%%%%%%%%%%%%%%%%%%%


figure('Name','C_D vs C_L ')

plot(cl,cd,'-' ,'color','r','linewidth',1.5)
hold on
plot(cl2,cd2,'-' ,'color','g','linewidth',1.5)
%plot(cl3,cd3,'-' ,'color','b','linewidth',1.5)
legend(prev,new,'location','northwest')

hold off


%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Cl vs \alpha ')
plot(alpha,cl,'-' ,'color','r','linewidth',1.5)
hold on
plot(alpha2,cl2,'-' ,'color','g','linewidth',1.5)
plot(alpha3,cl3,'-' ,'color','b','linewidth',1.5)
plot(alpha4,cl4,'-' ,'color','c','linewidth',1.5)
plot(alpha5,cl5,'-' ,'color','r','linewidth',1.5)
legend(prev,new,mid1,mid2,mid3,'location','northwest')

hold off



figure('Name','C_D vs alpha')
plot(alpha,cd)
hold on
plot(alpha2,cd2)
legend(prev,new,'location','northwest')
hold off



data0p = load(strcat('Data/',prev,'_0'));
cpp = data0p.cp;
xp = data0p.xs;
data0n = load(strcat('Data/',new,'_0'));
cpn = data0n.cp;
xn = data0n.xs;
figure('Name','cp0')
plot(xp,cpp)
hold on
plot(xn,cpn)
hold off
legend(prev,new,'location','northwest')


data4p = load(strcat('Data/',prev,'_4'));
cpp = data4p.cp;
xp = data4p.xs;
data4n = load(strcat('Data/',new,'_4'));
cpn = data4n.cp;
xn = data4n.xs;
figure('Name','cp4')
plot(xp,cpp)
hold on
plot(xn,cpn)
hold off
legend(prev,new,'location','northwest')

data0_s = load('Data/naca4412par05_0');
cp0_s = data0_s.cp;
x = data0_s.xs;
figure('Name','4412')
plot(x,cp0_s)












