function [cl cd] = forces(circ,cp,delstarl,thetal,delstaru,thetau) 

cl = -2*circ;

u_te = sqrt(1-cp(end));
theta_te = (thetal(end)+thetau(end));
delstar_te = delstarl(end)+delstaru(end);
H_te = delstar_te/theta_te;

theta_inf = theta_te*((u_te)^(H_te/2+5/2));
cd = 2*theta_inf;


end