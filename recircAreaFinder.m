tic
close all;

% remember to load vars in workspace

%%%%%%%%%%%% centerline %%%%%%%%%%%%%%%%%%%%%%%
% laser sheet/camera FOV includes burner obstruction?/some zeros
% removing it by removing rows with avg velocity less than .01, which is
% arbitrary but should work
%vy_mean = squeeze(mean(vy,1));
threshold = .01;
rowsKeep = mean(abs(vy_mean),2) > threshold; % select rows that aren't mostly 0
Fvy_mean = vy_mean(rowsKeep,:); % filter out first x rows
%%% centerline
pass1 = Fvy_mean(:)'; 
pass2 = fliplr(pass1); 
shift = xcorr( pass1, pass2);
[~, tctr ] = max(shift);
center = round((tctr)/size(Fvy_mean,1)/2); % (offset) + center, compensates for shift
%%%      ^ round is a hack that I should fix since it could cause problems

%%% area 
%%% note this assumes RZ is a convex polygon and center is in the center, which may not be correct
area = 0;
binSearch = Fvy_mean <= 0; % creating a binary matrix to highlight RZ
binFound = false(size(binSearch));
for i = 1:size(binSearch,1)
    if binSearch(i,center) == 1
        area = area+1; % keeping track
        binFound(i,center)=1; % keeping track
        
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


%%%%%%%%%% viz %%%%%%%%%%%%%%%

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

area

toc