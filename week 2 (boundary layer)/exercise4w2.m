clear
close all
global Re ue0 duedx;
Re = 10^7;
ue0 = 1;
duedx = 0;


x0 = 0.01;
thick0(1) = 0.023*x0*(Re*x0)^(-1/6);
thick0(2) = 1.83*thick0(1); 


[delx thickhist] = ode45(@thickdash,[0 0.99],thick0); 

theta = thickhist(:,1);
deltae = thickhist(:,2);

x = x0+delx;

theta7 = 0.037*x.*(Re.*x).^(-1/5);
theta9 = 0.023*x.*(Re.*x).^(-1/6);

plot(x,theta,'-' ,'color','b','linewidth',1.5);
hold on 
plot(x,theta7,'-' ,'color','g','linewidth',1.5)

plot(x,theta9,'-' ,'color','r','linewidth',1.5)
hold off

legend('theta','1/7th law','1/9th law','location','northwest')
