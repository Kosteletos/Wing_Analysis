% run for 
%ue_grad = -0.1,0.1,0
%Re_L = 5*10^6,10*10^6,20*10^6

Re_L = 5*10^6;
Re_theta = 0;
x = linspace(0,1,101); % dimentionless x/L
ue_grad = -0.1;
ue = linspace(1,1+ue_grad,101); % dimentionless ue/U
Int = 0;
theta = zeros(1,101); % theta/L
theta_b = zeros(1,101); %blasius theta/L



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
   end
end

