close all
clear all

data_list = {'ni8','ni7-8','ni8-2','ni8-3','ni9'};    % what to plot


data_len = numel(data_list);
figure('Name','Geometry')
hold on
for i = 1:data_len
    y=load(strcat('Geometry/',data_list{i},'.surf'));
    x=y(2:end-1,1);
    y=y(2:end-1,2);

    [xs ys] = splinefit([1;x;1],[0;y;0],0);
    plot(xs,ys)
end
legend(data_list,'location','southeast')
hold off
axis equal
axis([0 1 -0.2 0.2])