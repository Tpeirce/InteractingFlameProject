% Using FWHM to find shear layer

FWHM_idx = [];

% must be 128 x 128 matrix
shear_characterizing_data = time_avg_vorticity;
figure;
hold on;
imagesc(shear_characterizing_data)
set(gca,'YDir','normal');

for i = 1:size(shear_characterizing_data,1)
    functionalRow = abs(shear_characterizing_data(i,:));
    peak = max(functionalRow);
    rowLen = length(functionalRow);
    horzLine = [1:rowLen;peak/2+zeros(1,rowLen)];
    tempX = polyxpoly(  1:rowLen, functionalRow ,horzLine(1,:),horzLine(2,:)  );
    FWHM_idx = vertcat(FWHM_idx,[tempX, i * ones(length(tempX),1)]);

    %plots peak vorticity
    [~, maxIdx] = max(time_avg_vorticity(i,:));
    plot(maxIdx,i,'g.')
end

plot(FWHM_idx(:,1),FWHM_idx(:,2),'r.')


%{
test = abs(MaxPower(100,:));
hold on
plot(test,'.')
peak = max(test)
[xii yii] = polyxpoly(1:128,test,1:128,peak/2+zeros(128,1));
plot(1:128,[peak/2]+zeros(128,1),'.')
plot(xii,yii,'g.')
plot(findpeaks(test),'.')
%}