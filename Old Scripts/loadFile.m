tic
close all;

%% file handling
if isequal(exist('C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150402h\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\', 'dir'),7) 
    c = 'D';
    folder = 'C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis\';
elseif isequal(exist('F:\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis\', 'dir'), 7) 
    c = 'L';
    folder = 'F:\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis\';
end

file = 'v7.3_150321g_Data.mat';

%% optimizing loading
loadT = find(ismember({'wz'},who)); % checks workspace to see if these vars have already been loaded in
data = matfile(strcat(folder,file));
if(not(exist('wz','var')))
    wz=data.wz;
end
if(not(exist('Ux','var')))
    Ux = data.Ux;
end
if(not(exist('Uy','var')))
    Uy = data.Uy;
end
if(not(exist('x_coord','var')))
    x_coord = data.x_coord;
end
if(not(exist('y_coord','var')))
    y_coord = data.y_coord;
end


%%

