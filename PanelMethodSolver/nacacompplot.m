close
clear all
data = load('Data/naca0012par3');
cd = data.cdswp;
alpha = data.alpha;
cl = data.clswp;
lovd = data.lovdswp;

data2 = load('Data/naca0012par6');
cd2 = data2.cdswp;
alpha2 = data2.alpha;
cl2 = data2.clswp;
lovd2 = data2.lovdswp;

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


figure('Name','L/D vs \alpha')
plot(alpha,lovd)
hold on
plot(alpha2,lovd2)
plot(alpha3,lovd3)
hold off

%%%%%%%%%%%%%%%%%%%%



figure('Name','C_D vs C_L 4412')

plot(cl4,cd4,'-' ,'color','r','linewidth',1.5)
hold on
plot(cl5,cd5,'-' ,'color','g','linewidth',1.5)
plot(cl6,cd6,'-' ,'color','b','linewidth',1.5)
I = imread('naca4412clcd.jpg'); 
h = image([-1.6 1.6],[0.025 0],I);
uistack(h,'bottom')
hold off
axis([-1.6 1.6 0 0.025])


figure('Name','C_D vs C_L 0012')

plot(cl,cd,'-' ,'color','r','linewidth',1.5)
hold on
plot(cl2,cd2,'-' ,'color','g','linewidth',1.5)
plot(cl3,cd3,'-' ,'color','b','linewidth',1.5)
I = imread('naca0012 (2).jpg'); 
h = image([-1.6 1.6],[0.02 0],I);
uistack(h,'bottom')

hold off
axis([-1.6 1.6 0 0.02])

%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Cl vs \alpha 0012')
plot(alpha,cl,'-' ,'color','r','linewidth',1.5)
hold on
plot(alpha2,cl2,'-' ,'color','g','linewidth',1.5)
plot(alpha3,cl4,'-' ,'color','b','linewidth',1.5)
I = imread('naca0012cla.jpg'); 
h = image([-24 32],[2.8 -1.8],I);
uistack(h,'bottom')
axis([-24 32 -1.8 2.8]);

hold off

figure('Name','Cl vs \alpha 4412')
plot(alpha4,cl4,'-' ,'color','r','linewidth',1.5)
hold on
plot(alpha5,cl5,'-' ,'color','g','linewidth',1.5)
plot(alpha6,cl6,'-' ,'color','b','linewidth',1.5)
I = imread('naca4412cla.jpg'); 
h = image([-32 32],[3.6 -2],I);
uistack(h,'bottom')
axis([-32 32 -2 3.6]);

hold off




figure('Name','C_D vs alpha')
plot(alpha,cd)
hold on
plot(alpha2,cd2)
hold off
%{
data0 = load('Data/naca9409m_20_0');
cp0 = data0.cp;
x = data0.xs;
figure('Name','C_p0')
plot(x,cp0)

data0_s = load('Data/naca9409_20_0');
cp0_s = data0_s.cp;
x = data0_s.xs;
figure('Name','C_p0_s')
plot(x,cp0_s)

%}










