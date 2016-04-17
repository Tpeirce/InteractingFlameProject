function ImageMATFn()


im7List = rdir('*.im7');
numFrames = length(im7List);
images = zeros(numFrames,1024,1024,'uint16');
for i = 1:numFrames
    F = loadvec(im7List(i));
    images(i,:,:) = uint16(F.w);
    clear F
end

F = loadvec(im7List(1));
x = F.x;
y = F.y;

save('images16Bit.mat', 'x','y','images', '-v7.3');
clear F x y images im7List
%toc

end

