clear
close all

xmin =-2.5 ;
xmax =2.5;
ymin = -2;
ymax =2;
nx = 51;
ny = 41;
nv = 100;
xm = zeros([nx ny]);
ym = zeros([nx ny]);
infa = zeros([nx ny]);
infb = zeros([nx ny]);
psi_ana = zeros([nx ny]);
psi_est = zeros([nx ny]);
yc = 0;
gamma_a = 1;
gamma_b = 1.5;
infb_est = zeros([nx ny]);
infa_est = zeros([nx ny]);
del = 1.5;


for i = 1:nx
    for j = 1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [infa(i,j), infb(i,j)] = refpaninf(del,xm(i,j),ym(i,j)); 
        psi_ana(i,j) = gamma_a.*infa(i,j) + gamma_b.*infb(i,j); %analytic psi of vortex sheet
        
        for k = 1:nv
            xc = (del/nv)*(k-0.5);
            gamma = gamma_b*xc/nv +gamma_a*(del/nv-xc/nv) ; 
            psi_est(i,j) = psi_est(i,j) + psipv(xc,yc,gamma,xm(i,j),ym(i,j)); % discrete approximation for psi of vortex sheet
            infa_est(i,j)= infa_est(i,j) + psipv(xc,yc,gamma_a*(del/nv-xc/nv),xm(i,j),ym(i,j))/gamma_a; % setting gamma_b = 0 so fa=psi/gamma_a
            infb_est(i,j)= infb_est(i,j) + psipv(xc,yc,gamma_b*xc/nv,xm(i,j),ym(i,j))/gamma_b ; % setting gamma_a = 0 so fa=psi/gamma_b
        end  
        
    end
end
c = -0.15:0.05:0.15;
contour(xm,ym,infa,c) 
figure(2)
contour(xm,ym,infb,c) 
figure(3)
contour(xm,ym,psi_ana,c) 
figure(4)
contour(xm,ym,psi_est,c) 
figure(5)
contour(xm,ym,infa_est,c)
figure(6)
contour(xm,ym,infb_est,c)

infa-infa_est

%%


