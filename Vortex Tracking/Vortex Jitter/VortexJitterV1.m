% compute vorticity, harmonically reconstruct it at 400 Hz
% find time-averaged vorticity field, use max/min to find lines of streamwise peak
% vorticity
% Plot phase along these chosen lines

clear; close all; clc; tic
addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Vortex Tracking');


% remember to use an acoustically forced case
                                                                         %%%%    %%%%        %%%%
load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527b_Vectors-2.mat');
                                                                         %%%%    %%%%        %%%%
load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527bTimeAverageVectors-2.mat', 'x_norm','y_norm');
                                                                       %%%%
cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\SubOverTimeMin_sL=5_01'
vx = fliplr(vx);
vy = fliplr(vy);


%% setting vars
framerate = 4e3;
omega = 400;



[ vorticity ] = vorticityFunction( x, y, vx, vy );
clear vx vy

sliced_vorticity = cat(4,vorticity(1:1000,:,:), vorticity(1001:2000,:,:), vorticity(2001:3000,:,:), vorticity(3001:4000,:,:), vorticity(4001:5000,:,:));
ensemble_averaged_vorticity = squeeze(mean(sliced_vorticity,4));

% the ensemble average has (@10frames/cycle= 4kHz/400Hz, 1000 frames) 100 cycles


reconstructed_vorticity  = HarmonicReconstructionFn( 400, ensemble_averaged_vorticity, 4e3 ); % harmonically reconstructed vorticity field
time_averaged_vorticity = squeeze(mean(vorticity,1)); % time-averaged vorticity field, not reconstructed

[~, zero_vec] = min(abs(x_norm)); % x vector position of normalized zero 
[~, minus_one_vec] = min(abs(-1 - x_norm)); % x vector position of normalized -1
[~, plus_one_vec] = min(abs(1 - x_norm)); % x vector position of normalized 1

numRows = length(y_norm); % number of rows to iterate through
left_indices = zeros(numRows,1); % preallocating left side
right_indices = zeros(numRows,1); % preallocating right side

range_neg_one = minus_one_vec:zero_vec; % for subselecting vectors to search through left side
range_pos_one = zero_vec:plus_one_vec; % for subselecting vectors to search through right side

for row1 = 1:numRows
    [~, left_indices(row1)] = min(time_averaged_vorticity(row1,range_neg_one)); % finding minimum vorticity point
    [~, right_indices(row1)] = max(time_averaged_vorticity(row1,range_pos_one)); % finding maximum vorticity point
end
% both indices median filtered
left_indices = (left_indices + minus_one_vec); % shifting because search was downselected to -1 to 0 normalized
right_indices = (right_indices + zero_vec); % shifting because search was downselected to 0 to 1 normalized

%{
imagesc(time_averaged_vorticity)
set(gca,'ydir','normal')
hold on
plot(left_indices,1:numRows)
plot(right_indices,1:numRows)
%}


left_phases = zeros(length(y_norm),1);
right_phases = zeros(length(y_norm),1);

field = reconstructed_vorticity;
t = (1:size(field,1))' / framerate;
npts = size(field,1);
f = framerate*(0:(npts/2))/npts;
[~, omegaVec] = min(abs(f-omega));


for row2 = 1:numRows
    
    % left phases
    
    %                frame, y, x
    tempFFT = fft(field(:,row2,left_indices(row2)));
    % magnitude of FFT - becomes A
    tempA = abs(tempFFT/npts.*2);
    tempA = tempA(omegaVec);
    % phase shift - becomes phi
    tempPhi = atan2(imag(tempFFT),real(tempFFT));
    tempPhi = tempPhi(omegaVec);
    left_phases(row2) = tempPhi;
    
    
    % right phases
    clear tempFFT tempA tempPhi
    %                frame, y, x
    tempFFT = fft(field(:,row2,right_indices(row2)));
    % magnitude of FFT - becomes A
    tempA = abs(tempFFT/npts.*2);
    tempA = tempA(omegaVec);
    % phase shift - becomes phi
    tempPhi = atan2(imag(tempFFT),real(tempFFT));
    tempPhi = tempPhi(omegaVec);
    right_phases(row2) = tempPhi;
end

plot_window = 1:128;
plot(y_norm(plot_window),unwrap(left_phases(plot_window)))
hold on
plot(y_norm(plot_window),unwrap(right_phases(plot_window)) + pi)
legend('Left Phases', 'Right Phases')
xlabel('y/D')
ylabel('Phase (rads)')
grid on

avgWindow = mean(unwrap(left_phases(plot_window)) - unwrap(right_phases(plot_window)));
avg = mean(unwrap(left_phases) - unwrap(right_phases));