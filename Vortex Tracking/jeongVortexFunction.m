function [ binVort ] = jeongVortexFunction( x, y, vx, vy )
% vortex identification, per Jeong's 1994 paper

binVort = false(size(vx));


for frame = 1:length(vx);

    u = flipud(squeeze(vx(frame,:,:))); % input of lateral velocity
    v = flipud(squeeze(vy(frame,:,:))); % input of axial velocity
    x_m = mean(diff(x)) .* 1e-3; % mm to m, not using x_norm
    y_m = mean(diff(y)) .* 1e-3; % mm to m, gets standard scalar for spacing in m

    u(abs(u)>6e2) = 0; % if it's more than 600 m/s it's bogus
    v(abs(v)>6e2) = 0; % if it's more than 600 m/s it's bogus
    % shouldn't be going more than ~2x speed of sound
    
    [dudx, dudy] = gradient(u,x_m,y_m); % computing gradients, adjusted by actual distances x and y
    [dvdx, dvdy] = gradient(v,x_m,y_m);

    for i = 1:size(u,1)
        for ii = 1:size(u,2)
        
            del_u = [dudx(i,ii), dvdx(i,ii); dudy(i,ii), dvdy(i,ii)]; % taking tensor del_u at point (i,ii)

            S = 1/2 * (del_u + del_u.'); % symmetric part of tensor del_u
            Omega = 1/2 * (del_u - del_u.'); % antisymmetric part of tensor del_u

            check_matrix = S^2 + Omega^2;

            lambda = eig(check_matrix);

            lambda = sortrows(lambda); % sorting eigenvalues

            if lambda(2)<0
                binVort(frame,i,ii) = true;
            else
                binVort(frame,i,ii) = false;
            end
        end
    end
    
    frame
    
    
end

end

