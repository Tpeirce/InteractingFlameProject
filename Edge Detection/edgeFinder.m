function [ boundaries ] = edgeFinder( I , rounds, h)
% I = image, rounds = number of rounds of median filter, h = figure handle
% to plot to
    
    centerline = imageCenterFinder(I);
    Im = I;
    n=9;
    for L = 1:rounds
        Im = medfilt2(Im, [n n]);
    end
    
    bwLevel = graythresh(uint8(Im));
    Ib = im2bw(uint8(Im),bwLevel);
    bwb = bwboundaries(Ib,8,'noholes'); % all boundaries of regions in the image
    bl = cellfun('length',bwb); % length of all boundaries
    [~,bm] = sort(bl,1,'descend'); % sorted length of all boundaries
    sortedBWB = bwb(bm); % sorted list of all boundaries in image
    
    % left side
    
    for L = 1:length(bwb)
        workingBoundary = sortedBWB{L};
        [~, tempIdx] = min(workingBoundary,[],1);
        if workingBoundary(tempIdx,2) < centerline
            break % using break feels like cheating
        end
    end
        
    % right side
    
    for R = 1:length(bwb)
        workingBoundary = sortedBWB{R};
        [~, tempIdx] = min(workingBoundary,[],1);
        if workingBoundary(tempIdx,2) > centerline
            break % using break feels like cheating
        end
    end
    
    
    
    % at this point, l and r should be indices of left and right boundaries
    % in sortedBWB
    
    bL = sortedBWB{L};
    bR = sortedBWB{R};
    
    boundaries = {bL bR};
end

