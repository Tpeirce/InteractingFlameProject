function [ center, confidence ] = vectorCenterFinder( field )

%% Finds center of vector field. Recommend time-averaged

% Assumes vectorfield centerline is perfectly vertical
% center is returned as a double, to show the center

%%%% NOTE: This assumes columns are x, rows are y  %%%%

% vy_mean is axial velocity
% in Uy mean, cols are axial positions
% 
% first position is lateral position, second is axial

% TODO: split along lateral position into two matrices, then
% run xcor on the vectorized matrix to find best shift
%%%%%%%%%%%% centerline %%%%%%%%%%%%%%%%%%%%%%%
% laser sheet/camera FOV includes burner obstruction?/some zeros
% removing it by removing rows with avg velocity less than .01, which is
% arbitrary but should work

%{
% row removal section - removes rows which shouldn't matter but equally influence centerline
 threshold = .01;
 rowsRemove = mean(abs(vy_mean),2) > threshold; % selects rows with a high mean velocity to keep
 Fvy_mean = vy_mean(rowsRemove,:); % filter out rowsRemove rows (selects rows to keep)
%}

%%% centerline
% this ends up being almost auto-convolution for a 2d matrix in one
% dimension
field = squeeze(field);
pass1 = field(:); 
flipped = fliplr(field); 
pass2 = flipped(:); 
shift = xcorr( pass1, pass2);
[~, tctr ] = max(shift);
center = (tctr)/size(field,1)/2; % (offset) + center, compensates for shift

testing = false;
if testing
    figure;
    hold on;
    plot(field')
    plot([center, center], get(gca,'ylim'))
    hold off;
end

end
