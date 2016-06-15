% Shear layer finding

close all
%clear all
clc

addpath('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160520f\160520f_DAT');
%{
% loading
Fs = 4e3; % sampling frequency, 4 kHz
Mvec = load('160520fTimeAverageVectors-2.mat');
Mvor = load('160520f_Vectors-2.mat');
Mvor.vorticity = vorticityFunction(Mvor.x,Mvor.y,Mvor.vx,Mvor.vy);
vor.time_avg_vorticity = squeeze(mean(Mvor.vorticity,1));
Mvor.x_norm = Mvec.x_norm;
Mvor.y_norm = Mvec.y_norm;
Mvor = rmfield(Mvor,{'vx','vy'});
time_avg_vorticity = Mvor.time_avg_vorticity;
%}

MaxPower = zeros(size(time_avg_vorticity));
MaxFreq = zeros(size(time_avg_vorticity));
PowerDist = zeros(size(Mvor.vorticity,1)/2,size(Mvor.vorticity,2),size(Mvor.vorticity,3));

for i = 1:size(time_avg_vorticity,1); % rows
    for ii = 1:size(time_avg_vorticity,2); % cols
        tempTimeVort = squeeze(Mvor.vorticity(:,i,ii));
        [f, pxx] = frequencyPowerDistribution(tempTimeVort, Fs);
        MaxPower(i,ii) = max(pxx);
        [~, MaxFreqIdx] = max(pxx);
        MaxFreq(i,ii) = f(MaxFreqIdx);
        PowerDist(:,i,ii) = pxx;
    end
end


