close all
%I  = F.w; % source of image

%% Image Params
n = 5; % median filter neighborhood size, 3 or 5 suggested
medRounds = 1; % number of median filter rounds to do
% sigma = .75; % 0.02*(sqrt(2)*size(I,1)); % std deviation of Gaussian distribution for gaussian filter
EDM = 'canny'; % edge detection method: canny, log, prewitt, roberts, sobel, zerocross
edgeLevel = []; % threshold level, chosen automatically when []
dispRange = [0,128]; % display range, chosen automatically when []. Suggest [0,4095] for 16 bit grayscale

%% Image filtering

%==== smoothing =======

Im = I;
for idx = 1:medRounds
    Im = medfilt2(Im,[n,n]); % median filter to blur salt & pepper noise
end

%==== other filters =====

%Ig = imgaussfilt(Im,sigma);

% sigmaSpatial = min( size(I,2), size(I,1) ) / 16;
% sigmaRange = 0.1 *  (50-min(I(:)));
% samplingSpatial = sigmaSpatial;
% samplingRange = sigmaRange;
% b = bilateralFilter(Im,[],min(I(:)),max(I(:)), sigmaSpatial, sigmaRange,samplingSpatial,samplingRange);

bwLevel = graythresh(Im);
binarized = im2bw(uint8(Im),bwLevel);

Ie2 = edge(binarized,EDM,edgeLevel);

figure; imshow(binarized)

%boundaries = bwboundaries(Ie);

[bdyLen,idx] = sort(cellfun('length',boundaries),1,'descend');