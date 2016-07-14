% phase-averaged recirculation zone stuff
% for forced nonreacting cases only

% vortex peak tracking

close all; clc; tic
addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Vortex Tracking');

if ~exist('vx','var') | ~exist('vy','var')
    clear; 
    % remember to use an acoustically forced case
                                                                             %%%%    %%%%        %%%%
    load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527b_Vectors-2.mat');
                                                                             %%%%    %%%%        %%%%
    load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527bTimeAverageVectors-2.mat', 'x_norm','y_norm');
                                                                          %%%%
    cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\'
    vx = fliplr(vx);
    vy = fliplr(vy);
end

%% setting vars
fps = 4e3;
omega = 400;
frames = size(vx,1);
frames_per_cycle = fps / omega; % if this isn't an integer then this becomes much more difficult
degree_increment = 360/frames_per_cycle;
degrees = 0:degree_increment:360-degree_increment;


%% vx single cycle
vx_single_cycle = zeros(floor(frames_per_cycle),size(vx,2),size(vx,3));
for frame = 1:10
    selection = frame:frames_per_cycle:frames;
    vx_single_cycle(frame,:,:) = mean(vx(selection,:,:),1);
end

%% vy single cycle
vy_single_cycle = zeros(floor(frames_per_cycle),size(vy,2),size(vy,3));
for frame = 1:10
    selection = frame:frames_per_cycle:frames;
    vy_single_cycle(frame,:,:) = mean(vy(selection,:,:),1);
end

cMax = max(vy_single_cycle(:));
cMin = min(vy_single_cycle(:));
cbar = linspace(cMin-cMin*.1,cMax+cMax*.1,10);
savefile = 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\phaseResolvedVy';
framerate = 2;
area = zeros(1,10);


for i = 1:10
    
    %surf(squeeze(vy_single_cycle(i,:,:))); shading flat; zlim([cMin cMax]);
    
    %{
    contourf(squeeze(vy_single_cycle(i,:,:)),cbar);
    %}
    
    %colorbar
    %caxis([cMin cMax])
    
    [area(i), binFound] = recircAreaFinder(squeeze(vy_single_cycle(i,:,:)));
    
    contourf(binFound)
    
    colormap gray
    
    title(['vy, Phase angle: ' num2str(degrees(i))])
    set(gcf,'color','w');

    
    drawnow;
    pause(1/framerate)
    MakeGif_V2(gcf,i,savefile,framerate)
end

area(11) = area(1);

    polar(0:2*pi/10:2*pi,area)
    set(gcf,'color','w');
title('Recirculation Zone Area vs Phase Angle');