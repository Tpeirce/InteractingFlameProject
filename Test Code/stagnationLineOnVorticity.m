%clear all
close all
clc

addpath('C:\Users\Tristan\Desktop\Research Data\150319');
%load('150402f_Vectors.mat')
%load('150402f_vorticity.mat')

bounds = 1:length(vorticity);

for i = bounds
    vy_current = squeeze(vy(i,:,:));
    hold on;
    imagesc(squeeze(vorticity(i,:,:)));
    contour( vy_current ,[0 0],'w')
    hold off;
    drawnow
end

