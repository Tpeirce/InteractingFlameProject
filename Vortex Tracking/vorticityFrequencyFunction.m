function [ ] = vortexFrequencyFunction( caseName )


% loading
Fs = 4e3; % sampling frequency, 4 kHz
Mvec = load([caseName 'TimeAverageVectors-2.mat']);
Mvor = load([caseName '_Vectors-2.mat']);
Mvor.vorticity = vorticityFunction(Mvor.x,Mvor.y,Mvor.vx,Mvor.vy);
Mvor.time_avg_vorticity = squeeze(mean(Mvor.vorticity,1));
Mvor.x_norm = Mvec.x_norm;
Mvor.y_norm = Mvec.y_norm;
Mvor = rmfield(Mvor,{'vx','vy'});
time_avg_vorticity = Mvor.time_avg_vorticity;


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

mean_psd = mean(mean(PowerDist,3),2);
figure;
histogram(MaxFreq(:))
xlabel('Frequency');
ylabel('Power (vorticity)');
end

