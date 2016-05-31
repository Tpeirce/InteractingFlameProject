function [ area, binFound] = recircAreaFinder( vy_mean )

% remember to load vars in workspace
center = vectorCenterFinder(vy_mean);

%% area finding
%%% Assumptions: RZ is a convex polygon
area = 0;
binSearch = Fvy_mean <= 0; % creating a binary matrix to highlight RZ
binFound = false(size(binSearch));
for i = 1:size(binSearch,1)
    if binSearch(i,center) == 1
        area = area+1; % keeping track
        binFound(i,center)=1; % keeping track of where RZ is
        
        % search left
        j = 0;
        while binSearch(i,center-j) == 1
            area=area+1;
            binFound(i,center-j)=1;
            j=j+1;
        end
        % search right
        k = 0;
        while binSearch(i,center+k) == 1
            area=area+1;
            binFound(i,center+k)=1;
            k=k+1;
        end
    end
end


% Visualization
testing = false;
if testing
    figure;
    hold on;
    plot(vy_mean')
    plot([center, center], get(gca,'ylim'))
    hold off;
    figure;
    zAx = [ linspace(min(vy_mean(:)),0,10), 0, max(vy_mean(:))];
    [C, ~] = contourf(vy_mean, zAx);
    hold on
    plot([center, center], get(gca,'ylim'),'b')
    colormap hot
    colorbar;
    figure;
    imagesc(flipud(binFound)) % image flipped because conventions, so unflip
    colormap(gray); % black and white is better than purple and yellow
end
end