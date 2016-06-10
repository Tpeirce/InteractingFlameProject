clear all
close all
clc
tic;

%%%%%%%%%%%%%%%%%%% INSTRUCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 1. Change MATLAB directory to the directory containing the cases you wish
% to process.
% 
% 2. Run script.
% 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\MAT File Generation');

tld = pwd;
files = dir('.');
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolders(1:2) = [];

for i = 1:length(subFolders)
    cd(subFolders(i).name);
    cd 'NonLinear_SubSlidingMin';
    %ImageMATFn16Bit();
    cd 'TR_PIV_MP(2x16x16_50%ov)\PostProc';
    VectorMATFn();
    cd(tld);
end

toc