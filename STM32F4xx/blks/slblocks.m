function blkStruct = slblocks
% SLBLOCKS adds the STM32 library to the Library Browser
% 
% $ slblocks.m 2009-05-14 dlange $
%

blkStruct.Name = sprintf('STM32F4XX LIBRARY');
blkStruct.OpenFcn = 'STM32F4xx_Library';
blkStruct.MaskInitialization = '';
blkStruct.MaskDisplay = 'disp(''STM32F4XX LIBRARY'')';

% Information for Simulink Library Browser
Browser(1).Library = 'STM32F4xx_Library';
Browser(1).Name    = 'Target Support Package - STM32F4xx Adapter';
Browser(1).IsFlat  = 0;% Is this library "flat" (i.e. no subsystems)?
blkStruct.Browser = Browser;

% Define information for model updater
blkStruct.ModelUpdaterMethods.fhSeparatedChecks = @ecblksUpdateModel;
 
% [EOF]: slblocks.m
