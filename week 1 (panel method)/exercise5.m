clear
close all

np = 100 ; %number of panels
nx = 51;
ny = 41;
theta = (0:np)*2*pi/np ; % equispaced angle 

xs = cos(theta);
ys = sin(theta);
alpha = pi/18;


A = build_lhs(xs,ys);
b_0 = build_rhs(xs,ys,0);
b_a = build_rhs(xs,ys,alpha);


gam_0 = A\b_0;
gam_a = A\b_a;

circulation_0 = 0;
circulation_a = 0;

L1 = 2*pi/(np);
x = theta(2);
L = sqrt(2*(1-cos(x)));
for i = 1:np+1
    circulation_0 = circulation_0 + gam_0(i)*L;
    circulation_a = circulation_a + gam_a(i)*L;
end

circulation_0
circulation_a

figure('Name', 'alpha = 0');
plot(theta/pi,gam_0)
xlabel('theta/pi')
ylabel('velocity')
axis([0 2 -2.5 2.5])
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('Surface velocity alpha = 0')
%print -deps2c ex5_a_0.eps

figure('Name', 'alpha = pi/18');
plot(theta/pi,gam_a)
xlabel('theta/pi')
ylabel('velocity')
axis([0 2 -2.5 2.5])
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('Surface velocity alpha = pi/18')
%print -deps2c ex5_a_0175.eps

figure('Name', 'both');
plot(theta/pi,gam_a,'-' ,'color','r','linewidth',1.5)
hold on 
plot(theta/pi,gam_0,'-' ,'color','[0  0 1]','linewidth',1.5)
hold off
legend('alpha = pi/18','alpha = 0','location','northwest')
xlabel('theta/pi')
ylabel('velocity')
axis([0 2 -2.5 2.5])
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('Surface velocity on cylinder')
%print -deps2c ex5_both.eps


