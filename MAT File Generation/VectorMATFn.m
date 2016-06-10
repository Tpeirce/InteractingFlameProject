function [ ] = VectorMATFn( )

v = loadvec('*.vc7');
x = v.x;
y= v.y;
numFrames = size(v,2);
dirParts = strsplit(pwd, '\');
fileName = dirParts(end-3); %% use this as filenames for vectors and vorticity when not testing



%%%%%%%%%%%%%%%%%%% Vorticity %%%%%%%%%%%%%%%%%%%

W = vec2scal(v, 'rot');
vorticity = zeros(numFrames,128,128);
for i = 1:numFrames
   vorticity(i,:,:) = W(i).w'; 
end

time_avg_vorticity = squeeze(mean(vorticity,1)); % fix this - doesn't give the same result as preexisting file


save(strcat(fileName{1}, '_vorticity.mat'), 'vorticity', 'x','y', 'time_avg_vorticity', '-v7.3');
clear W vorticity

%%%%%%%%%%%%%%%%%%% Velocity %%%%%%%%%%%%%%%%%%%

%%%%%% vx %%%%%%

vx = zeros(numFrames,128,128);
for i = 1:numFrames
   vx(i,:,:) = v(i).vx'; 
end

%%%%%% vy %%%%%%

vy = zeros(numFrames,128,128);
for i = 1:numFrames
   vy(i,:,:) = v(i).vy'; 
end

clear v i
save(strcat(fileName{1}, '_Vectors.mat'), 'x','y','vx','vy', '-v7.3');

%%%%%%%%%%%%%%%%%%% TimeAverageVectors %%%%%%%%%%%%%%%%%%%


vx_mean = squeeze(mean(vx,1));
vy_mean = squeeze(mean(vy,1));

save(strcat(fileName{1}, '_TimeAverageVectors.mat'), 'x','y','vx_mean','vy_mean', '-v7.3');

clear vx vy x y time_avg_vorticity vx_mean vy_mean


toc


end

