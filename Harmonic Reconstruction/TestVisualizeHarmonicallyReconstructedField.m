% test reconstructed fields

figure;contourf(squeeze(reconstructed_vy(500,:,:)))
title('reconstructed vy')
figure; contourf(squeeze(vy(500,:,:)))
title('vy')
figure;plot(squeeze(vy(500,110,:))); hold on;
plot(squeeze(reconstructed_vy(500,110,:)))