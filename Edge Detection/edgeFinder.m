function [ boundaries ] = edgeFinder( I )
% I = image, rounds = number of rounds of median filter
    
    %% edgeFinder returns the full left and right edges in a cell array

    centerline = imageCenterFinder(I);
    Im = I;
    rounds = 1; % number of median filter iterations to perform
    n=9; % filter size
    connectivity = 8; % connectivity for bwboundaries
    
    
    for L = 1:rounds
        Im = medfilt2(Im, [n n]);
    end
    
    bwLevel = graythresh(uint8(Im));
    Ib = im2bw(uint8(Im),bwLevel);
    bwb = bwboundaries(Ib,connectivity,'noholes'); % all boundaries of regions in the image
    bl = cellfun('length',bwb); % length of all boundaries
    [~,bm] = sort(bl,1,'descend'); % sorted length of all boundaries
    sortedBWB = bwb(bm); % sorted list of all boundaries in image
    
    % left side
    
    for L = 1:length(bwb)
        workingBoundary = sortedBWB{L};
        [~, minLeft] = min(workingBoundary,[],1);
        if workingBoundary(minLeft,2) < centerline
            break % using break feels like cheating
        end
    end
        
    % right side
    
    for R = 1:length(bwb)
        workingBoundary = sortedBWB{R};
        [~, minRight] = min(workingBoundary,[],1);
        if workingBoundary(minRight,2) > centerline
            break % using break feels like cheating
        end
    end
    
    
    
    % at this point, l and r should be indices of left and right boundaries
    % in sortedBWB
    
    bL = sortedBWB{L};
    bR = sortedBWB{R};
    
    [~, maxLeft] = max(bL,[],1);
    [~, maxRight] = max(bR,[],1);
    
    bL = bL(minLeft:maxLeft,:);
    bR = [bR(maxRight:end,:); bR(1:minRight,:)];
    
    boundaries = {bL bR};
    
    testing = false;
    if testing
        
    
end