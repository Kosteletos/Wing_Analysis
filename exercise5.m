np = 1000 ; %number of panels
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
L = 2*pi/np
for i = 1:np
    circulation_0 = circulation_0 + gam_0(i)*L;
    circulation_a = circulation_a + gam_a(i)*L;
end

circulation_0
circulation_a
plot(theta/pi,gam_0)
hold on
plot(theta/pi,gam_a)
hold off 

%axis([0 2 -2.5 2.5])
