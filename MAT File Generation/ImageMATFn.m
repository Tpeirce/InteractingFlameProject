function ImageMATFn()


im7List = rdir('*.im7');
images = zeros(length(im7List),1024,1024,'uint8');
for i = 1:length(im7List)
    F = loadvec(im7List(i));
    images(i,:,:) = uint8(F.w);
    clear F
end

F = loadvec(im7List(1));
x = F.x;
y = F.y;

save('images.mat', 'x','y','images', '-v7.3');
clear F x y images im7List

end

