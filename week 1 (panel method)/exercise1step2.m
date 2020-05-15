clear
close all

xmin =-2.5 ;
xmax =2.5;
ymin = -2;
ymax =2;
nx = 51;
ny = 41;
xc = 0.5;
yc = 0.25;
Gamma = 3;

x = xmin:((xmax-xmin)/(nx-1)):xmax;
y = ymin:((ymax-ymin)/(ny-1)):ymax;
[ym,xm]=meshgrid(y,x); 

psi = psipv(xc,yc,Gamma,xm,ym);

c = -0.4:0.1:1.2;
contour(xm,ym,psi,c)
xlabel('x')
ylabel('y')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('Streamlines around a point vortex at (0.5,0.25)')

print -deps2c figure_exercise1.eps