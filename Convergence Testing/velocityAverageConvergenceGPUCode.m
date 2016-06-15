if(~exist('G','var'))
    G = gpuArray(vy);
end

meanField = zeros(1,128,128,'gpuArray');
meanFinal = mean(G,1);
correlations = zeros(size(G,1),1,'gpuArray');

for i = 1:size(G,1)
    meanField = mean(G(1:i,:,:),1);
    difference = (meanFinal - meanField);
    correlations(i) = (sum(difference(:)))/128^2;
end

plot(correlations)