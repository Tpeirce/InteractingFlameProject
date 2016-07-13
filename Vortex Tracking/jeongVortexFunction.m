function [ binVort ] = jeongVortexFunction( x, y, vx, vy )
% vortex identification, per Jeong's 1994 paper

binVort = false(size(vx));

lenY = size(vx,2);
lenX = size(vx,3);

parpool(4)
parfor frame = 1:length(vx);

    u = flipud(squeeze(vx(frame,:,:))); % input of lateral velocity
    v = flipud(squeeze(vy(frame,:,:))); % input of axial velocity
    x_m = mean(diff(x)) .* 1e-3; % mm to m, not using x_norm
    y_m = mean(diff(y)) .* 1e-3; % mm to m, gets standard scalar for spacing in m

    u(abs(u)>6e2) = 0; % if vx is more than 600 m/s it's bogus
    v(abs(v)>6e2) = 0; % if vy is more than 600 m/s it's bogus
    % shouldn't be going more than ~2x speed of sound
    
    [dudx, dudy] = gradient(u,x_m,y_m); % computing gradients, adjusted by actual distances x and y
    [dvdx, dvdy] = gradient(v,x_m,y_m);

    for i = 1:lenY
        for ii = 1:lenX
        
            del_u = [dudx(i,ii), dvdx(i,ii); dudy(i,ii), dvdy(i,ii)]; % taking tensor del_u at point (i,ii)

            S = 1/2 * (del_u + del_u.'); % symmetric part of tensor del_u
            Omega = 1/2 * (del_u - del_u.'); % antisymmetric part of tensor del_u

            check_matrix = S^2 + Omega^2;

            lambda = eig(check_matrix); % getting lambda values

            lambda = sortrows(lambda); % sorting eigenvalues
            
            if length(lambda)>1
                binVort(frame,i,ii) = lambda(2)<0; % sets logical based on lambda 2 criterion
            else
                binVort(frame,i,ii) = false;
            end
            
        end
    end
    
    frame
    
    
end

end

