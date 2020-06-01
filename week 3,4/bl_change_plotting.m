clear all
close all
data_list = {'l3','l309','l308','l307','l306','l311'};

for i=1:length(data_list)
figure('Name',strcat(data_list{i},' upper vs alpha'))

data = load(strcat('Data/',data_list{i}));
threshold = 0.95 * ones(length(data.alpha));
plot(data.alpha,data.transition_upper -0.001,'.' ,'color','k','linewidth',1.5,'MarkerSize',8)
hold on

plot(data.alpha,data.lam_separation_upper-0.001,'.','color','g','linewidth',1.5,'MarkerSize',8)
plot(data.alpha,data.turb_reattachment_upper-0.001,'.' ,'color','b','linewidth',1.5,'MarkerSize',8)
plot(data.alpha,data.separation_upper -0.001,'.' ,'color','r','linewidth',1.5,'MarkerSize',8)
plot(data.alpha,threshold,'--','color','r','linewidth',0.5,'HandleVisibility','off')
    legend('Natural transision','Laminar separation','Turbulent reattachment','Turbulent separation','location','eastoutside')
    ylim([0,1])
    
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    grid on
    hold off

figure('Name',strcat(data_list{i},' lower vs alpha'))
    
    data = load(strcat('Data/',data_list{i}));
plot(data.alpha,data.transition_lower -0.001,'.' ,'color','k','linewidth',1.5,'MarkerSize',8)
hold on

plot(data.alpha,data.lam_separation_lower-0.001,'.' ,'color','g','linewidth',1.5,'MarkerSize',8)
plot(data.alpha,data.turb_reattachment_lower-0.001,'.' ,'color','b','linewidth',1.5,'MarkerSize',8)
plot(data.alpha,data.separation_lower -0.001,'.' ,'color','r','linewidth',1.5,'MarkerSize',8)
    legend('Natural transision','Laminar separation','Turbulent reattachment','Turbulent separation','location','eastoutside')
    ylim([0,1])
    
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    grid on
    hold off
end
%{
figure('Name','transition_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.transition_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 10 0 1])
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    hold off
    

figure('Name','separation_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.separation_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 10 0 1])
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    hold off
    
figure('Name','lam_separation_upper vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.lam_separation_upper,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 10 0 1])
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    hold off
    
figure('Name','lam_separation_lower vs alpha')
hold on
for i = 1:data_len
    data = load(strcat('Data/',data_list{i}));
    plot(data.alpha,data.lam_separation_lower,'-' ,'color',colour_array{mod(i,8)},'linewidth',1.5)
end
    legend(data_list,'location','southeast')
    axis([0 10 0 1])
    xlabel('\alpha')
    ylabel('x/c')
    set(gca,'Fontn','Times','FontSize',10,'linewidth',1)
    hold off
    %}