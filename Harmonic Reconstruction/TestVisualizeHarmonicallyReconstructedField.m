% test reconstructed fields

figure;contourf(flipud(squeeze(reconstructed_vy(500,:,:))))
title('reconstructed vy')
figure; contourf(flipud(squeeze(vy(500,:,:))))
title('vy')
figure;plot(squeeze(vy(500,110,:))); hold on;
plot(squeeze(reconstructed_vy(500,110,:)))