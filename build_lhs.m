function lhsmat = build_lhs(xs,ys) 
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here



np = length(xs) - 1;
psip = zeros(np,np+1); 
for i= 1:np
    [infa, infb] =  panelinf(xs(i),ys(i),xs(i+1),ys(i+1),xs,ys);
    psip(i,1) = infa(1)+infb(np);
    psip(i,np+1) = infa(1)+ infb(np);
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

for j = 1:np+1 % this might be wrong not sure what to do when trying to take psip(np+1,j),psip(np+2,j)
    lhsmat(np,j) = psip(1,j)-psip(np,j);
    lhsmat(np+1,j) = psip(2,j)-psip(1,j);
end




end

