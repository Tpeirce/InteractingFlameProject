
multiple = 0;

addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Edge Detection');
% Idea: adaptive number of rounds depending on how many "small" (area<min)
% areas are detected after binarizing. Could also try varying intensity
% threshold

rounds = 1;
range = [0 2^8];
%if exist('im7Files')
    im7Files = rdir('C:\Users\Tristan\Desktop\Research Data\150319\Set of 3 to Test Against\150402h\*.im7');
%end

h = figure;

for i = 1:length(im7Files)
    F = loadvec(im7Files{i});
    I = flipud(F.w');
    clf(h)
    boundaries = edgeFinder(I);
    
    bL = boundaries{1};
    bR = boundaries{2};
    
    
    % display code
    imshow(I,range);
    hold on
    plot(bL(:,2),bL(:,1),'r.')
    plot(bR(:,2),bR(:,1),'g.')
    hold off;
    title(['Frame = ' num2str(i)])
    drawnow
    %M(i) = getframe;
end

 %{ 
    V = VideoWriter('flameEdgeTest.mp4','MPEG-4');
    open(V);
    writeVideo(V, M);
    close(V)
%}