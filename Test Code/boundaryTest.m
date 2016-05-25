
bw = im2bw(uint8(I),graythresh(uint8(I)));
bwb = bwboundaries(bw);
bl = cellfun('length',bwb);
[~,bm] = sort(bl,1,'descend');

c1 = bwb{bm(1)}; % longest boundary is set to c1
c2 = bwb{bm(2)}; % starting to setup 2nd longest boundary in prep for extending to n-longest boundaries

bt = bwtraceboundary(bw,c1(1,:),'NW'); 
bt2 = bwtraceboundary(bw,c2(1,:),'NW'); 

imshow(bw);
%imshow(I)

hold on
plot(bt(:,2),bt(:,1),'r.')
plot(bt2(:,2),bt2(:,1),'g.')