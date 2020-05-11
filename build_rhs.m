function rhsvec = build_rhs(xs,ys,alpha) 
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

np = length(xs) - 1;
psifs = ys.*cos(alpha)-xs.*sin(alpha);
rhsvec = zeros(np+1,1);

for i= 1:np-1
    rhsvec(i) = psifs(i)- psifs(i+1); % rhs of eq(6)
end


end

