close
clear all
data = load('Data/low8');
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;

data2 = load('Data/low91');
cd2 = data2.cdswp;
alpha2 = data2.alpha;
cl2 = data2.clswp;
lovd2 = data2.lovdswp;
%{
data3 = load('Data/naca0012par9');
cd3 = data3.cdswp;
alpha3 = data3.alpha;
cl3 = data3.clswp;
lovd3 = data3.lovdswp;

data4 = load('Data/naca4412par3');
cd4 = data4.cdswp;
alpha4 = data4.alpha;
cl4 = data4.clswp;
lovd4 = data4.lovdswp;

data5 = load('Data/naca4412par6');
cd5 = data5.cdswp;
alpha5 = data5.alpha;
cl5 = data5.clswp;
lovd5 = data5.lovdswp;

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
%plot(alpha3,lovd3)
legend('prev','new','location','northwest')
hold off

%%%%%%%%%%%%%%%%%%%%


figure('Name','C_D vs C_L ')

plot(cl,cd,'-' ,'color','r','linewidth',1.5)
hold on
plot(cl2,cd2,'-' ,'color','g','linewidth',1.5)
%plot(cl3,cd3,'-' ,'color','b','linewidth',1.5)
legend('prev','new','location','northwest')

hold off


%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Cl vs \alpha ')
plot(alpha,cl,'-' ,'color','r','linewidth',1.5)
hold on
plot(alpha2,cl2,'-' ,'color','g','linewidth',1.5)
%plot(alpha3,cl3,'-' ,'color','b','linewidth',1.5)
legend('prev','new','location','northwest')

hold off



figure('Name','C_D vs alpha')
plot(alpha,cd)
hold on
plot(alpha2,cd2)
legend('prev','new','location','northwest')
hold off



data0 = load('Data/low9_0');
cp0 = data0.cp;
x = data0.xs;
figure('Name','prev')
plot(x,cp0)

data0 = load('Data/low91_0');
cp0 = data0.cp;
x = data0.xs;
figure('Name','new')
plot(x,cp0)
data0 = load('Data/low91_4');
cp0 = data0.cp;
x = data0.xs;
figure('Name','new 4')
plot(x,cp0)

data0_s = load('Data/naca4412par05_0');
cp0_s = data0_s.cp;
x = data0_s.xs;
figure('Name','4412')
plot(x,cp0_s)












