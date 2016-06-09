clear all
close all
clc

cd 'C:\Users\Tristan\Desktop\Research Data\150319\Set of 3 to Test Against\150321g\NonLinear_SubSlidingMin'

bounds = 1:300;

im7List = rdir('*.im7');
images = zeros(length(bounds),1024,1024,'uint8');

displayFirst = true;

for i = bounds
    F = loadvec(im7List(i));
    images(i,:,:) = uint8(flipud(F.w'));
    if displayFirst
        imshow(uint8(flipud(F.w')));
        drawnow;
    end
    clear F
end

if ~displayFirst
    for ii = bounds
        imshow(squeeze(images(ii,:,:)));
        drawnow;
    end
end