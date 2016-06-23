clear all
%close all
clc

cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160520f\SubOverTimeMin_sL=5'

bounds = 1:300;

%im7List = rdir('*.im7');

displayFirst = false;

bitDepth = 5;
displayRange = [0 2^bitDepth];

if ~displayFirst
    images = zeros(length(bounds),1024,1024,'uint8');
else
    figure
end
    
for i = bounds
    % note: since we've cd'ed to the proper dir, can just loadvec(i)
    F = loadvec(i);
    tempImg = uint8(F.w');
    %images(i,:,:) = tempImg;
    if displayFirst
        imshow(tempImg);
        set(gca,'Ydir','Normal')
        
        drawnow;
    else
        images(i,:,:)=tempImg;
    end
    clear F
end