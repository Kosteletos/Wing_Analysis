function lhsmat = build_lhs(xs,ys) 
%builds the lhs matrix A of the equation A.gamma = b

np = length(xs) - 1;
psip = zeros(np,np+1); 

% calculates intermediate psi matrix, the i indictes the row of the matrix
% outside of the j loop j = np+1 and j = 1 cells are filled and initial j-1
% value is calculated. The panels are then itterated over to fill their
% corresponding cell

for i= 1:np
    [infa, infb] =  panelinf(xs(1),ys(1),xs(2),ys(2),xs(i),ys(i));
    psip(i,1) = infa;
    inf_b_dummy = infb;
    
    [infa, infb] =  panelinf(xs(np+1),ys(np+1),xs(2),ys(2),xs(i),ys(i));
    psip(i,np+1) = infb;
    
    for j = 2:np
        [infa, infb] =  panelinf(xs(j),ys(j),xs(j+1),ys(j+1),xs(i),ys(i));
        psip(i,j) = infa + inf_b_dummy;
        inf_b_dummy=infb;
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

