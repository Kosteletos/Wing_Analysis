close all
clear all



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_list = {'l30702','l308','l307','l307f3','l30703','l30706','l30704'};    % what to plot
angle_list = {'0','5'};                      % Angles to plot cp at
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




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
    legend(data_list,'location','northwest')
    hold off
end


