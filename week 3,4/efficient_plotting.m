close all
clear all



%data_list = {'naca4412_05par','l3','l2','l5','low2'};    % what to plot
%data_list = {'l3','l307','l306','l308','l309'};    % what to plot
%data_list = {'l307','l30703c-13-3','l30703','l30703c-7','l30703c-11'}; 
%data_list = {'newidea','ni2','ni3'};
%data_list = {'newidea','ni8-2','ni5','ni6','ni8-5'};
%data_list = {'off_design_h','ni8-2'};
%data_list = {'off_design_l','l30703c-13-3'};

%data_list = {'naca0012par3','naca0012par6','naca0012par9','naca4412par3'};
data_list = {'naca0012par3','naca4412par3'};

angle_list = {};                      % Angles to plot cp at


%'ni8-2','l30703c-13-3',


colour_array = {'b','r','g','k','m','c','k','r'};
data_len = numel(data_list);
angle_len = numel(angle_list);

% L/D againt alpha
figure('Name','L/D vs \alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.lovdswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
    %{
    if strcmp(data_list{i},'off_design_h')
        plot(data.alpha,data.lovdswp,'-' ,'color','g','linewidth',1.5)
    elseif strcmp(data_list{i},'off_design_l')
        plot(data.alpha,data.lovdswp,'-' ,'color','m','linewidth',1.5)
    else
        plot(data.alpha,data.lovdswp,'-' ,'color','k','linewidth',1.5)
    end
    %}
end
legend(data_list,'location','southeast')
hold off

%Cd against Cl
figure('Name','C_D vs C_L ')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.clswp,data.cdswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
legend(data_list,'location','northwest')
hold off

%Cl against alpha 
figure('Name','Cl vs \alpha ')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.clswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
    %{
    if strcmp(data_list{i},'off_design_l')
        plot(data.alpha,data.clswp,'-' ,'color','m','linewidth',1.5)
    elseif strcmp(data_list{i},'off_design_h')
        plot(data.alpha,data.clswp,'-' ,'color','g','linewidth',1.5)
    else
        plot(data.alpha,data.clswp,'-' ,'color','k','linewidth',1)
    end
    %}
end
legend(data_list,'location','northwest')
hold off

%Cd against alpha
figure('Name','C_D vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.cdswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
   %{
    if strcmp(data_list{i},'off_design_h')
        plot(data.alpha,data.cdswp,'-' ,'color','g','linewidth',1.5)
    elseif strcmp(data_list{i},'off_design_l')
        plot(data.alpha,data.cdswp,'-' ,'color','m','linewidth',1.5)
    else
        plot(data.alpha,data.cdswp,'-' ,'color','k','linewidth',1)
    end
    %}
end
legend(data_list,'location','northwest')
hold off

% Cp Plots

for i = 1:angle_len
    figure('Name',strcat('cp',angle_list{i}))
    hold on
    for j = 1:data_len
        data = load(strcat('Data/',data_list{j},'_',angle_list{i}));
        %plot(data.xs,data.cp,'-' ,'color',colour_array{mod(j,8)},'linewidth',1.1)
        
        if strcmp(data_list{j},'off_design_h')
            plot(data.xs,data.cp,'-' ,'color','g','linewidth',1.2);
        elseif strcmp(data_list{j},'off_design_l')
            plot(data.xs,data.cp,'-' ,'color','m','linewidth',1.6);
        else
            plot(data.xs,data.cp,'-' ,'color','k','linewidth',1);
        end
    end
    legend(data_list,'location','southeast')
    hold off
end


