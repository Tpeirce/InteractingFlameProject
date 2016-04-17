% cd C:\Users\Tristan\Desktop\Research Data\InteractingFlameProject\Data\150321g\NonLinear_SubSlidingMin\TR_PIV_MP(2x16x16_50%ov)\PostProc\VenkatAnalysis
% m = matfile('v7.3_150321g_Data.mat')
% Uy = m.Uy;
% don't be stupid and clear vars
zAx = linspace(min(Uy(:)),max(Uy(:)),20);

i=1;
while(i<4001)
    temp=mean(Uy(:,:,i:i+100),3)'; % ' transposes so it conforms
    contourf(temp, zAx);
    colorbar;
    i=i+100;
    drawnow
end