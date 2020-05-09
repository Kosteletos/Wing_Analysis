clear
close all

xmin =0 ;
xmax =5;
ymin = 0;
ymax =5;

nx = 51;
ny = 41;
nv = 100;

psi_est = zeros([nx ny]);

gamma_a = 1;
gamma_b = 1.5;

infb_est = zeros([nx ny]);
infa_est = zeros([nx ny]);

ya =2.5 ;
yb =1.1 ;
xa =3.5 ;
xb =1.6 ;
del = sqrt((xb-xa)^2+(yb-ya)^2);


x = xmin:((xmax-xmin)/(nx-1)):xmax;
y = ymin:((ymax-ymin)/(ny-1)):ymax;
[ym,xm]=meshgrid(y,x);                                                                  %Create xm and ym grid; Don't need to preallocate output

[infa, infb] = panelinf(xa,ya,xb,yb,xm,ym);
psi_ana = gamma_a*infa + gamma_b*infb;

for k = 1:nv
    xc = xa + (xb-xa)/nv*(k-0.5);
    yc = ya + (yb-ya)/nv*(k-0.5);
    L = sqrt((xc-xa)^2+(yc-ya)^2);
    Gamma_k_a = gamma_a*(1-L/del)*del/nv;
    Gamma_k_b = gamma_b*(L/del)*del/nv;
    Gamma_k = Gamma_k_a+ Gamma_k_b; 
    psi_est = psi_est + psipv(xc,yc,Gamma_k,xm,ym);                                     % discrete approximation for psi of vortex sheet
    infa_est = infa_est + psipv(xc,yc,Gamma_k_a,xm,ym)/gamma_a;            % setting gamma_b = 0 so fa=psi/gamma_a
    infb_est = infb_est + psipv(xc,yc,Gamma_k_b,xm,ym)/gamma_b ;                    % setting gamma_a = 0 so fa=psi/gamma_b
end



c = -0.15:0.05:0.15;
figure('Name','Analytical Influence Coefficient a');
contour(xm,ym,infa,c) 

figure('Name', 'Analytical Influence Coefficient b');
contour(xm,ym,infb,c) 

figure('Name', 'Analytical Streamfunction');
contour(xm,ym,psi_ana,c) 

figure('Name', 'Estimated Streamfunction');
contour(xm,ym,psi_est,c) 

figure('Name', 'Estimated Influence Coefficient a');
contour(xm,ym,infa_est,c)

figure('Name', 'Estimated Influence Coefficient b');
contour(xm,ym,infb_est,c)




