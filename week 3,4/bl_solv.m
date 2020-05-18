function [int, ils, itr, its, delstar, theta] = bl_solv(x,cp)

global Re ue0 duedx;

n = length(x); % defines number of panels
Int = 0; %variable that stores integral value

ue = sqrt(1-cp); % dimentionless ue/U
duedxvec = zeros(1,n);
duedxvec(1) = ue(1)/x(1);
duedxvec(n) = (ue(n)-ue(n-1))/(x(n)-x(n-1));
for i=2:n-1
    duedxvec(i) = (-ue(i-1)+ue(i+1))/(x(i+1)-x(i-1));
end


m = zeros(1,n);
H = zeros(1,n);
He = zeros(1,n);
He(1) = 1.57258;
deltae = zeros(1,n);
delstar = zeros(1,n);
Re_theta = zeros(1,n);
theta = zeros(1,n); % theta/L

int = 0; %natural transition i value
ils = 0; %laminar seperation i value 
itr = 0; %turbulent reattachment i value
its = 0; %turbulent separation i value

%LAMINAR LOOP
laminar = true; % initializes boundary layer state flag 
i = 1;

 while laminar && i < n 
   if i == 1
       Int = ueintbit(0,1,x(1),ue(1)); % not sure what ue should be at the stagnation point
   else
       Int = Int + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
   end
   theta(i) = sqrt( (0.45/Re)*(ue(i))^-6 * Int );
   Re_theta(i) = Re * ue(i) * theta(i);
   
   m(i) = -Re*theta(i)^2*duedxvec(i);
   H(i) = thwaites_lookup(m(i));
   He(i) = laminar_He(H(i));
   delstar(i) = H(i)*theta(i);
   if log(Re_theta(i)) >= 18.4*He(i) - 21.74
       laminar = false;
       disp([x(i) Re_theta(i)/1000])
       int = i;
   elseif m(i) >= 0.09
       laminar = false;
       ils = i;
       He(i) = 1.51509;
   end
   i = i + 1;
 end
 i=i-1;
 %filling in the next entrys after exiting the laminar loop
 %TURBULENT LOOP
 deltae = He.*theta;
 ue0 = ue(i);
 duedx = duedxvec(i);
 
 while its == 0 && i < n 
   thick0 = [theta(i);deltae(i)];
   i = i + 1;
   [delx thickhist] = ode45(@thickdash,[0,x(i)-x(i-1)],thick0);
   ue0 = ue(i);
   duedx = duedxvec(i);
   theta(i) = thickhist(end,1);
   deltae(i) = thickhist(end,2);
   
   
   He(i) = deltae(i)/theta(i);
   if He(i)  < 1.46
        H(i) = 2.803;
   else
        H(i) = (11*He(i)+15)/(48*He(i)-59);
   end
   delstar(i) = H(i)*theta(i);
   
   Re_theta(i) = Re * ue(i) * theta(i);
   if ils > 0 && itr ==0 && He(i)>1.58 %test for reattachment after laminar seperation
       itr = i;
   elseif  He(i)<1.46 % test for turbulent seperation
       its = i;
   end
     
 end
 
 He (i:n) = He(i);
 H (i:n) = H(i);

 while i < n 
 i = i+1;
 theta(i)= theta(i-1)*(ue(i-1)/ue(i))^(H(i)+2);
 delstar(i) = H(i)*theta(i);
 
 end
 


 
