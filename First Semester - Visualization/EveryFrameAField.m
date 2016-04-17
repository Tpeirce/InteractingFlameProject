tic
close all;
clear h i last frames;
folder = 'C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis\';
file = 'v7.3_150321g_Data.mat';

%% optimizing loading
loadT = find(ismember({'Ux','Uy','x_coord','y_coord'},who)); % checks workspace to see if these vars have already been loaded in

if(isempty(loadT)) % find will return an empty array if vars are loaded in
    data = matfile(strcat(folder,file));
    Ux = data.Ux;
    Uy = data.Uy;
    x_coord = data.x_coord;
    y_coord = data.y_coord;
end

%% setting up vars
i = 1;
[~,~,last] = size(Ux);
step = 2;
last = 10;
frames(last) = struct('cdata',[],'colormap',[]);
[ X , Y ] = meshgrid( x_coord , y_coord );


%% actual work
for i = 1:last
    
        elementX = Ux(:,:,i);
        elementY = Uy(:,:,i);
        mag = sqrt(elementX.^2+elementY.^2);
        h = figure('Visible','off', 'Position', [0,0,700,700]);
        hold on;
        contourf(X , Y , mag);
        %quiver( x_coord(1:step:end) , y_coord(1:step:end) , Uy(1:step:end, 1:step:end, i) , Ux(1:2:end, 1:2:end ,i), 4 , 'k');
        quiver( x_coord , y_coord , Uy(:,:,i) , Ux(:,:,i), 4 , 'k');
        frames(i) = getframe(gcf);
        close all;
        i
        clear h;
end

gca.visible = 'off';
gca.position = [0,0,0,0];
movie(frames,1,10)

toc