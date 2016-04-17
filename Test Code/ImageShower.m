

for i = 1:length(images)
    imshow(flipud(squeeze(images(i,:,:))'))
    %imshow(flipud(squeeze(images(i,:,:))')),[0,4095])
    drawnow
end