close all;

vx1000 = squeeze(vx(1000,:,:));
vy1000 = squeeze(vy(1000,:,:));
figure;
step = 5; 
%contourf(x(1:step:end),y(1:step:end),vy1000(1:step:end,1:step:end),40); 
colormap hot; 
hold on; 
quiver(x(1:step:end),y(1:step:end),vx1000(1:step:end,1:step:end), vy1000(1:step:end,1:step:end),'r');
xlabel('mm');
ylabel('mm');
hold off;

figure;
vx_mean = squeeze(mean(vx,1));
vy_mean = squeeze(mean(vy,1));
contourf(x,y,vy_mean)
colormap hot;
xlabel('mm');
ylabel('mm');
h = colorbar;
xlabel(h,'m/s');