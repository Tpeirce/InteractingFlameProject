% vortex identification, per Jeong's 1994 paper

% test-against: loading

addpath('C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b');
load('160527b_Vectors-2.mat');

% preliminary setup work
tld = pwd;
cd 'C:\Users\Tristan\Desktop\Research Data\160520_Flame_Interaction\160527b\SubOverTimeMin_sL=5_01'
figure;

for frame = 1:length(vx);

u = flipud(squeeze(vx(frame,:,:))); % input of lateral velocity
v = flipud(squeeze(vy(frame,:,:))); % input of axial velocity
x_m = x .* 1e-3; % mm to m, not using x_norm
y_m = y .* 1e-3; % mm to m

[dudx, dudy] = gradient(u,x_m,y_m); % computing gradients, adjusted by actual distances x and y
[dvdx, dvdy] = gradient(v,x_m,y_m);

binVort = false(size(u));

for i = 1:size(u,1)
    for ii = 1:size(u,2)
        
        del_u = [dudx(i,ii), dvdx(i,ii); dudy(i,ii), dvdy(i,ii)]; % taking tensor del_u at point 1 for an example

        S = 1/2 * (del_u + del_u.'); % symmetric part of tensor del_u
        Omega = 1/2 * (del_u - del_u.'); % antisymmetric part of tensor del_u

        check_matrix = S^2 + Omega^2;

        lambda = eig(check_matrix);

        lambda = sortrows(lambda); % sorting eigenvalues

        if lambda(2)<0
            binVort(i,ii) = true;
        else
            binVort(i,ii) = false;
        end
    end
end

binary_image = imresize(binVort,8);
binary_image_filtered = bwareafilt(binary_image,[128 1e5]);


F = loadvec(frame);
seeded_image = flipud(uint8(F.w'));
merged_image = imfuse(binary_image_filtered,seeded_image,'blend');
imshow(merged_image)

drawnow;

end