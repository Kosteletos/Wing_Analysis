function lhsmat = build_lhs(xs,ys) 
%builds the lhs matrix A of the equation A.gamma = b

np = length(xs) - 1;
psip = zeros(np,np+1); 



% calculates intermediate psi matrix, the i indictes the row of the matrix
% outside of the j loop j = np+1 and j = 1 cells are filled and initial j-1
% value is calculated. The panels are then itterated over to fill their
% corresponding cell

%%%NEW%%% But doing nothing at the moment
%xs_shift = circshift(xs,-1); % Shifted xs == x(i+1)
%ys_shift = circshift(ys,-1); % Shifted ys == y(i+1)
%%%NEW%%%

[infa, infb] =  panelinf(xs(1),ys(1),xs(2),ys(2),xs(1:np),ys(1:np));
psip(:,1) = infa;
inf_b_dummy = infb;
    
[~, infb] =  panelinf(xs(np+1),ys(np+1),xs(2),ys(2),xs(1:np),ys(1:np));
psip(:,np+1) = infb;


for j = 2:np
    [infa, infb] =  panelinf(xs(j),ys(j),xs(j+1),ys(j+1),xs(1:np),ys(1:np));
    psip(:,j) = infa + inf_b_dummy;
    inf_b_dummy=infb;
end

%%%NEW%%% but doing nothing at the moment
%[infa_test, infb_test] = panelinf(xs,ys,xs_shift,ys_shift,xs,ys);
%%%%%%%%%

% Build A (lhsmat) from psi_p adn a shifted Psi_p
lhsmat = zeros(np+1,np+1);

psip_shift = circshift(psip,-1,1); % Shifted psip == psip(i+1,j)
lhsmat(1:np-1,:) = psip_shift(1:np-1,:)-psip(1:np-1,:); %these dimensions to leave final rows zeros
lhsmat(np,1) = 1;
lhsmat(np+1,np+1) = 1;

end

