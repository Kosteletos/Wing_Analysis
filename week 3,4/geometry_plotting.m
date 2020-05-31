close all
clear all

%Low Reynolds
%data_list = {'l3','l307','l306','l308','l309'};    % what to plot
%data_list = {'naca4412','l3','l2','l5','low2'};    % what to plot
%data_list = {'l307','l30703c-13-3','l30703','l30703c-7','l30703c-11'};    % what to plot

%High Reynolds
%data_list = {'naca4412','h1','h3','h4','h5','h6'};
%data_list = {'h607','h608','h609','h6'};
data_list = {'h607-1','h607-2','h607-3','h607-4'};

data_len = numel(data_list);
figure('Name','Geometry')
hold on
for i = 1:data_len
    y=load(strcat('Geometry/',data_list{i},'.surf'));
    x=y(2:end-1,1);
    y=y(2:end-1,2);

    [xs ys] = splinefit([1;x;1],[0;y;0],0);
    if strcmp(data_list{i},'h6')
        plot(xs,ys,'r','linewidth',1);
    elseif strcmp(data_list{i},'naca4412')
        plot(xs,ys,'b','linewidth',1.5);
    else
        plot(xs,ys,'k','linewidth',1);
    end
end
%legend(data_list,'location','southeast')
hold off
set(gca,'XTick',[], 'YTick', []) %Remove axes numbers
set(gca,'visible','off') %remove axes ticks
axis equal
axis([-0.1 1.1 -0.2 0.2])