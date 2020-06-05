close all
clear all


%Low Reynolds
%data_list = {'l3','l307','l306','l308','l309'};    % what to plot
%data_list = {'naca4412','l3','l2','l5','low2'};    % what to plot
%data_list = {'l307','l30703c-13-3','l30703','l30703c-7','l30703c-11'};    % what to plot

%High Reynolds
%data_list = {'naca4412','h1','h3','h4','h5','h6'};
%data_list = {'h607','h608','h609','h6'};
%data_list = {'newidea','ni2','ni3','ni4','ni8-2'};
%data_list = {'newidea','ni8-2','ni5','ni6','ni8-5'};

%Validation
data_list = {'naca0012'};
%data_list = {'naca4412'};


%'ni8-2','l30703c-13-3'
data_len = numel(data_list);
figure('Name','Geometry')
hold on
for i = 1:data_len
    y=load(strcat('Geometry/',data_list{i},'.surf'));
    x=y(2:end-1,1);
    y=y(2:end-1,2);

    [xs ys] = splinefit([1;x;1],[0;y;0],0);
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [~,le] = min(xs); %Leading edge index

    xs_u = xs(1:le); %Upper surface x
    xs_l = xs(le+1:end); %Lower surface x
    ys_u = ys(1:le); %Upper surface y
    ys_l = ys(le+1:end); %Lower surface y

    n = 100;
    delta_x = 0.0002;
    camber_x = zeros(1,n+1);
    camber_y = zeros(1,n+1);

    for j = 0:n
       try
           camber_x(j+1)=j/n;
           upper_index = find(xs_u<(j/n+delta_x) & xs_u>(j/n-delta_x));
           lower_index = find(xs_l<(j/n+delta_x) & xs_l>(j/n-delta_x));
           camber_y(j+1) = (ys_u(upper_index(1)) + ys_l(lower_index(1)))/2;
       catch exception
           if j~=0
               camber_y(j+1)=camber_y(j);
           else
               camber_y(1) = ys_u(le);
           end
       end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    if strcmp(data_list{i},'naca001200')
        plot(xs,ys,'r','linewidth',1.5);
        plot(camber_x,camber_y,'r')
    elseif strcmp(data_list{i},'naca441200')
        plot(xs,ys,'b','linewidth',1.5);
        plot(camber_x,camber_y,'b')
    else
        plot(xs,ys,'k','linewidth',1);
        plot(camber_x,camber_y,'k')
    end
end

%legend(data_list,'location','southeast')
hold off
set(gca,'XTick',[], 'YTick', []) %Remove axes numbers
set(gca,'visible','off') %remove axes ticks
axis equal
axis([-0.1 1.1 -0.2 0.2])