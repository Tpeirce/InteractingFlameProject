function [ left_Coords, right_Coords ] = displacementThicknessFn( x_norm, vy_field, d, NominalBluffBodySpacing )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [~, zeroVector] = min(abs(x_norm));
    h = NominalBluffBodySpacing/2/(d * 25.4); % mid-stream position
    
    left_Coords = zeros(size(vy_field,1),1);
    right_Coords = zeros(size(vy_field,1),1);
    
    [~, leftVector] = min(abs(x_norm + h)); % mid-stream vector
    [~, rightVector] = min(abs(x_norm - h)); % mid-stream vector
    
    
    for i = 1:size(vy_field,1);
        u_b = vy_field(i,leftVector);
        spacing = mean(diff(x_norm));
        delta = trapz(1-vy_field(i,leftVector:zeroVector)./u_b) * spacing; % nondimensionalized displacement thickness
        left_Coords(i) = -delta;
    end
    
    for i = 1:size(vy_field,1);
        u_b = vy_field(i,rightVector);
        spacing = mean(diff(x_norm));
        delta = trapz(1-vy_field(i,zeroVector:rightVector)./u_b) * spacing; % nondimensionalized displacement thickness
        right_Coords(i) = delta;
    end
    
end

