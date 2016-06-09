%addpath('C:\Users\Tristan\Desktop\Research Data\150319\Set of 3 to Test Against\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc');

s = squeeze(vorticity(1:300,40,:));

surf(s)
xlabel('Lateral position')
ylabel('Time (frames)')
zlabel('Vorticity')


shading flat