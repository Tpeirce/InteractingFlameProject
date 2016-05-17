% load('C:\Users\Tristan\Desktop\Research Data\CompleteData\150402b_Vectors.mat', 'vy');

bounds = 1:100;
total = vy(bounds,:,:);
upper = max(total(:));
lower = min(total(:));

x = linspace(lower,upper,20);

for i = bounds
    t = squeeze(vy(i,:,:)); 
    contourf(t,x); caxis([lower upper]); colorbar; colormap hot; 
    %imshow(flipud(t>0))
    drawnow;
end
close;