close all
clc

cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\SubOverTimeMin_sL=5_01'
load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527bTimeAverageVectors-2.mat','x_norm','y_norm');

if ~exist('im7List','var')
    clear all
    im7List = rdir('*.im7');
end

bounds = 1:300;

displayFirst = true;

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
        imagesc(x_norm,y_norm,tempImg);
        colormap(gray);
        set(gca,'Ydir','Normal')
        
        drawnow;
    else
        images(i,:,:)=tempImg;
    end
    clear F
end