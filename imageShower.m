clear all
%close all
clc

cd 'C:\Users\Tristan\Desktop\Research Data\150319\150402f\NonLinear_SubSlidingMin'

bounds = 1:300;

%im7List = rdir('*.im7');
%images = zeros(length(bounds),1024,1024,'uint8');

displayFirst = true;

figure;
for i = bounds
    % note: since we've cd'ed to the proper dir, can just loadvec(i)
    F = loadvec(i);
    tempImg = uint8(F.w');
    %images(i,:,:) = tempImg;
    if displayFirst
        imshow(tempImg);
        set(gca,'Ydir','Normal')
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