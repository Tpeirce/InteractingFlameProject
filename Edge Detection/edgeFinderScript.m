
multiple = 0;

% Idea: adaptive number of rounds depending on how many "small" (area<min)
% areas are detected after binarizing. Could also try varying intensity
% threshold

rounds = 1;
range = [0 2^8];

%im7Files = rdir('C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150402h\NonLinear_SubSlidingMin\*.im7');

for i = 1:length(im7Files)
    F = loadvec(im7Files{i});
    I = flipud(F.w');
    close
    boundaries = edgeFinder(I, rounds, h);
    
    bL = boundaries{1};
    bR = boundaries{2};
    
    
    % display code
    imshow(I,range);
    hold on
    plot(bL(:,2),bL(:,1),'r.')
    plot(bR(:,2),bR(:,1),'g.')
    hold off;
    drawnow
end