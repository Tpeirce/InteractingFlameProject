
X = zeros(4000,128,128);

f = Fs*(0:(L/2))/L;

for i = 40:128
    for ii = 1:128
        S = squeeze(vorticity(:,i,ii));
        Y = fft(S);
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        plot(f(2:end),P1(2:end))
        title('Single-Sided Amplitude Spectrum of vorticity(t)')
        xlabel('f (Hz)')
        ylabel('|P1(f)|')
        X(:,i,ii) = P1(2:end);
        drawnow
        i
        ii
    end
end