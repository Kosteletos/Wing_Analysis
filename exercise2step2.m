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
psi_1 = zeros([nx ny]);
psi_2 = zeros([nx ny]);
yc = 0;
gamma_a = 1;
gamma_b = 2;

del = 1.5;
for i = 1:nx
    for j = 1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [infa(i,j), infb(i,j)] = refpaninf(del,xm(i,j),ym(i,j)); 
        psi_1(i,j) = gamma_a.*infa(i,j) + gamma_b.*infb(i,j);
        
        for k = 1:nv
            xc = (del/nv)*(k-0.5);
            gamma = (((gamma_b - gamma_a)/del)*xc +gamma_a)*del/(nv);
            psi_2(i,j) = psi_2(i,j) + psipv(xc,yc,gamma,xm(i,j),ym(i,j));
        end  
    end
end
c = -0.15:0.05:0.15;
contour(xm,ym,infa,c) 
figure(2)
contour(xm,ym,infb,c) 
figure(3)
contour(xm,ym,psi_1,c) 
figure(4)
contour(xm,ym,psi_2,c) 

est_infa =[];
est_infb =[];
xm_crit = del/2;
i_crit = (xm_crit-xmin)*(nx-1)/(xmax-xmin)+1

infb_reflect = zeros([nx ny]);

for i = 20:nx
    for j = 1:ny
        infb_reflect(i,j) = infa(i-2*(i-i_crit),j);
    end
end

figure(5)
contour(infb_reflect,c) 
%%


