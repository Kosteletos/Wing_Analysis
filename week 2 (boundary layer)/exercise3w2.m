clear
close all

% run for 
%ue_grad = -0.25
%Re_L = 10^3,10^4,10^5

Re_L = 9.0*10^5; %9.0 is the value of ReL where transition supplants separation
Re_theta = 0;
x = linspace(0,1,101); % dimentionless x/L
ue_grad = -0.25;
ue = linspace(1,1+ue_grad,101); % dimentionless ue/U
Int = 0; %variable that stores integral value
theta = zeros(1,101); % theta/L
theta_b = zeros(1,101); %blasius theta/L

int = 0; %location of natural transition
ils = 0; %location of laminar separation

 n = 101; % defines number of panels
 laminar = true; % initializes boundary layer state flag 
 i = 1;
 while laminar && i < n 
   i = i + 1; 
   Int = Int + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
   theta(i) = sqrt( 0.45/Re_L*(ue(i))^-6 * Int );
   Re_theta = Re_L * ue(i) * theta(i);
   
   m = -Re_L*theta(i)^2*ue_grad;
   H = thwaites_lookup(m);
   He = laminar_He(H);
   if log(Re_theta) >= 18.4*He - 21.74
        laminar = false;
        disp([x(i) Re_theta/1000])
        int = i;
   elseif m >= 0.09
       laminar = false;
       ils = i;
   end
   
 end

if int ~= 0
    disp(['Natural transition at ' num2str(x(int)) ...
    ' with Re_theta ' num2str(Re_theta)])
end 
if ils ~= 0
    disp(['separation at ' num2str(x(ils)) ...
    ' with Re_theta ' num2str(Re_theta)])
end 
