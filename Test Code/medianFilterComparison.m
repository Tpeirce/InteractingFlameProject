n = 5:11;

for i = n
    figure;
    kernel = [i,i];
    imshow(medfilt2(I,kernel)) 
    title(i)
end