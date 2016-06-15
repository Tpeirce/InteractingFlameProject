clear all
close all
clc
Mvec = matfile('C:\Users\Tristan\Desktop\Research Data\150319\150402f_Vectors.mat');
Mvor = matfile('C:\Users\Tristan\Desktop\Research Data\150319\150402f_vorticity.mat');

bounds = 1:8000;

total = Mvor.vorticity(bounds,:,:);
upper = max(total(:));
lower = min(total(:));

barRange = linspace(lower,upper,20);

cd 'C:\Users\Tristan\Desktop\Research Data\150319\150402f'

figure;
for i = bounds
    %vxt = squeeze(Mvec.vx(i,:,:));
    vyt = squeeze(Mvec.vy(i,:,:));
    vort = squeeze(Mvor.vorticity(i,:,:));
    %comb = sqrt(vxt.^2 + vyt.^2);
    [gx, gy] = gradient(vyt);
    
    imagesc(vort);
    set(gca,'YDir','normal')
    caxis([lower, upper])
    colorbar
    colormap hot
    hold on
    ds = 1:5:128;
    quiver(ds,ds,gx(ds,ds), gy(ds,ds));
    %imagesc(flipud(gx>.5| gx<-.5))
    contour(vyt, [0 0],'w');
    hold off
    drawnow
end