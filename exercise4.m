clear
close all

np = 100 ; %number of panels
nx = 51;
ny = 41;
theta = (0:np)*2*pi/np ; % equispaced angle 

xs = cos(theta);
ys = sin(theta);
gamma = -2*sin(theta);

xmin =-2.5;
xmax =2.5;
ymin =-2;
ymax =2;

x = xmin:((xmax-xmin)/(nx-1)):xmax;
y = ymin:((ymax-ymin)/(ny-1)):ymax;
[ym,xm]=meshgrid(y,x);

psi = 1*ym; % free stream contribution

for i = 1:np
    gamma_a = gamma(i);
    gamma_b = gamma(i+1);
    [infa,infb] = panelinf(xs(i),ys(i),xs(i+1),ys(i+1),xm,ym);
    psi = psi + gamma_a.*infa + gamma_b.*infb;
end

c = -1.75:0.25:1.75;
figure('Name','streamlines');
contour(xm,ym,psi,c)
hold on
plot(xs,ys)
hold off 