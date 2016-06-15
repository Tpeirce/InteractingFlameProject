% start in dir with .im7 files to visualize

bounds = 1:300;

vy_mean_big = imresize(flipud(vy_mean),8,'nearest');
binarized = vy_mean_big>0;

im7List = rdir('*.im7');
images = zeros(length(bounds),1024,1024,'uint8');
for i = bounds
    F = loadvec(im7List(i));
    images(i,:,:) = uint8(flipud(F.w'));
    clear F
end

for ii = bounds
    imshow(squeeze(images(ii,:,:)));
%     hold on;
%     h = imshow(binarized);
%     alpha(h,.7)
%     hold off;
    drawnow;
end