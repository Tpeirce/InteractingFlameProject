tic;

startf = 4000;

meanField = zeros(1,128,128);
meanFinal = mean(vy,1);
correlations = zeros(size(vy,1)-startf,1);

parfor i = 1:size(vy,1)
    meanField = mean(vy(startf:i,:,:),1);
    difference = (meanFinal - meanField);
    correlations(i) = (sum(difference(:)))/128^2;
end

plot(correlations)
toc