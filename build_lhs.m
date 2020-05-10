function lhsmat = build_lhs(xs,ys) 
%builds the lhs matrix A of the equation A.gamma = b
%   Detailed explanation goes here




np = length(xs) - 1;
psip = zeros(np,np+1); 
% calculates intermediate psi matrix
for i= 1:np
    [infa, infb] =  panelinf(xs(i),ys(i),xs(i+1),ys(i+1),xs,ys);
    psip(i,1) = infa(1);
    psip(i,np+1) = infb(np);
    for j = 2:np
        psip(i,j) = infa(j)+ infb(j-1);
    end
end

lhsmat = zeros(np+1,np+1);
for i= 1:np-1
    for j = 1:np+1
    lhsmat(i,j) = psip(i+1,j) - psip(i,j);    
    end    
end

lhsmat(np,1) = 1;
lhsmat(np+1,np+1) = 1;

end

