function [ reconstructed_field ] = HarmonicReconstructionFn( omega, field, framerate )
% function for harmonic reconstruction of a vector field at a specific
% frequency

%preallocate
reconstructed_field = zeros(size(field));

t = (1:size(field,1))' / framerate;

npts = size(field,1);
f = Fs*(0:(npts/2))/npts;
[~, omegaVec] = min(diff(f-imega));


% sweep through all 128x128 vectors
for yPos = 1:size(field,2)
    for xPos = 1:size(field,3)
        % take fft of 5000 points
        tempFFT = fft(field(:,yPos,xPos));

        % magnitude of FFT - becomes A
        tempA = abs(tempFFT);
        tempA = tempA(omegaVec);
        % phase shift - becomes phi
        tempPhi = atan2(imag(tempFFT),real(tempFFT));
        tempPhi = tempPhi(omegaVec);
        % might be able to optimize this w/ matrix operations
        % just a reimplementation of formula from paper
        reconstructed_field(:,yPos,xPos) = real(tempA .* exp(-1i .* (omega .*t + tempPhi) ) );
    end
end


end