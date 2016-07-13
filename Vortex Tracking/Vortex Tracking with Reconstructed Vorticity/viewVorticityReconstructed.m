field = reconstructed_vorticity;
%field1 = vorticity;

range = 1:500; % frame range
yRange = 1:128; % restrict y view
levels = 10; % contour levels

rangeFind = field(range,yRange,:);
minC = min(rangeFind(:));
maxC = max(rangeFind(:));
%minC = -4000;
%maxC = 4000;
cRange = linspace(minC,maxC,levels);

for frame = range    
    %contourf(x_norm,y_norm(yRange),flipud(squeeze(field(frame,yRange,:))),cRange)
    axis equal
    
    preFilter = squeeze(field(frame,yRange,:));
    toFilter = imresize(preFilter,8);
    binField = preFilter < -50 | preFilter > 50;
        
    [xmax, imax, xmin, imin] = extrema2(preFilter);
    xAbs = [xmax; xmin];
    iAbs = [imax; imin];
    [iY, iX] = ind2sub(size(time_averaged_vorticity),iAbs);
    imagesc(binField)
    set(gca,'ydir','normal')
    hold on
    plot(iX,iY,'rx')
    hold off
    drawnow;
    
    
    set(gca,'ydir','normal')
    
    %{
    filtered(size(toFilter)) = 1; 
    filtered(toFilter<-50) = 0;
    filtered(toFilter>50) = .5;
   %}
    
    
    %colorbar
    
    %{
    norm0 = max(abs(field1(frame,20,:)));
    norm1 = max(abs(field(frame,20,:)));
    
    plot(squeeze(field1(frame,20,:))/norm0);hold on;
    plot(squeeze(field(frame,20,:))/norm1);hold off;
    legend('vorticity','reconstructed vorticity');
    %}
    pause(.5)
    drawnow;
end