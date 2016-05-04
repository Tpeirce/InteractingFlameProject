tic
close all;
folder = 'F:\Research Data\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis\';
file = 'v7.3_150321g_Data.mat';

%% optimizing loading
loadT = find(ismember({'wz'},who)); % checks workspace to see if these vars have already been loaded in

if(isempty(loadT)) % find will return an empty array if vars are loaded in
    data = matfile(strcat(folder,file));
    wz=data.wz;
end


%% setting up vars
i = 1;
[~,~,last] = size(wz);
step = 2;
last = 10;
frames(last) = struct('cdata',[],'colormap',[]);
%[ X , Y ] = meshgrid( x_coord , y_coord );

% getting axis limits for smoother viz
zMax = max(wz(:));
zMin = min(wz(:));
zStep = 10;
%zAx = [zMin, linspace(-3,.5,zStep), zMax];
zAx = linspace(-3,.5,zStep);

%% actual work
for i = 1:last 

    
        h = figure('Visible','off', 'Position', [0,0,700,700]);
        hold on;
            bar3(wz(:,:,i));
            modAx = h.CurrentAxes;
            modAx.ZLim = [zMin, zMax];
            view(3);
            frames(i) = getframe(gcf);
        
        
        frames(i) = getframe(gcf);


        
        close all;
        i
end

gca.visible = 'off';
gca.position = [0,0,0,0];
movie(frames,1,30)

toc