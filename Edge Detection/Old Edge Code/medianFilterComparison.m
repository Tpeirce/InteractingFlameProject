n = 5:11;

range = [0 2^8]

for i = n
    figure;
    kernel = [i,i];
    imshow(medfilt2(I,kernel),range) 
    title(i)
end