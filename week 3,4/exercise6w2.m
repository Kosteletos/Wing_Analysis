clear
close all

% run for 
%ue_grad = -0.25
%Re_L = 10^3,10^4,10^5
global Re ue0 duedx;
Re = 10^5;
ue0 = 1;
duedx = -0.25;

n = 101; % defines number of panels
Int = 0; %variable that stores integral value
x = linspace(0,1,n); % dimentionless x/L
ue = linspace(1,1+duedx,n); % dimentionless ue/U

m = zeros(1,n);
H = zeros(1,n);
He = zeros(1,n);
He(1) = 1.57258;
deltae = zeros(1,n);
Re_theta = zeros(1,n);
theta = zeros(1,n); % theta/L

int = 0; %natural transition i value
ils = 0; %laminar seperation i value 
itr = 0; %turbulent reattachment i value
its = 0; %turbulent separation i value

laminar = true; % initializes boundary layer state flag 
i = 1;
 while laminar && i < n 
   i = i + 1; 
   Int = Int + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
   theta(i) = sqrt( (0.45/Re)*(ue(i))^-6 * Int );
   Re_theta(i) = Re * ue(i) * theta(i);
   
   m(i) = -Re*theta(i)^2*duedx;
   H(i) = thwaites_lookup(m(i));
   He(i) = laminar_He(H(i));
   if log(Re_theta(i)) >= 18.4*He(i) - 21.74
       laminar = false;
       disp([x(i) Re_theta(i)/1000])
       int = i;
   elseif m(i) >= 0.09
       laminar = false;
       ils = i;
       He(i) = 1.51509;
   end
   
 end
 

deltae = He.*theta;

ue0 = ue0 + i/n*duedx;

 while its == 0 && i < n 
   thick0 = [theta(i);deltae(i)];
   i = i + 1 ; 
   [delx thickhist] = ode45(@thickdash,[0,x(i)-x(i-1)],thick0);
   ue0 = ue0 +1/n*duedx;
   theta(i) = thickhist(end,1);
   deltae(i) = thickhist(end,2);
   
   
   He(i) = deltae(i)/theta(i);
   if He(i)  < 1.46
        H(i) = 2.803;
   else
        H(i) = (11*He(i)+15)/(48*He(i)-59);
   end
   
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
 end
 
 
 if int ~= 0
    disp(['Natural transition at ' num2str(x(int)) ...
    ' with Re_theta ' num2str(Re_theta(int))])
end 
if ils ~= 0
    disp(['Laminar Seperation at ' num2str(x(ils)) ...
    ' with Re_theta ' num2str(Re_theta(ils))])
end 

if itr ~= 0
    disp(['Turbulent reattachment at ' num2str(x(itr)) ...
    ' with Re_theta ' num2str(Re_theta(itr))])
end 
if its ~= 0
    disp(['Turbulent Seperation at ' num2str(x(its)) ...
    ' with Re_theta ' num2str(Re_theta(its))])
end 

%PLOTTING 

figure('Name','theta against x Re =10^6 dp/dx = 0');
plot(x,theta)
xlabel('x/L')
ylabel('theta/L')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('theta/L vs x/L at ReL = 10^6')
%print -deps2c ex6w2_tx_10^6_0.eps

figure('Name','He against x Re =10^6 dp/dx = 0');
plot(x,He)
xlabel('x/L')
ylabel('He')
set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
title('He vs x/L at ReL = 10^6')
%print -deps2c ex6w2_Hex_10^6_0.eps








