clear
close all

xmin =-2 ;
xmax =2;
ymin = -2;
ymax =2;
nx = 51;
ny = 41;
xm = zeros([nx ny]);
ym = zeros([nx ny]);
psi = zeros([nx ny]);
xc = 0.5;
yc = 0.3;
Gamma = 1;

x = xmin:((xmax-xmin)/(nx-1)):xmax;
y = ymin:((ymax-ymin)/(ny-1)):ymax;
[ym,xm]=meshgrid(y,x); 

psi = psipv(xc,yc,Gamma,xm,ym);

c = -0.4:0.2:1.2;
contour(xm,ym,psi,c)



