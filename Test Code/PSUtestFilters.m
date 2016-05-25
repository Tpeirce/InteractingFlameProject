tic;
m1 = medfilt2(I2);

m10 = m1;
for i = 1:9
    m10 = medfilt2(m10);
end

%{
m2 = medfilt2(m1);

figure;
subplot(2,2,1)
imshow(I2, range)
title('Original')

subplot(2,2,2)
imshow(m1, range)
title('med filt 1x')

subplot(2,2,3)
imshow(m2, range)
title('med filt 2x')

subplot(2,2,4)
imshow(m10, range)
title('med filt 10x')
%}

range = [0 2^8];

binarized = im2bw(uint8(m10),.5);

e = edge(binarized);

figure;
subplot(1,2,1)
imshow(k1, range)
title('kuwahara 1x')



subplot(2,2,2)
imshow(k2, range)
title('kuwahara 2x')

subplot(2,2,3)
imshow(l, range)
title('lagrangian')
toc
