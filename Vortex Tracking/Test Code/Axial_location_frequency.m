%clear all
close all
clc

addpath('C:\Users\Tristan\Desktop\Research Data\150319');

%Mvor = load('150402f_vorticity.mat');
%Mvec = load('150402f_Vectors.mat');

range = 1:8000;
axPos = 45;
axPos2 = 32;

s = squeeze(Mvor.vorticity(range,axPos,:));

%b = squeeze(vy(range,axPos,:));
%vyt = squeeze(mean(Mvec.vy,1));
%vxt = squeeze(mean(Mvec.vx,1));
%{
figure;
hold on
contourf(vyt)
ds = 1:5:128;
quiver(ds,ds,vxt(ds,ds),vyt(ds,ds));
plot(get(gca,'xlim'),[axPos axPos],'k');
plot(get(gca,'xlim'),[axPos2 axPos2],'k');
hold off;
%}

npts = 4097;
freq1 = zeros(128,npts);
freq2 = zeros(128,npts); % should really replace this with range/2 to the next power of 2 +1
pxx1 = zeros(128,npts);
pxx2 = zeros(128,npts);
maxFreq1 = zeros(128,2);
maxFreq2 = zeros(128,2);


for i = 1:128
    % gather vorticity data for lateral pos i
    pos1 = squeeze(Mvor.vorticity(:,axPos,i));
    pos2 = squeeze(Mvor.vorticity(:,axPos2,i));
    % FFT/PSE stuff
    [pxx1(i,:), freq1(i,:)] = periodogram(pos1,[],[],4000);
    [pxx2(i,:), freq2(i,:)] = periodogram(pos2,[],[],4000);
    % finding maxima
    [maxFreq1(i,1), maxFreq1(i,2)] = max(pxx1(i,:));
    [maxFreq2(i,1), maxFreq2(i,2)] = max(pxx2(i,:));
    % converting from max idx to frequency of peak power
    maxFreq1(i,2) = freq1(i,maxFreq1(i,2));
    maxFreq2(i,2) = freq2(i,maxFreq2(i,2));
end

% peak power for axPos
figure;plot(1:128,maxFreq1(:,1))
% peak freq at which this power occurs at axPos
figure;plot(1:128,maxFreq1(:,2))

% peak power for axPos2
figure;plot(1:128,maxFreq2(:,1))
% peak freq at which this power occurs at axPos2
figure;plot(1:128,maxFreq2(:,2))

normPeakPower = maxFreq1(:,1)/max(maxFreq1(:,1));
vytAxPos = vyt(axPos,:);
normAxVel = vytAxPos./max(vytAxPos);

figure;
plot(normPeakPower); hold on;
plot(normAxVel);