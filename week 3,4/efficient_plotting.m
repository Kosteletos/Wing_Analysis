close all
clear all



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_list = {'l1','l2','l3','l4','l5'};    % what to plot
angle_list = {'0','7'};                      % Angles to plot cp at
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%'ni8-2','l30703c-13-3',


colour_array = {'b','r','g','k','m','c','k'};
data_len = numel(data_list);
angle_len = numel(angle_list);

% L/D againt alpha
figure('Name','L/D vs \alpha')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.alpha,data.lovdswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
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
end
legend(data_list,'location','northwest')
hold off

%Cd against alpha
figure('Name','C_D vs alpha')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.alpha,data.cdswp,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
legend(data_list,'location','northwest')
hold off

% Cp Plots

for i = 1:angle_len
    figure('Name',strcat('cp',angle_list{i}))
    hold on
    for j = 1:data_len
        data = load(strcat('Data/',data_list{j},'_',angle_list{i}));
        plot(data.xs,data.cp,'-' ,'color',colour_array{mod(j,8)},'linewidth',1.1)
    end
    legend(data_list,'location','southeast')
    hold off
end

% transistion and separation locations
figure('Name','transition_upper vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.transition_upper,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0 1])
    hold off

figure('Name','transition_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.transition_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0 1])
    hold off
    
figure('Name','separation_upper vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.separation_upper,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0.95 1])
    hold off
    
figure('Name','separation_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.separation_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0 1])
    hold off
    
figure('Name','lam_separation_upper vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.lam_separation_upper,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0 1])
    hold off
    
figure('Name','lam_separation_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.lam_separation_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 12 0 1])
    hold off

    %turbulent reattachment
%{
figure('Name','turb_reattachment_upper vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.turb_reattachment_upper,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    hold off
    
figure('Name','turb_reattachment_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.turb_reattachment_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    hold off
    %}