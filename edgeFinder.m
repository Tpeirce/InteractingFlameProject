function [ boundaries ] = edgeFinder( I , multiple, rounds)
    Im = I;
    for i = 1:rounds
        Im = medfilt2(Im);
    end
    
    centerline = 
    
    
    bwLevel = graythresh(uint8(Im));
    Ib = im2bw(uint8(Im),bwLevel);
    bwb = bwboundaries(Ib);
    bl = cellfun('length',bwb);
    [~,bm] = sort(bl,1,'descend');

    % picking out 4 longest boundaries, for plotting/extraction
    c1 = bwb{bm(1)}; 
    c2 = bwb{bm(2)}; 
    c3 = bwb{bm(3)}; 
    c4 = bwb{bm(4)}; 
    [~, c1minIdx] = min(c1(:,1));
    [~, c2minIdx] = min(c2(:,1));
    [~, c3minIdx] = min(c3(:,1));
    [~, c4minIdx] = min(c4(:,1));
    
    if c1(c1minIdx,2) < centerline
    
    
    if multiple
        
    
    
    bt1 = bwtraceboundary(Ib,c1(1,:),'NW'); 
    bt2 = bwtraceboundary(Ib,c2(1,:),'NW'); 
    
    if multiple
        
        bt3 = bwtraceboundary(Ib,c3(1,:),'NW'); 
        bt4 = bwtraceboundary(Ib,c4(1,:),'E'); 
    end
    
    
    
    imshow(Ib);
    %imshow(I)

    hold on
    plot(bt1(:,2),bt1(:,1),'r')
    plot(bt2(:,2),bt2(:,1),'g')
    
    if multiple
        plot(bt3(:,2),bt3(:,1),'b')
        plot(bt4(:,2),bt4(:,1),'k')
    end
    drawnow
end

