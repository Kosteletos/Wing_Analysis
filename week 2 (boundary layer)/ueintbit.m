function f = ueintbit(xa,ua,xb,ub)
%calculates integral of Thwaites solution
u_bar = (ua+ub)/2;
del_u = ub-ua;
del_x = xb-xa;

f = (u_bar^5 + 5/6 *u_bar^3*del_u^2 + 1/16*u_bar*del_u^4)*del_x;
end

