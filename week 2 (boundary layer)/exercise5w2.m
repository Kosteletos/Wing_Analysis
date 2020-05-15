clear
close all
global Re ue0 duedx;
Re = 10^8;
ue0 = 1;
duedx = -0.95;


x0 = 0.01;
thick0(1) = 0.023*x0*(Re*x0)^(-1/6);
thick0(2) = 1.83*thick0(1); 


[delx thickhist] = ode45(@thickdash,[0 0.99],thick0); 

theta = thickhist(:,1);
deltae = thickhist(:,2);
He = deltae./theta;


x = x0+delx;
He_sep = 1.46.*ones(1,length(x));

figure('Name', 'theta and delta e');
plot(x,theta,'-' ,'color','b','linewidth',1.5);
hold on 
plot(x,deltae,'-','color','r','linewidth',1.5);
hold off
legend('theta','delta e','location','northwest')

figure('Name', 'He against x');
plot(x,He,'-o' ,'color','b','linewidth',1.5);
hold on 
plot(x,He_sep,'-','color','r','linewidth',1.5);
hold off


