I = squeeze(images(1,:,:));
range = [0,4095];

w2 = wiener2(I);
m2 = medfilt2(I);
a2 = filter2(fspecial('average',3),I)/255; % averaging filter
% g2 = imgaussfilt(I);
% o2 = ordfilt2(I);
i2 = imguidedfilter(I);

% g3 = imgaussfilt3(images(1:10,:,:));

% imshowpair
% montage

figure;%subplot(2,3,1)
imshow(I,range)
figure%subplot(2,3,2)
imshow(w2,range)
figure%subplot(2,3,3)
imshow(m2,range)
figure%subplot(2,3,4)
imshow(a2,range)
figure%subplot(2,3,5)
imshow(i2,range)