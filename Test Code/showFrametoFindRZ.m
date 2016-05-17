% load('C:\Users\Tristan\Desktop\Research Data\CompleteData\150402b_Vectors.mat', 'vy');

bounds = 1:100;
total = vy(bounds,:,:);
upper = max(total(:));
lower = min(total(:));

vy_mean = squeeze(mean(vy,1));

x = linspace(lower,upper,20);

for i = bounds
    t = squeeze(vy(i,:,:)); 
    contourf(flipud(t),x); caxis([lower upper]); colorbar; colormap hot; 
%     hold on;
%     h = imshow(flipud(vy_mean<0));
%     alpha(h,.5);
%     hold off;
    drawnow;
end

close;