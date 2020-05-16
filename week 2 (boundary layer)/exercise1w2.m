clear
close all

Re_L = 1;
x = linspace(0,1,101); % dimentionless x/L
ue = ones(1,101); % dimentionless ue/U
Int = 0;
theta = zeros(1,101); % theta/L
theta_b = zeros(1,101); %blasius theta/L

for i = (2:length(x))
   Int = Int + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
   theta(i) = sqrt( 0.45/Re_L*(ue(i))^-6 * Int );
   
end

theta_b = 0.664/sqrt(Re_L)*sqrt(x);

plot(x,theta,'-' ,'color','r','linewidth',1.5)
hold on 
plot(x,theta_b,'-' ,'color','b','linewidth',1.5)
hold off 
legend('Thwaites','Blasius','location','northwest')
xlabel('x/L')
ylabel('theta/L')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('Zero pressure-gradient, laminar boundary layer momentum thickness')
print -deps2c ex1w2.eps