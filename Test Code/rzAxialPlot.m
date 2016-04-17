% m = matfile('v7.3_150321g_Data.mat')
% Uy = m.Uy;
% don't be stupid and clear vars
zAx = linspace(min(Uy(:)),max(Uy(:)),20);

%yAx = [min(Uy(:,50,:)',3), max(Uy(:,50,:)',3)];


i=1;
while(i<4001)
    %temp=mean(Uy(:,:,i:i+1),3)'; % ' transposes so it conforms
    %contourf(temp, zAx);
    %colorbar;
    %i=i+100;
    plot(Uy(:,50,i)');
    ylim([-2,12]);
    i=i+1;
    drawnow
end