function dthickdx = thickdash(xmx0,thick) 
global Re ue0 duedx;

ue = ue0+duedx*xmx0; % ue at first point solved at

Re_theta = Re*thick(1)*(ue); %for  L = 1

He = thick(2)/thick(1);
if He <1.46
    H = 2.803;
else
    H = (11*He+15)/(48*He-59);
end



cf = 0.091416*((H-1)*Re_theta)^-0.232*exp(-1.26*H);
cdiss = 0.010018*((H-1)*Re_theta)^(-1/6);


dthickdx = [cf/2-(H+2)/ue*duedx*thick(1); cdiss - 3/ue*duedx*thick(2)];
end

