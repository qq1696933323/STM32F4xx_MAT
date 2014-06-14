function getseries_callback(hDlg, hSrc, paramName)
%Callback to get tagret automatically from registry.
%Also set default parameters for device
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'STM32F40_41xxx')) 
        slConfigUISetVal(hDlg, hSrc, 'stm32Device', 'STM32F407VG');
    end
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'STM32F427_437xx')) 
        slConfigUISetVal(hDlg, hSrc, 'stm32Device', 'STM32F427VG');
    end
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'STM32F429_439xx')) 
        slConfigUISetVal(hDlg, hSrc, 'stm32Device', 'STM32F429VG');
    end
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'STM32F401xx')) 
        slConfigUISetVal(hDlg, hSrc, 'stm32Device', 'STM32F401CB');
    end
end
