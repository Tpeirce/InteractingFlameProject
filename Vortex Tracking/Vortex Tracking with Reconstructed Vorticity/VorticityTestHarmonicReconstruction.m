
clear all
close all
clc

tic
addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Vortex Tracking');

load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527b_Vectors-2.mat');
cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\SubOverTimeMin_sL=5_01'

[ vorticity ] = vorticityFunction( x, y, vx, vy );
clear vx vy

reconstructed_vorticity  = HarmonicReconstructionFn( 400, vorticity, 4e3 );