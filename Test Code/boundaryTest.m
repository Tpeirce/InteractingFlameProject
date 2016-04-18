
bw = im2bw(Im,.5);
bwb = bwboundaries(bw);
bl = cellfun('length',bwb);
[~,bm] = max(bl);

c1 = bwb{bm};

bt = bwtraceboundary(bw,c1(1,:),'NW'); 
imshow(bw);
%imshow(I)

hold on
plot(bt(:,2),bt(:,1))