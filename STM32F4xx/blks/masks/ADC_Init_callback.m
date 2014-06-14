function ADC_Init_callback(action)
% Callback to set ADC_Init parameters

% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end


switch action
        
    case 'ADC_Name'
        ADCName = get_param(gcbh,'ADC_Name');
        initChannelName(ADCName);     
        showChannel(ADCName); 
        
    case 'ADC_Type'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
       % Channel type selection: Regular or Injected 
        ADCType = get_param(gcbh,'ADC_Type');
        cmdWd = get_param(gcbh,'ADC_Watchdog_Command');
        switch ADCType
            case 'Regular'
                mask_visibilities{ADC_Offset_idx} = 'off';
                mask_visibilities{ADC_ExtTrigPol_idx} = 'on';
                mask_visibilities{ADC_ExtTrigInjPol_idx} = 'off';
                mask_visibilities{ADC_ExtTrig_idx} = 'on';
                mask_visibilities{ADC_ExtTrigInj_idx} = 'off';
                if isequal(get_param(gcbh,'ADC_Watchdog_Enable'),'on')
                    if isequal(cmdWd,'ADC_AnalogWatchdog_SingleInjecEnable')||isequal(cmdWd,'ADC_AnalogWatchdog_AllInjecEnable')
                        set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
                    end
               end
            case 'Injected'
                mask_visibilities{ADC_Offset_idx} = 'on';
                mask_visibilities{ADC_ExtTrigPol_idx} = 'off';
                mask_visibilities{ADC_ExtTrigInjPol_idx} = 'on';
                mask_visibilities{ADC_ExtTrig_idx} = 'off';
                mask_visibilities{ADC_ExtTrigInj_idx} = 'on';
                if isequal(get_param(gcbh,'ADC_Watchdog_Enable'),'on')
                    if isequal(cmdWd,'ADC_AnalogWatchdog_AllRegEnable')
                        set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
                    end
               end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
        
    case 'init_setting'
        % Set to Default initial values
        if isequal(get_param(gcbh,'ADC_Default'),'on') 
            resetChannel(get_param(gcbh,'ADC_Name'));     
            resetParameters(get_param(gcbh,'ADC_Type'));
            %Reset default value request
            set_param(gcbh,'ADC_Default','off');
        end
       
    case 'offset'
        %Offset for injected channels. 
        %min, max, default value and message name for error.
        if (valueTest('ADC_Offset',0,4095))
           set_param(gcbh,'ADC_Offset','0');
           errordlg('Offset value must be from 0 to 4095');
        end
      
    %Parameters below are not channel dependent. Global for ADC.   
    case 'wd_enable'
        %Watchdog parameters can be modified or not
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'ADC_Watchdog_Enable'),'off')
            %No watchdog for this ADC.
     		mask_enable{ADC_Watchdog_Command_idx} = 'off';
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'off';
			mask_enable{ADC_Watchdog_HighThreshold_idx} = 'off';
			mask_enable{ADC_Watchdog_lowThreshold_idx} = 'off';
            set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
            set_param(gcbh,'ADC_Watchdog_NumChan','0'); 
        else
            %Watchdog available for this ADC.
     		mask_enable{ADC_Watchdog_Command_idx} = 'on';
			mask_enable{ADC_Watchdog_HighThreshold_idx} = 'on';
			mask_enable{ADC_Watchdog_lowThreshold_idx} = 'on';
            %12bits max for threshold values. set max to possible max value
            if (uint16(str2double(get_param(gcbh,'ADC_Watchdog_HighThreshold')))== 0)
                set_param(gcbh,'ADC_Watchdog_HighThreshold','4095');
            end
        end
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          

    case 'wd_command'
        % What channel are watchdog guarded. Verify possibilities.
        mask_enable = get_param(gcbh,'MaskEnables');
        cmdWd = get_param(gcbh,'ADC_Watchdog_Command');
        ADCType = get_param(gcbh,'ADC_Type');
        if isequal(cmdWd,'ADC_AnalogWatchdog_SingleInjecEnable')
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'on';            
            %Only channels declared as injected and watchdog guarded
            if isequal(ADCType,'Regular')
               set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
               errordlg('No injected channel, ADC is regular');
            end
        elseif isequal(cmdWd,'ADC_AnalogWatchdog_SingleRegOrInjecEnable')
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'on';            
        elseif isequal(cmdWd,'ADC_AnalogWatchdog_AllRegEnable')
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'off';            
            %All regular channel only
            if isequal(ADCType,'Injected')
               set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
               errordlg('No regular channel configured');
            end            
        elseif isequal(cmdWd,'ADC_AnalogWatchdog_AllInjecEnable')
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'off';            
            %All injected channels only
            if isequal(ADCType,'Regular')
               set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
               errordlg('No injected channel configured');
            end
        elseif isequal(cmdWd,'ADC_AnalogWatchdog_AllRegAllInjecEnable')
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'off';            
        else
     		mask_enable{ADC_Watchdog_NumChan_idx} = 'off';                       
        end   
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        clear cmdWd ADCType
   
    case 'wd_highThreshold'
        %max threshold value. 
        %min, max, default value and message name for error.
        if (valueTest('ADC_Watchdog_HighThreshold',0,4095))
           set_param(gcbh,'ADC_Watchdog_HighThreshold','4095');
           errordlg('High threshold value must be from 0 to 4095');
        end
                                    
    case 'wd_lowThreshold'
        %min threshold value. 
        %min, max, default value and message name for error.
        if (valueTest('ADC_Watchdog_lowThreshold',0,4095))
           set_param(gcbh,'ADC_Watchdog_lowThreshold','0');
           errordlg('Low threshold value must be from 0 to 4095');
        end
        
    case 'Ch0'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch0'),'on')
            mask_visibilities{ADC_Ch0L_idx} = 'on';
            mask_visibilities{ADC_Ch0T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch0L_idx} = 'off';
            mask_visibilities{ADC_Ch0T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch1'      
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch1'),'on')
            mask_visibilities{ADC_Ch1L_idx} = 'on';
            mask_visibilities{ADC_Ch1T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch1L_idx} = 'off';
            mask_visibilities{ADC_Ch1T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch2'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch2'),'on')
            mask_visibilities{ADC_Ch2L_idx} = 'on';
            mask_visibilities{ADC_Ch2T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch2L_idx} = 'off';
            mask_visibilities{ADC_Ch2T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch3'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch3'),'on')
            mask_visibilities{ADC_Ch3L_idx} = 'on';
            mask_visibilities{ADC_Ch3T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch3L_idx} = 'off';
            mask_visibilities{ADC_Ch3T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch4'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch4'),'on')
            mask_visibilities{ADC_Ch4L_idx} = 'on';
            mask_visibilities{ADC_Ch4T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch4L_idx} = 'off';
            mask_visibilities{ADC_Ch4T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch5'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch5'),'on')
            mask_visibilities{ADC_Ch5L_idx} = 'on';
            mask_visibilities{ADC_Ch5T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch5L_idx} = 'off';
            mask_visibilities{ADC_Ch5T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch6'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch6'),'on')
            mask_visibilities{ADC_Ch6L_idx} = 'on';
            mask_visibilities{ADC_Ch6T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch6L_idx} = 'off';
            mask_visibilities{ADC_Ch6T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch7'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch7'),'on')
            mask_visibilities{ADC_Ch7L_idx} = 'on';
            mask_visibilities{ADC_Ch7T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch7L_idx} = 'off';
            mask_visibilities{ADC_Ch7T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch8'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch8'),'on')
            mask_visibilities{ADC_Ch8L_idx} = 'on';
            mask_visibilities{ADC_Ch8T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch8L_idx} = 'off';
            mask_visibilities{ADC_Ch8T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch9'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch9'),'on')
            mask_visibilities{ADC_Ch9L_idx} = 'on';
            mask_visibilities{ADC_Ch9T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch9L_idx} = 'off';
            mask_visibilities{ADC_Ch9T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch10'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch10'),'on')
            mask_visibilities{ADC_Ch10L_idx} = 'on';
            mask_visibilities{ADC_Ch10T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch10L_idx} = 'off';
            mask_visibilities{ADC_Ch10T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch11'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch11'),'on')
            mask_visibilities{ADC_Ch11L_idx} = 'on';
            mask_visibilities{ADC_Ch11T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch11L_idx} = 'off';
            mask_visibilities{ADC_Ch11T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch12'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch12'),'on')
            mask_visibilities{ADC_Ch12L_idx} = 'on';
            mask_visibilities{ADC_Ch12T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch12L_idx} = 'off';
            mask_visibilities{ADC_Ch12T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch13'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch13'),'on')
            mask_visibilities{ADC_Ch13L_idx} = 'on';
            mask_visibilities{ADC_Ch13T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch13L_idx} = 'off';
            mask_visibilities{ADC_Ch13T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch14'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch14'),'on')
            mask_visibilities{ADC_Ch14L_idx} = 'on';
            mask_visibilities{ADC_Ch14T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch14L_idx} = 'off';
            mask_visibilities{ADC_Ch14T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'Ch15'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch15'),'on')
            mask_visibilities{ADC_Ch15L_idx} = 'on';
            mask_visibilities{ADC_Ch15T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch15L_idx} = 'off';
            mask_visibilities{ADC_Ch15T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities             

    case 'Ch16'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch16'),'on')
            mask_visibilities{ADC_Ch16L_idx} = 'on';
            mask_visibilities{ADC_Ch16T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch16L_idx} = 'off';
            mask_visibilities{ADC_Ch16T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities        

    case 'Ch17'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch17'),'on')
            mask_visibilities{ADC_Ch17L_idx} = 'on';
            mask_visibilities{ADC_Ch17T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch17L_idx} = 'off';
            mask_visibilities{ADC_Ch17T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities        

    case 'Ch18'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'ADC_Ch18'),'on')
            mask_visibilities{ADC_Ch18L_idx} = 'on';
            mask_visibilities{ADC_Ch18T_idx} = 'on';
        else
            mask_visibilities{ADC_Ch18L_idx} = 'off';
            mask_visibilities{ADC_Ch18T_idx} = 'off';
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities        

end
end


function showParameters(ADCType)

% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end
clear maskName

    %Update mask enable and visibility
    mask_enable = get_param(gcbh,'MaskEnables');
	mask_visibilities = get_param(gcbh,'MaskVisibilities');

    mask_enable{ADC_Type_idx} = 'on';
    mask_enable{ADC_Default_idx} = 'on';
    mask_enable{ADC_Offset_idx} = 'on';
    mask_enable{ADC_Resolution_idx} = 'on';
    mask_enable{ADC_ScanConvMode_idx} = 'on';
    mask_enable{ADC_ContinuousConvMode_idx} = 'on';
    mask_enable{ADC_ExtTrigPol_idx} = 'on';
    mask_enable{ADC_ExtTrigInjPol_idx} = 'on';
    mask_enable{ADC_ExtTrig_idx} = 'on';
    mask_enable{ADC_ExtTrigInj_idx} = 'on';
    mask_enable{ADC_DataAlign_idx} = 'on';
    mask_enable{ADC_NbConv_idx} = 'on';
    mask_enable{ADC_Watchdog_Enable_idx} = 'on';
    mask_enable{ADC_DMA_channel_idx} = 'on';
    mask_enable{ADC_DMA_stream_idx} = 'on';
    if isequal(get_param(gcbh,'ADC_Watchdog_Enable'),'on')
        mask_enable{ADC_Watchdog_Command_idx} = 'on';
        mask_enable{ADC_Watchdog_NumChan_idx} = 'on';
        mask_enable{ADC_Watchdog_HighThreshold_idx} = 'on';
        mask_enable{ADC_Watchdog_lowThreshold_idx} = 'on'; 
    else
        mask_enable{ADC_Watchdog_Command_idx} = 'off';
        mask_enable{ADC_Watchdog_NumChan_idx} = 'off';
        mask_enable{ADC_Watchdog_HighThreshold_idx} = 'off';
        mask_enable{ADC_Watchdog_lowThreshold_idx} = 'off'; 
    end    
    mask_visibilities{ADC_Type_idx} = 'on';
    mask_visibilities{ADC_Default_idx} = 'on';
    mask_visibilities{ADC_Resolution_idx} = 'on';
    mask_visibilities{ADC_ScanConvMode_idx} = 'on';
    mask_visibilities{ADC_ContinuousConvMode_idx} = 'on';
    mask_visibilities{ADC_DataAlign_idx} = 'on';
    mask_visibilities{ADC_NbConv_idx} = 'on';
    mask_visibilities{ADC_Watchdog_Enable_idx} = 'on';
    mask_visibilities{ADC_Watchdog_Command_idx} = 'on';
    mask_visibilities{ADC_Watchdog_NumChan_idx} = 'on';
    mask_visibilities{ADC_Watchdog_HighThreshold_idx} = 'on';
    mask_visibilities{ADC_Watchdog_lowThreshold_idx} = 'on';
    mask_visibilities{ADC_DMA_channel_idx} = 'on';
    mask_visibilities{ADC_DMA_stream_idx} = 'on';

    switch ADCType
        case 'Regular'
            mask_visibilities{ADC_Offset_idx} = 'off';
            mask_visibilities{ADC_ExtTrigPol_idx} = 'on';
            mask_visibilities{ADC_ExtTrigInjPol_idx} = 'off';
            mask_visibilities{ADC_ExtTrig_idx} = 'on';
            mask_visibilities{ADC_ExtTrigInj_idx} = 'off';
        case 'Injected'
            mask_visibilities{ADC_Offset_idx} = 'on';
            mask_visibilities{ADC_ExtTrigPol_idx} = 'off';
            mask_visibilities{ADC_ExtTrigInjPol_idx} = 'on';
            mask_visibilities{ADC_ExtTrig_idx} = 'off';
            mask_visibilities{ADC_ExtTrigInj_idx} = 'on';
    end
    
    %Set mask enable and visibility
    set_param(gcbh,'MaskEnables', mask_enable);
 	set_param(gcbh,'MaskVisibilities', mask_visibilities);  
    clear mask_enable mask_visibilities

end

function resetParameters(ADCType)

    set_param(gcbh,'ADC_Type',ADCType);
    set_param(gcbh,'ADC_Resolution','ADC_Resolution_12b');
    set_param(gcbh,'ADC_ScanConvMode','One_channel');
    set_param(gcbh,'ADC_ContinuousConvMode','on');
    set_param(gcbh,'ADC_DataAlign','ADC_DataAlign_Right');
    set_param(gcbh,'ADC_NbConv','1');
    set_param(gcbh,'ADC_Watchdog_Enable','off');
    set_param(gcbh,'ADC_Watchdog_Command','ADC_AnalogWatchdog_None');
    set_param(gcbh,'ADC_Watchdog_NumChan','0');
    set_param(gcbh,'ADC_Watchdog_HighThreshold','4095');
    set_param(gcbh,'ADC_Watchdog_lowThreshold','0');                      
    
    set_param(gcbh,'ADC_Offset','0');
    set_param(gcbh,'ADC_ExtTrigPol','ADC_ExternalTrigConvEdge_None');
    set_param(gcbh,'ADC_ExtTrigInjPol','ADC_ExternalTrigInjecConvEdge_None');
    set_param(gcbh,'ADC_ExtTrig','ADC_ExternalTrigConv_T1_CC1');
    set_param(gcbh,'ADC_ExtTrigInj','ADC_ExternalTrigInjecConv_T1_CC4');

    set_param(gcbh,'ADC_DMA_channel','not_used');
    set_param(gcbh,'ADC_DMA_stream','not_used');
    
    showParameters(ADCType);
end


function [result] = valueTest(param, min, max)
%easy to understand.
    value = str2double(get_param(gcbh,param));
    result = 0;
    if((isnan(value) || isempty(value)))
        result = 1; 
    end
    if (value <min)
        result = 1;
    end
    if (value > max)
        result = 1;
    end
    clear value
end

function initChannelName(ADCName)
    switch ADCName
        case 'ADC1'
            set_param(gcbh,'ADC_Ch0L','PA0');
            set_param(gcbh,'ADC_Ch1L','PA1');
            set_param(gcbh,'ADC_Ch2L','PA2');
            set_param(gcbh,'ADC_Ch3L','PA3');
            set_param(gcbh,'ADC_Ch4L','PA4');
            set_param(gcbh,'ADC_Ch5L','PA5');
            set_param(gcbh,'ADC_Ch6L','PA6');
            set_param(gcbh,'ADC_Ch7L','PA7');
            set_param(gcbh,'ADC_Ch8L','PB0');
            set_param(gcbh,'ADC_Ch9L','PB1');
            set_param(gcbh,'ADC_Ch10L','PC0');
            set_param(gcbh,'ADC_Ch11L','PC1');
            set_param(gcbh,'ADC_Ch12L','PC2');
            set_param(gcbh,'ADC_Ch13L','PC3');
            set_param(gcbh,'ADC_Ch14L','PC4');
            set_param(gcbh,'ADC_Ch15L','PC5');
            set_param(gcbh,'ADC_Ch16L','Temp.Sensor');
            set_param(gcbh,'ADC_Ch17L','Vrefint');
            set_param(gcbh,'ADC_Ch18L','Vbat');
        case 'ADC2'
            set_param(gcbh,'ADC_Ch0L','PA0');
            set_param(gcbh,'ADC_Ch1L','PA1');
            set_param(gcbh,'ADC_Ch2L','PA2');
            set_param(gcbh,'ADC_Ch3L','PA3');
            set_param(gcbh,'ADC_Ch4L','PA4');
            set_param(gcbh,'ADC_Ch5L','PA5');
            set_param(gcbh,'ADC_Ch6L','PA6');
            set_param(gcbh,'ADC_Ch7L','PA7');
            set_param(gcbh,'ADC_Ch8L','PB0');
            set_param(gcbh,'ADC_Ch9L','PB1');
            set_param(gcbh,'ADC_Ch10L','PC0');
            set_param(gcbh,'ADC_Ch11L','PC1');
            set_param(gcbh,'ADC_Ch12L','PC2');
            set_param(gcbh,'ADC_Ch13L','PC3');
            set_param(gcbh,'ADC_Ch14L','PC4');
            set_param(gcbh,'ADC_Ch15L','PC5');
            set_param(gcbh,'ADC_Ch16L','');
            set_param(gcbh,'ADC_Ch17L','');
            set_param(gcbh,'ADC_Ch18L','');
        case 'ADC3'
            set_param(gcbh,'ADC_Ch0L','PA0');
            set_param(gcbh,'ADC_Ch1L','PA1');
            set_param(gcbh,'ADC_Ch2L','PA2');
            set_param(gcbh,'ADC_Ch3L','PA3');
            set_param(gcbh,'ADC_Ch4L','PF6');
            set_param(gcbh,'ADC_Ch5L','PF7');
            set_param(gcbh,'ADC_Ch6L','PF8');
            set_param(gcbh,'ADC_Ch7L','PF9');
            set_param(gcbh,'ADC_Ch8L','PF10');
            set_param(gcbh,'ADC_Ch9L','PF3');
            set_param(gcbh,'ADC_Ch10L','PC0');
            set_param(gcbh,'ADC_Ch11L','PC1');
            set_param(gcbh,'ADC_Ch12L','PC2');
            set_param(gcbh,'ADC_Ch13L','PC3');
            set_param(gcbh,'ADC_Ch14L','PF4');
            set_param(gcbh,'ADC_Ch15L','PF5');
            set_param(gcbh,'ADC_Ch16L','');
            set_param(gcbh,'ADC_Ch17L','');
            set_param(gcbh,'ADC_Ch18L','');
    end
end

function resetChannel(ADCName)
    set_param(gcbh,'ADC_Ch0','off');
    set_param(gcbh,'ADC_Ch1','off');
    set_param(gcbh,'ADC_Ch2','off');
    set_param(gcbh,'ADC_Ch3','off');
    set_param(gcbh,'ADC_Ch4','off');
    set_param(gcbh,'ADC_Ch5','off');
    set_param(gcbh,'ADC_Ch6','off');
    set_param(gcbh,'ADC_Ch7','off');
    set_param(gcbh,'ADC_Ch8','off');
    set_param(gcbh,'ADC_Ch9','off');
    set_param(gcbh,'ADC_Ch10','off');
    set_param(gcbh,'ADC_Ch11','off');
    set_param(gcbh,'ADC_Ch12','off');
    set_param(gcbh,'ADC_Ch13','off');
    set_param(gcbh,'ADC_Ch14','off');
    set_param(gcbh,'ADC_Ch15','off');
    set_param(gcbh,'ADC_Ch16','off');
    set_param(gcbh,'ADC_Ch17','off');
    set_param(gcbh,'ADC_Ch18','off');
    initChannelName(ADCName);
    showChannel(ADCName);
end

function showChannel(ADCName)
% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end
clear maskName

    mask_visibilities = get_param(gcbh,'MaskVisibilities');
    mask_enable = get_param(gcbh,'MaskEnables');
   
    mask_enable{ADC_Ch0_idx} = 'on';
    mask_enable{ADC_Ch1_idx} = 'on';
    mask_enable{ADC_Ch2_idx} = 'on';
    mask_enable{ADC_Ch3_idx} = 'on';
    mask_enable{ADC_Ch4_idx} = 'on';
    mask_enable{ADC_Ch5_idx} = 'on';
    mask_enable{ADC_Ch6_idx} = 'on';
    mask_enable{ADC_Ch7_idx} = 'on';
    mask_enable{ADC_Ch8_idx} = 'on';
    mask_enable{ADC_Ch9_idx} = 'on';
    mask_enable{ADC_Ch10_idx} = 'on';
    mask_enable{ADC_Ch11_idx} = 'on';
    mask_enable{ADC_Ch12_idx} = 'on';
    mask_enable{ADC_Ch13_idx} = 'on';
    mask_enable{ADC_Ch14_idx} = 'on';
    mask_enable{ADC_Ch15_idx} = 'on';
    mask_enable{ADC_Ch16_idx} = 'on';
    mask_enable{ADC_Ch17_idx} = 'on';
    mask_enable{ADC_Ch18_idx} = 'on';

    switch ADCName
        case 'ADC2'
            set_param(gcbh,'ADC_Ch16','off');
            set_param(gcbh,'ADC_Ch17','off');
            set_param(gcbh,'ADC_Ch18','off');
            mask_enable{ADC_Ch16_idx} = 'off';
            mask_enable{ADC_Ch17_idx} = 'off';
            mask_enable{ADC_Ch18_idx} = 'off';
        case 'ADC3'
            set_param(gcbh,'ADC_Ch16','off');
            set_param(gcbh,'ADC_Ch17','off');
            set_param(gcbh,'ADC_Ch18','off');
            mask_enable{ADC_Ch16_idx} = 'off';
            mask_enable{ADC_Ch17_idx} = 'off';
            mask_enable{ADC_Ch18_idx} = 'off';
    end  

    if isequal(get_param(gcbh,'ADC_Ch0'),'on')
        mask_visibilities{ADC_Ch0T_idx} = 'on';
        mask_visibilities{ADC_Ch0L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch0T_idx} = 'off';
        mask_visibilities{ADC_Ch0L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch1'),'on')
        mask_visibilities{ADC_Ch1T_idx} = 'on';
        mask_visibilities{ADC_Ch1L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch1T_idx} = 'off';
        mask_visibilities{ADC_Ch1L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch2'),'on')
        mask_visibilities{ADC_Ch2T_idx} = 'on';
        mask_visibilities{ADC_Ch2L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch2T_idx} = 'off';
        mask_visibilities{ADC_Ch2L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch3'),'on')
        mask_visibilities{ADC_Ch3T_idx} = 'on';
        mask_visibilities{ADC_Ch3L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch3T_idx} = 'off';
        mask_visibilities{ADC_Ch3L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch4'),'on')
        mask_visibilities{ADC_Ch4T_idx} = 'on';
        mask_visibilities{ADC_Ch4L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch4T_idx} = 'off';
        mask_visibilities{ADC_Ch4L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch5'),'on')
        mask_visibilities{ADC_Ch5T_idx} = 'on';
        mask_visibilities{ADC_Ch5L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch5T_idx} = 'off';
        mask_visibilities{ADC_Ch5L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch6'),'on')
        mask_visibilities{ADC_Ch6T_idx} = 'on';
        mask_visibilities{ADC_Ch6L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch6T_idx} = 'off';
        mask_visibilities{ADC_Ch6L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch7'),'on')
        mask_visibilities{ADC_Ch7T_idx} = 'on';
        mask_visibilities{ADC_Ch7L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch7T_idx} = 'off';
        mask_visibilities{ADC_Ch7L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch8'),'on')
        mask_visibilities{ADC_Ch8T_idx} = 'on';
        mask_visibilities{ADC_Ch8L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch8T_idx} = 'off';
        mask_visibilities{ADC_Ch8L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch9'),'on')
        mask_visibilities{ADC_Ch9T_idx} = 'on';
        mask_visibilities{ADC_Ch9L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch9T_idx} = 'off';
        mask_visibilities{ADC_Ch9L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch10'),'on')
        mask_visibilities{ADC_Ch10T_idx} = 'on';
        mask_visibilities{ADC_Ch10L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch10T_idx} = 'off';
        mask_visibilities{ADC_Ch10L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch11'),'on')
        mask_visibilities{ADC_Ch11T_idx} = 'on';
        mask_visibilities{ADC_Ch11L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch11T_idx} = 'off';
        mask_visibilities{ADC_Ch11L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch12'),'on')
        mask_visibilities{ADC_Ch12T_idx} = 'on';
        mask_visibilities{ADC_Ch12L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch12T_idx} = 'off';
        mask_visibilities{ADC_Ch12L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch13'),'on')
        mask_visibilities{ADC_Ch13T_idx} = 'on';
        mask_visibilities{ADC_Ch13L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch13T_idx} = 'off';
        mask_visibilities{ADC_Ch13L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch14'),'on')
        mask_visibilities{ADC_Ch14T_idx} = 'on';
        mask_visibilities{ADC_Ch14L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch14T_idx} = 'off';
        mask_visibilities{ADC_Ch14L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch15'),'on')
        mask_visibilities{ADC_Ch15T_idx} = 'on';
        mask_visibilities{ADC_Ch15L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch15T_idx} = 'off';
        mask_visibilities{ADC_Ch15L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch16'),'on')
        mask_visibilities{ADC_Ch16T_idx} = 'on';
        mask_visibilities{ADC_Ch16L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch16T_idx} = 'off';
        mask_visibilities{ADC_Ch16L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch17'),'on')
        mask_visibilities{ADC_Ch17T_idx} = 'on';
        mask_visibilities{ADC_Ch17L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch17T_idx} = 'off';
        mask_visibilities{ADC_Ch17L_idx} = 'off';
    end
    if isequal(get_param(gcbh,'ADC_Ch18'),'on')
        mask_visibilities{ADC_Ch18T_idx} = 'on';
        mask_visibilities{ADC_Ch18L_idx} = 'on';
    else
        mask_visibilities{ADC_Ch18T_idx} = 'off';
        mask_visibilities{ADC_Ch18L_idx} = 'off';
    end
          
    set_param(gcbh,'MaskEnables', mask_enable);
    clear mask_enable          
    set_param (gcbh,'MaskVisibilities', mask_visibilities);
    clear mask_visibilities            
end
