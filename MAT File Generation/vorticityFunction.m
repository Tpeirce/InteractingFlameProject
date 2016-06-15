function [ vorticity ] = vorticityFunction( x, y, vx, vy )
%vorticityFunction
%   Feed in velocity vectors, get out vorticity

    % curl requires a meshgrid as input
    [mx,my]=meshgrid(x,y);
    
    % x and y are in mm and vx and vy are in m/s, so need to scale appropriately
    timescale = 1e3;
    
    % preallocating
    vorticity = zeros(size(vx,1),size(vx,2),size(vx,3)); % assuming vx and vy have same dims
    for i = 1:size(vorticity,1) % time axis
        vorticity(i,:,:) = 2*curl(mx,my,squeeze(vx(i,:,:)),squeeze(vy(i,:,:))).*timescale; % curl w/one arg outputs angular velocity, which is 1/2 vorticity
    end
end