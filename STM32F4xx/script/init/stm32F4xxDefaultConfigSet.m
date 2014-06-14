function stm32F4xxDefaultConfigSet(hDlg, hSrc)

% STM32F4XXDEFAULTCONFIGSET sets the target's 
% default configuration after applying the stm32F4xx.tlc
% 
% $ stm32F4xxDefaultConfigSet.m 2009-05-14 dlange $


%% Set default RTW parameters for stm32F4xx target:
  HardwareImplementationTab(hDlg, hSrc);
  GeneralTab(hDlg, hSrc);
  ReportTab(hDlg, hSrc);
  TemplatesTab(hDlg, hSrc);
%%RPMODIF continuous time not supported  InterfaceTab(hDlg, hSrc);
%% Set COMPort for PIL Test --> RPModif : To replace with listBox
  %%updatePrefs('set','COMPort','COM1');
%%RPMODIF   slConfigUISetVal(hDlg, hSrc,'CustomHeaderCode','stm32f4xx.h') 

 

%% HardwareImplementation tab **********************************************************
function HardwareImplementationTab(hDlg, hSrc)
  slConfigUISetVal(hDlg, hSrc,     'ProdHWDeviceType','STMicroelectronics->STM32F4xx 32-bit Cortex-M4')
  slConfigUISetEnabled(hDlg, hSrc, 'ProdHWDeviceType', true); 

  
%% General tab *************************************************************
function GeneralTab(hDlg, hSrc)
  slConfigUISetVal(hDlg, hSrc,     'GenerateMakefile','on')
  slConfigUISetEnabled(hDlg, hSrc, 'GenerateMakefile', false); 
  
  slConfigUISetVal(hDlg, hSrc,     'MakeCommand','make_rtw')
  slConfigUISetEnabled(hDlg, hSrc, 'MakeCommand', false);     
  
  slConfigUISetVal(hDlg, hSrc,     'TemplateMakefile','stm32F4xx.tmf')
  slConfigUISetEnabled(hDlg, hSrc, 'TemplateMakefile', true);
    
%% Report tab **************************************************************
function ReportTab(hDlg, hSrc)
  slConfigUISetVal(hDlg, hSrc,     'GenerateReport','on')
  slConfigUISetEnabled(hDlg, hSrc, 'GenerateReport', true);
  
  slConfigUISetVal(hDlg, hSrc,     'LaunchReport','on')
  slConfigUISetEnabled(hDlg, hSrc, 'LaunchReport', true);   
 
%% Interface tab ***********************************************************
function InterfaceTab(hDlg, hSrc)
  slConfigUISetVal(hDlg, hSrc,     'SupportContinuousTime','on')
  slConfigUISetEnabled(hDlg, hSrc, 'SupportContinuousTime', true);    

% Templates tab ***********************************************************
function TemplatesTab(hDlg, hSrc)
  slConfigUISetVal(hDlg, hSrc,     'ERTCustomFileTemplate','customRoutineProcess.tlc')
  slConfigUISetEnabled(hDlg, hSrc, 'ERTCustomFileTemplate', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'ERTSrcFileBannerTemplate','sourceFileTemplate.cgt')
  slConfigUISetEnabled(hDlg, hSrc, 'ERTSrcFileBannerTemplate', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'ERTHdrFileBannerTemplate','sourceFileTemplate.cgt')
  slConfigUISetEnabled(hDlg, hSrc, 'ERTHdrFileBannerTemplate', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'ERTDataSrcFileTemplate','sourceFileTemplate.cgt')
  slConfigUISetEnabled(hDlg, hSrc, 'ERTDataSrcFileTemplate', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'ERTDataHdrFileTemplate','sourceFileTemplate.cgt')
  slConfigUISetEnabled(hDlg, hSrc, 'ERTDataHdrFileTemplate', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'GenerateSampleERTMain','off')
  slConfigUISetEnabled(hDlg, hSrc, 'GenerateSampleERTMain', true);  
  
  slConfigUISetVal(hDlg, hSrc,     'IncludeMdlTerminateFcn','off')
  slConfigUISetEnabled(hDlg, hSrc, 'IncludeMdlTerminateFcn', true);  
 
  
% [EOF] stm32F4xxDefaultConfigSet.m

