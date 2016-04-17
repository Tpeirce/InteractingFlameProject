wz = m.wz;
wz_avg = mean(wz,3)';
zAx = linspace(min(wz_avg(:)),max(wz_avg(:)),40);
contourf(wz_avg, zAx)