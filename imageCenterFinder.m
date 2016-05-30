function [ center ] = imageCenterFinder( I )

%% Finds image center

% based on my code for vector centerline finder

% TODO: split along lateral position into two matrices, then
% run xcor on the vectorized matrix to find best shift instead of
% vectorizing whole matrix
%%%%%%%%%%%% centerline %%%%%%%%%%%%%%%%%%%%%%%

pass1 = I(:); 
flipped = fliplr(I); 
pass2 = flipped(:);
shift = xcorr( pass1, pass2);%, size(I,1)/2);
[~, tctr ] = max(shift); % temp center, ie maximum correlation coefficient for correlated vectors
center = (tctr)/size(I,1)/2; % (offset) + center, compensates for shift

testing = false;
if testing
    figure;
    image(I)
    hold on;
    plot([center, center], get(gca,'ylim'))
    plot(shift)
    hold off;
end

end
