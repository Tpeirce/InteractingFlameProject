function [ center ] = vectorCenterFinder( vy_mean )

%% work

% vy_mean is axial velocity
% in Uy mean, cols are axial positions
% first position is lateral position, second is axial

% TODO: split along lateral position into two matrices, then
% run xcor on the vectorized matrix to find best shift
%%%%%%%%%%%% centerline %%%%%%%%%%%%%%%%%%%%%%%
% laser sheet/camera FOV includes burner obstruction?/some zeros
% removing it by removing rows with avg velocity less than .01, which is
% arbitrary but should work

threshold = .01;

rowsRemove = mean(abs(vy_mean),2) > threshold; % selects rows with a low mean velocity to remove
Fvy_mean = vy_mean(rowsRemove,:); % filter out rowsRemove rows
%%% centerline
pass1 = Fvy_mean(:)'; 
pass2 = fliplr(pass1); 
shift = xcorr( pass1, pass2);
[~, tctr ] = max(shift);
center = (tctr)/size(Fvy_mean,1)/2; % (offset) + center, compensates for shift
figure;
hold on;
plot(vy_mean')
plot([center, center], get(gca,'ylim'))
hold off;

toc
