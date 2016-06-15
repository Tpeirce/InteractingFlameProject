% load('C:\Users\Tristan\Desktop\Research Data\CompleteData\150402b_Vectors.mat', 'vy');
%load('C:\Users\Tristan\Desktop\Research Data\150319\Set of 3 to Test Against\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\150321g_vorticity.mat');

vy = vorticity;

bounds = 1:400;
total = vy(bounds,:,:);
upper = max(total(:));
lower = min(total(:));

vy_mean = squeeze(mean(vy,1));

x = linspace(lower,upper,20);

for i = bounds
    t = squeeze(vy(i,:,:)); 
    contourf(t,x); caxis([lower upper]); colorbar; colormap hot; 
    
%     hold on;
%     h = imshow(flipud(vy_mean<0));
%     alpha(h,.5);
%     hold off;
    drawnow;
end

close;