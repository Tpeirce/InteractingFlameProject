clearvars -except vy vx x y
close all
clc
%load('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\160527b_DAT\160527b_Vectors-2.mat');

%preallocate

field = vy;
omega = 400; % Hz

reconstructed_field = zeros(size(field));

t = (1:5000)' / 4000;


for yPos = 1:size(field,2)
    for xPos = 1:size(field,3)
        tempFFT = fft(field(:,yPos,xPos));
        tempA = abs(tempFFT);
        tempPhi = atan2(imag(tempFFT),real(tempFFT));
        % might be able to optimize this w/ matrix operations
        reconstructed_field(:,yPos,xPos) = real(tempA .* field(:,yPos,xPos) .* exp(-1i .* omega .*t + tempPhi .* field(:,yPos,xPos) ) );
    end
end

