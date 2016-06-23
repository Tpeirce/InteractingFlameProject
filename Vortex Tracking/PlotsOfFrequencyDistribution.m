clear
close all
clc
tic
fontsize = 13;
workingDir = ['F:\20160520' '\'];
addpath(genpath([workingDir]));

addpath('C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\PSU Code');


cases = { ...
    '160529e' ... % 0mm unforced
    '160529c' ... % 0 low
    '160529d' ... % 0 high
    '160520c' ... % 32mm unforced
    '160529a' ... % 32 low
    '160529b' ... % 32 high
    '160520d' ... % 37mm unforced
    '160527a' ... % 37 low
    '160527b' ... % 37 high
    '160520e' ... % 42mm unforced
    '160527c' ... % 42 low
    '160527d' ... % 42 high
    '160520f' ... % 47mm unforced
    '160527e' ... % 47 low
    '160527f' ... % 47 high
    '160520g' ... % 52mm unforced
    '160527g' ... % 52 low
    '160527h' ... % 52 high
    '160520h' ... % 57mm unforced
    '160527i' ... % 57 low
    '160527j' ... % 57 high
    '160520i' ... % 62mm unforced
    '160527k' ... % 62 low
    '160527l' ... % 62 high
    };

%% 0 mm

spacings = {'0','32','37','42','47','52','57','62'};
caseI = 1; % case name index

for i = 1:length(spacings);

% unforced
vorticityFrequencyFunction(cases{caseI}); caseI = caseI + 1;
title([spacings{i} 'mm , Unforced']);
fileName = ['C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Figures\VorticityFrequency\' spacings{i}...
    'mmUnforced'];
savefig(gcf,fileName,'compact');
print(fileName,'-dpng');

% low forcing
vortexFrequencyFunction(cases{caseI}); caseI = caseI + 1;
title([spacings{i} 'mm , Low Amplitude Forcing']);
fileName = ['C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Figures\VorticityFrequency\' spacings{i}...
    'mmLowForced'];
savefig(gcf,fileName,'compact');
print(fileName,'-dpng');

% high forcing
vortexFrequencyFunction(cases{caseI}); caseI = caseI + 1;
title([spacings{i} 'mm , High Amplitude Forcing']);
fileName = ['C:\Users\Tristan\Dropbox\Documents\School\Trinity\Venkateswaran Research\MATLAB Code\Figures\VorticityFrequency\' spacings{i}...
    'mmHighForced'];
savefig(gcf,fileName,'compact');
print(fileName,'-dpng');

end
toc