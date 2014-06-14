function sl_customization(cm)
% sl_customization for PIL connectivity config: STM32F4xx.ConnectivityConfig

% Copyright 2008 The MathWorks, Inc.
% $Revision: 1.1.6.2 $

cm.registerTargetInfo(@loc_register_device);
cm.registerTargetInfo(@loc_createConfig);

end

% local function
function config = loc_createConfig

config = rtw.connectivity.ConfigRegistry;
config.ConfigName = 'STM32F4xx PIL';
config.ConfigClass = 'stm32F4xxpil.ConnectivityConfig';

% match only STM32 dedicated tlc
config.SystemTargetFile = {'stm32F4xx.tlc'};
% match the STM32 TMF's
config.TemplateMakefile = {'stm32F4xx.tmf'};
% match STM32F4xx  32-bit Cortex-M4
config.TargetHWDeviceType = {'STMicroelectronics->STM32F4xx 32-bit Cortex-M4'};
end

function thisDev = loc_register_device
  thisDev = RTW.HWDeviceRegistry;
  thisDev.Vendor = 'STMicroelectronics';
  thisDev.Type = 'STM32F4xx 32-bit Cortex-M4';
  thisDev.Alias = {};
  thisDev.Platform = {'Prod', 'Target'};
  thisDev.setWordSizes([8 16 32 32 32]);
  thisDev.LargestAtomicInteger = 'Int';
  thisDev.LargestAtomicFloat = 'Float';
  thisDev.Endianess = 'Little';
  thisDev.IntDivRoundTo = 'Zero';
  thisDev.ShiftRightIntArith = true;
  thisDev.setEnabled({'LargestAtomicInteger','LargestAtomicFloat'});
end
