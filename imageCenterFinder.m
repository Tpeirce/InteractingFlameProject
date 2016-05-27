function [ center ] = imageCenterFinder( I )

%% work

% based on my code for vector centerline finder

% TODO: split along lateral position into two matrices, then
% run xcor on the vectorized matrix to find best shift
%%%%%%%%%%%% centerline %%%%%%%%%%%%%%%%%%%%%%%

pass1 = I(:); 
pass2 = fliplr(pass1); 
shift = xcorr( pass1, pass2);
[~, tctr ] = max(shift);
center = (tctr)/size(I,1)/2; % (offset) + center, compensates for shift
figure;

testing = false;
if testing
    imshow(I)
    hold on;
    plot([center, center], get(gca,'ylim'))
    hold off;
end

end
