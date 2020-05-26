close all
clear all



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_list = {'low62','low61','low6'};    % what to plot
angle_list = {'0','3'};                      % Angles to plot cp at
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




colour_array = {'b','g','r','c','m','k'};
data_len = numel(data_list);
angle_len = numel(angle_list);

% L/D againt alpha
figure('Name','L/D vs \alpha')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.alpha,data.lovdswp,'-' ,'color',colour_array{mod(i,6)},'linewidth',1.5)
end
legend(data_list,'location','southeast')
hold off

%Cd against Cl
figure('Name','C_D vs C_L ')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.clswp,data.cdswp,'-' ,'color',colour_array{mod(i,6)},'linewidth',1.5)
end
legend(data_list,'location','northwest')
hold off

%Cl against alpha 
figure('Name','Cl vs \alpha ')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.alpha,data.clswp,'-' ,'color',colour_array{mod(i,6)},'linewidth',1.5)
end
legend(data_list,'location','northwest')
hold off

%Cd against alpha
figure('Name','C_D vs alpha')
hold on
for i = 1:data_len
   data = load(strcat('Data/',data_list{i}));
   plot(data.alpha,data.cdswp,'-' ,'color',colour_array{mod(i,6)},'linewidth',1.5)
end
legend(data_list,'location','northwest')
hold off

% Cp Plots

for i = 1:angle_len
    figure('Name',strcat('cp',angle_list{i}))
    hold on
    for j = 1:data_len
        data = load(strcat('Data/',data_list{j},'_',angle_list{i}));
        plot(data.xs,data.cp,'-' ,'color',colour_array{mod(j,6)},'linewidth',1)
    end
    legend(data_list,'location','northwest')
    hold off
end


