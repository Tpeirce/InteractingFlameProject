close all
clc
%clear all
%load('150402f_vorticity.mat');
%load('150402f_Vectors.mat', 'vy');
addpath('C:\Users\Tristan\Desktop\Research Data\150319');

range = 1:8000;
axPos = 45;

s = squeeze(vorticity(range,axPos,:));
%b = squeeze(vy(1:300,axPos,:));

hold on
surf(s)
shading flat
%contour(b, [0 0], 'w')
xlabel('Lateral position')
ylabel('Time (frames)')
zlabel('Vorticity')
%{
figure
imagesc(squeeze(vy(1,:,:)))
set(gca,'YDir','normal')
hold on
plot(get(gca,'xlim'),[40 40],'k')
hold off
%}
%% Note: 45 was a lateral position I picked manually

x = squeeze(s(:,45,:));
x_mean = mean(x);

Y = fft(x-x_mean);

Fs = 4000;            % Sampling frequency, 4 kHz
T = 1/Fs;             % Sampling period
L = 8000;             % Length of signal, 8k frames
t = (0:L-1)*T;        % Time vector

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure
u_b = 3.277708759;
D = .75*.0254;
f = Fs*(0:(L/2))/L;
St = f .*D ./ u_b;

plot(St(2:end),P1(2:end))
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')



a = periodogram(x);
figure;
plot(a(2:end))

%{
n = length(Y);
power = abs(Y(1:floor(n/2))).^2; % finding power to raise 2 to
nyquist = 4000;
freq = (1:n/2)/(n/2)*nyquist;
plot(freq,power)

figure;
Pyy = Y.*conj(Y)/length(Y);
len=(1:round((length(Y))/2));
f = 4000/length(Y)*len;
plot(f(len),Pyy(len))
%}