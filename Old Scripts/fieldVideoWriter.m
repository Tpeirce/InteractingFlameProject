function [] = fieldVideoWriter(vframes,name)
% frames is frames to write, name is name of video output

vfolder = 'F:\Research Data\Videos\';
v = VideoWriter(strcat(vfolder,name,'-videoOutput'));
v.FrameRate = 30;
open(v)
writeVideo(v,vframes);
close(v)

end