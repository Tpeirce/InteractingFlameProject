tic
close all;

%% work
UyMean = mean( Uy , 3 );

% remember, Uy is axial velocity
% in Uy mean, cols are axial positions
% first position is lateral position, second is axial

% TODO: split along lateral position into two matrices, then
% run xcor on the vectorized matrix to find best shift

shift = conv(UyMean(:),UyMean(:));


[~, tctr ] = max(shift);
center = tctr-128+64; % compensates for shift

centers = [centers, tctr];

close all;
figure;
hold on;

plot(UyMean(:,axPos))
plot([center, center], get(gca,'ylim'))    

%{
plot(shift)
plot([tctr, tctr], get(gca,'ylim'))    


    drawnow
    pause(0.1)
    hold off;
end
%}

toc
