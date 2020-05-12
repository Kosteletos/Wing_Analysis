function [infa, infb] = panelinf(xa,ya,xb,yb,x,y) 
% calculates influence coefficients infa, infb at all x,y for panel
% between (xa,ya) and (xb,yb)

tx = xb-xa;
ty = yb-ya;
t_norm = (tx.^2 + ty.^2).^0.5;
tx = tx./t_norm;
ty = ty./t_norm;

nx = ya-yb;
ny = xb-xa;
n_norm = (nx.^2 + ny.^2).^0.5;
nx = nx./n_norm;
ny = ny./n_norm;

rx = x-xa;
ry = y-ya;

X = rx.*tx + ry.*ty;
Y = rx.*nx + ry.*ny;

del = ((xb-xa).^2+(yb-ya).^2).^0.5;

[infa, infb] = refpaninf(del,X,Y);
end
