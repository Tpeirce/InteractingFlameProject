% generate a test field of 128x128x5000 vectors
% based on FFT test code

% preallocation

clear all
close all
clc

addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Vortex Tracking');

npts = 5000; % 5000 points
Fs = 4000; % sampling freq at 4kHz

t = 0:1/Fs:(npts-1)/Fs; % total of 1.25 sec

% aiming for 400 Hz sin, 100 Hz cos
% shift of half a period for cos
% amplitude of 2 for sin, .75 for cos

x = (2*sin(t .* 2 * pi * 400) + .75*cos(t.* 2 * pi * 100 + pi/2)).';

vy = repmat(x,[1, 128, 128]);

reconstructed_vy = HarmonicReconstructionFn(400,vy,4e3);

plot(t(1:100),vy(1:100,50,50))
hold on
plot(t(1:100),reconstructed_vy(1:100,50,50))
xlabel('time (s)')
ylabel('amplitude')
title('Time-varying vector: (1:100,50,50)')
legend('vy','reconstructed vy')