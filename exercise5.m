np = 100 ; %number of panels
nx = 51;
ny = 41;
theta = (0:np)*2*pi/np ; % equispaced angle 

xs = cos(theta);
ys = sin(theta);
alpha = 0;
A = build_lhs(xs,ys);
b = build_rhs(xs,ys,alpha);
gam = A\b;
