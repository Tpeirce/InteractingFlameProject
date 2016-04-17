%I  = F.w; % source of image

%%% Image Params
n = 5; % median filter neighborhood size, 3 or 5 suggested
sigma = 0.5; % std deviation of Gaussian distribution for gaussian filter
EDM = 'canny'; % edge detection method: canny, log, prewitt, roberts, sobel, zerocross
edgeLevel = []; % threshold level, chosen automatically when []
dispRange = [0,128]; % display range, chosen automatically when []. Suggest [0,4095] for 16 bit grayscale

%%%% Denoising

Im = medfilt2(I,[n,n]); % median filter to blur salt & pepper noise

%Ig = imgaussfilt(Im,sigma);

sigmaSpatial = min( size(I,2), size(I,1) ) / 16;
sigmaRange = 0.1 *  1000;  %(max(I(:)) - min(I(:)) );
samplingSpatial = sigmaSpatial;
samplingRange = sigmaRange;
b = bilateralFilter(Im,[],min(I(:)),max(I(:)),sigmaSpatial, sigmaRange,samplingSpatial,samplingRange);


Ie = edge(b,EDM,edgeLevel);

imshow(b,dispRange)