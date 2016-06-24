cd('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160520f\160520f_DAT');
load('160520fTimeAverageVectors-2.mat');
load('160520f_Conditions-2.mat');

vy_mean = flipud(vy_mean);
vx_mean = flipud(vx_mean);

imagesc(x_norm,y_norm,vy_mean);
set(gca,'Ydir','normal');

[~, zeroVector] = min(abs(x_norm));
h = NominalBluffBodySpacing/2/(d * 25.4); % mid-stream position
[~, midVector] = min(abs(x_norm - h)); % mid-stream vector

for i = 100;
    u_b = vy_mean(i,midVector);
    spacing = mean(diff(x_norm));
    delta = trapz(1-vy_mean(i,zeroVector:midVector)./u_b) * spacing; % nondimensionalized displacement thickness
end