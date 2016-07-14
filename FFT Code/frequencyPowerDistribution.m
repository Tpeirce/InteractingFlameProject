function [ f, pxx ] = frequencyPowerDistribution( x, Fs)
%frequencyPowerDistribution Outputs power as a function of frequency
%   Given input vector x and sampling frequency Fs, returns f: frequency
%   vector, and pxx: power distribution

npts = length(x);

t = 0:1/Fs:(npts-1)/Fs; % time vector

x_norm = x - mean(x);
Y = fft(x_norm);
yMag = abs(Y/npts);
yHalf = yMag(2:npts/2+1);
yDouble = yHalf .*2;

f_ext = Fs*(0:(npts/2))/npts;

f = f_ext(2:end);
pxx = yDouble;

%plot(t,x); figure; plot(f,pxx)

end