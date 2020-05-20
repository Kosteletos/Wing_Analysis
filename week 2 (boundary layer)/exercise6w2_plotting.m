close 
clear all

He4 = load('He_104_025b').He;
He5 = load('He_105_025').He;
He6 = load('He_106_025').He;

He6_0 = load('He_106_0').He;
He7_0 = load('He_107_0').He;


theta4 = load('Theta_104_025').theta;
theta5 = load('Theta_105_025').theta;
theta6 = load('Theta_106_025').theta;

theta6_0 = load('Theta_106_0').theta;
theta7_0 = load('Theta_107_0').theta;

x = load('xex6').x;

figure('Name','theta against x dudx = 0');
plot(x,theta6_0,'-' ,'color','r','linewidth',1.5)
hold on
plot(x,theta7_0,'-' ,'color','b','linewidth',1.5)
xlabel('x/L')
ylabel('theta/L')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('theta/L vs x/L duedx = 0')
legend('ReL=10^6','ReL=10^7','location','northwest')
hold off
%txt = '\leftarrow Transition at x/L = 0.37';
%text(0.37,0.00013,txt,'Fontsize',10,'Fontn','Times','fontweight','bold');
%print -deps2c ex6w2_a.eps

figure('Name','He against x dudx = 0');
plot(x,He6_0,'-' ,'color','r','linewidth',1.5)
hold on
plot(x,He7_0,'-' ,'color','b','linewidth',1.5)
xlabel('x/L')
ylabel('He')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('He vs x/L duedx = 0')
legend('ReL=10^6','ReL=10^7','location','northwest')
hold off
%txt = '\swarrow Transition at x/L = 0.37';
%text(0.37,1.571,txt,'Fontsize',10,'Fontn','Times','fontweight','bold');

%print -deps2c ex6w2_b.eps





figure('Name','theta against x  dudx=-0.25');
plot(x,theta4,'-' ,'color','r','linewidth',1.5)
hold on
plot(x,theta5,'-' ,'color','b','linewidth',1.5)
plot(x,theta6,'-' ,'color','g','linewidth',1.5)
xlabel('x/L')
ylabel('theta/L')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('theta/L vs x/L duedx = -0.25')
legend('ReL=10^4','ReL=10^5','ReL=10^6','location','northwest')
hold off

%print -deps2c ex6w2_c.eps

figure('Name','He against x dudx= -0.25');
plot(x,He4,'-' ,'color','r','linewidth',1.5)
hold on
plot(x,He5,'-' ,'color','b','linewidth',1.5)
plot(x,He6,'-' ,'color','g','linewidth',1.5)
xlabel('x/L')
ylabel('He')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('He vs x/L duedx = -0.25')
legend('ReL=10^4','ReL=10^5','ReL=10^6','location','northwest')
hold off

%print -deps2c ex6w2_d.eps


