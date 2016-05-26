
multiple = 0;

% Idea: adaptive number of rounds depending on how many "small" (area<min)
% areas are detected after binarizing. Could also try varying intensity
% threshold

rounds = 10;

%im7Files = rdir('C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150402h\NonLinear_SubSlidingMin\*.im7');

figure;

for i = 1:length(im7Files)
    F = loadvec(im7Files{i});
    I = flipud(F.w');
    edgeFinder(I, multiple, rounds)
    drawnow
        
end