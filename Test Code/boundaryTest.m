
bw = im2bw(Im,.5);
bwb = bwboundaries(bw);
bl = cellfun('length',bwb);
[~,bm] = sort(bl,1,'descend');

c1 = bwb{bm(1)}; % longest boundary is set to c1
c2 = bwb{bm(2)}; % starting to setup 2nd longest boundary in prep for extending to n-longest boundaries

bt = bwtraceboundary(bw,c1(1,:),'NW'); 
imshow(bw);
%imshow(I)

hold on
plot(bt(:,2),bt(:,1))