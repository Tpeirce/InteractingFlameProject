clear all
close all
clc

load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160520f\160520f_DAT\160520fTimeAverageVectors-2.mat');
load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160520f\160520f_DAT\160520f_Conditions-2.mat');

imagesc(x_norm,y_norm,flipud(vy_mean))
set(gca,'ydir','normal')
hold on

[left_coords, right_coords] = displacementThicknessFn(x_norm,flipud(vy_mean),d,NominalBluffBodySpacing);

plot(left_coords,y_norm,'.');
plot(right_coords,y_norm,'.');

%% Test section

 h = NominalBluffBodySpacing/2/(d * 25.4); % mid-stream position
 plot([h h],get(gca,'ylim'),'k') % right bb center
 plot([-h -h],get(gca,'ylim'),'k') % left bb center
 plot([0 0],get(gca,'ylim'),'k')