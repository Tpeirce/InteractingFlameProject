tic
close all;
%folder = 'C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150402h\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\';
file = '150402h_Vectors.mat';

%% optimizing loading
loadT = find(ismember({'wz'},who)); % checks workspace to see if these vars have already been loaded in

if(isempty(loadT)) % find will return an empty array if vars are loaded in
    data = matfile(strcat(folder,file));
    wz=data.wz;
end


UxMean = mean( Ux , 3 );
UyMean = mean( Uy , 3 );

contourf( UyMean )

%{
figure;
for ii = 23 : 50
   
    plot( 1 : size( UyMean , 1 ) , UyMean( : , ii ) , 'ko-' );
    
    drawnow
    pause(0.1)
     
end
%}


%% setting up vars
i = 1;
[~,~,last] = size(wz);
step = 2;
% last = 10; % last entry to pull from
%frames(last) = struct('cdata',[],'colormap',[]);
%[ X , Y ] = meshgrid( x_coord , y_coord );

% getting axis limits for smoother viz
maxZ = max(max(max(wz(:,:,1:last))));
minZ = min(min(min(wz(:,:,1:last))));
meanZ = mean(wz(:,:,:),3);

meanZ = mean(Ux,3);

zAx = linspace(-.5,.5,20);

zAx = linspace(-10,10,20);
contourf(meanZ, zAx);


%{
figure
bar3( max(wz(:,:,1:10),[],3));
figure
bar3( min(wz(:,:,1:10),[],3));

avg = (max(wz(:,:,1:10),[],3)-min(wz(:,:,1:10),[],3))/.2;
figure
bar3(avg);
figure
contourf(avg);
%}

%% actual work

%{
parfor i = 1:last
    
        h = figure('Visible','off', 'Position', [0,0,700,700]);
        hold on;
        %contourf(wz(:,:,i));
        bar3(wz(:,:,i));
        modAx = h.CurrentAxes;
        modAx.ZLim = [minZ, maxZ];
        view(3);
        frames(i) = getframe(gcf);
        close all;
        clear h;
        i
end




gca.visible = 'off';
gca.position = [0,0,0,0];
movie(frames,1,10)

toc

%}