% harmonically reconstructed vortex ID
clear all
close all
clc

addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Vortex Tracking');

load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527b_Vectors-2.mat');
cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\SubOverTimeMin_sL=5_01'

reconstructed_vx  = HarmonicReconstructionFn( 400, vx, 4e3 );
clear vx;
reconstructed_vy  = HarmonicReconstructionFn( 400, vy, 4e3 );
clear vy;

[ binVort ] = jeongVortexFunction( x, y, reconstructed_vx, reconstructed_vy );

save('HarmonicallyReconstructed.mat');



%% Plotting code 


for frame = 1:size(binVort,1)

binary_image = imresize(squeeze(binVort(frame,:,:)),8);
binary_image_filtered = binary_image; %bwareafilt(binary_image,[128 1e5]);

F = loadvec(frame);
seeded_image = flipud(uint8(F.w'));
merged_image = imfuse(binary_image_filtered,seeded_image,'blend');
imshow(merged_image)
title(num2str(frame))
drawnow;
end