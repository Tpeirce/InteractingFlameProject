addpath('\\tbos\Projects\Engineering\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc');
load('150321g_vorticity.mat');

s = squeeze(vorticity(1:300,40,:));

surf(s)
xlabel('Lateral position')
ylabel('Time (frames)')
zlabel('Vorticity')


shading flat