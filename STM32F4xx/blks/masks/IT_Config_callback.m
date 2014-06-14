function IT_Config_callback(action)
% Callback to set IT_Config parameters

% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end

switch action
    case 'init'
        %Default vicible masks
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
		mask_visibilities{Peripheral_name_idx} = 'on';			
		mask_visibilities{Peripheral_IRQid_idx} = 'off';	
		mask_visibilities{Def_handler_idx} = 'on';			
		mask_visibilities{Cust_handler_idx} = 'on';	
		mask_visibilities{Enable_sim_idx} = 'on';			
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        mask_enable = get_param(gcbh,'MaskEnables');
		mask_enable{Peripheral_name_idx} = 'on';			
		mask_enable{Peripheral_IRQid_idx} = 'off';			
		mask_enable{Def_handler_idx} = 'on';			
		mask_enable{Cust_handler_idx} = 'off';			
		mask_enable{Group_prio_idx} = 'on';			
		mask_enable{Pre0_prio_idx} = 'on';			
		mask_enable{Sub0_prio_idx} = 'on';			
		mask_enable{Pre1_prio_idx} = 'on';			
		mask_enable{Sub1_prio_idx} = 'on';			
		mask_enable{Pre2_prio_idx} = 'on';			
		mask_enable{Sub2_prio_idx} = 'on';			
		mask_enable{Pre3_prio_idx} = 'on';			
		mask_enable{Sub3_prio_idx} = 'on';			
		mask_enable{Pre4_prio_idx} = 'on';			
		mask_enable{Sub4_prio_idx} = 'on';			
		mask_enable{Time_base_idx} = 'on';			
		mask_enable{Enable_sim_idx} = 'on';			
        set_param (gcbh,'MaskEnables', mask_enable);

    case 'name'
		peripheralName = get_param(gcbh,'Peripheral_name');
		view_Misc(peripheralName,Group_prio_idx,...
                   Pre0_prio_idx,Sub0_prio_idx,...
                   Pre1_prio_idx,Sub1_prio_idx,...
                   Pre2_prio_idx,Sub2_prio_idx,...
                   Pre3_prio_idx,Sub3_prio_idx,...
                   Pre4_prio_idx,Sub4_prio_idx,...
                   Time_base_idx);        
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
		mask_visibilities{ADC1_en_idx} = 'off';	
		mask_visibilities{ADC2_en_idx} = 'off';	
		mask_visibilities{ADC3_en_idx} = 'off';	
		mask_visibilities{ADC_EOC_idx} = 'off';	
		mask_visibilities{ADC_JEOC_idx} = 'off';	
		mask_visibilities{ADC_AWD_idx} = 'off';	
		mask_visibilities{ADC_OVR_idx} = 'off';			
		mask_visibilities{EXTI_port_idx} = 'off';	
		mask_visibilities{EXTI_line_idx} = 'off';	
		mask_visibilities{EXTI_trig_idx} = 'off';	
		if isequal(peripheralName,'SysTick')
		    set_param (gcbh,'Peripheral_IRQid', '1');
		elseif isequal(peripheralName,'ADC')
		    set_param (gcbh,'Peripheral_IRQid', '2');
			mask_visibilities{ADC1_en_idx} = 'on';	
			mask_visibilities{ADC2_en_idx} = 'on';	
			mask_visibilities{ADC3_en_idx} = 'on';	
			mask_visibilities{ADC_EOC_idx} = 'on';	
			mask_visibilities{ADC_JEOC_idx} = 'on';	
			mask_visibilities{ADC_AWD_idx} = 'on';	
			mask_visibilities{ADC_OVR_idx} = 'on';				
		elseif isequal(peripheralName,'Timers')
		    set_param(gcbh,'Peripheral_IRQid', '3');
		elseif isequal(peripheralName,'DMA')
		    set_param(gcbh,'Peripheral_IRQid', '4');
		elseif isequal(peripheralName,'WWDG')
		    set_param(gcbh,'Peripheral_IRQid', '5');
		elseif isequal(peripheralName,'PVD')
		    set_param(gcbh,'Peripheral_IRQid', '6');
		elseif isequal(peripheralName,'TAMP')
		    set_param(gcbh,'Peripheral_IRQid', '7');
		elseif isequal(peripheralName,'FLASH')
		    set_param(gcbh,'Peripheral_IRQid', '8');
		elseif isequal(peripheralName,'RCC')
		    set_param(gcbh,'Peripheral_IRQid', '9');
		elseif isequal(peripheralName,'CAN')
		    set_param(gcbh,'Peripheral_IRQid', '10');
		elseif isequal(peripheralName,'EXTint')
		    set_param(gcbh,'Peripheral_IRQid', '11');
			mask_visibilities{EXTI_port_idx} = 'on';	
			mask_visibilities{EXTI_line_idx} = 'on';	
			mask_visibilities{EXTI_trig_idx} = 'on';	
		elseif isequal(peripheralName,'I2C')
		    set_param(gcbh,'Peripheral_IRQid', '12');
		elseif isequal(peripheralName,'SPI')
		    set_param(gcbh,'Peripheral_IRQid', '13');
		elseif isequal(peripheralName,'USART')
		    set_param(gcbh,'Peripheral_IRQid', '14');
		elseif isequal(peripheralName,'RTC')
		    set_param(gcbh,'Peripheral_IRQid', '15');
		elseif isequal(peripheralName,'OTG_HS')
		    set_param(gcbh,'Peripheral_IRQid', '16');
		elseif isequal(peripheralName,'FSMC')
		    set_param(gcbh,'Peripheral_IRQid', '17');
		elseif isequal(peripheralName,'SDIO')
		    set_param(gcbh,'Peripheral_IRQid', '18');
		elseif isequal(peripheralName,'ETH')
		    set_param(gcbh,'Peripheral_IRQid', '19');
		elseif isequal(peripheralName,'OTG_FS')
		    set_param(gcbh,'Peripheral_IRQid', '20');
		elseif isequal(peripheralName,'DCMI')
		    set_param(gcbh,'Peripheral_IRQid', '21');
		elseif isequal(peripheralName,'CRYP')
		    set_param(gcbh,'Peripheral_IRQid', '22');
		elseif isequal(peripheralName,'HASH')
		    set_param(gcbh,'Peripheral_IRQid', '23');
		elseif isequal(peripheralName,'FPU')
		    set_param(gcbh,'Peripheral_IRQid', '24');
		else
		    set_param (gcbh,'Peripheral_IRQid', '0');
		end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
		setHandlerName(peripheralName);
		clear peripheralName
    
    case 'line'
		peripheralName = get_param(gcbh,'Peripheral_name');
		setHandlerName(peripheralName);
		clear peripheralName
            
	case 'def_handler'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Def_handler'),'on')
			mask_enable{Cust_handler_idx} = 'off';	
			peripheralName = get_param(gcbh,'Peripheral_name');
			setHandlerName(peripheralName);
			clear peripheralName
        else
    		mask_enable{Cust_handler_idx} = 'on';			
        end
        set_param (gcbh,'MaskEnables', mask_enable);

    case 'group_prio'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Peripheral_name'),'SysTick')
			mask_visibilities{Time_base_idx} = 'on';
			mask_visibilities{Pre0_prio_idx} = 'off';			
			mask_visibilities{Sub0_prio_idx} = 'off';			
			mask_visibilities{Pre1_prio_idx} = 'off';			
			mask_visibilities{Sub1_prio_idx} = 'off';			
			mask_visibilities{Pre2_prio_idx} = 'off';			
			mask_visibilities{Sub2_prio_idx} = 'off';			
			mask_visibilities{Pre3_prio_idx} = 'off';			
			mask_visibilities{Sub3_prio_idx} = 'off';			
			mask_visibilities{Pre4_prio_idx} = 'off';			
			mask_visibilities{Sub4_prio_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_0')
			mask_visibilities{Time_base_idx} = 'off';
			mask_visibilities{Pre0_prio_idx} = 'on';			
			mask_visibilities{Sub0_prio_idx} = 'on';			
     		mask_enable{Pre0_prio_idx} = 'on';			
     		mask_enable{Sub0_prio_idx} = 'on';		
			mask_visibilities{Pre1_prio_idx} = 'off';			
			mask_visibilities{Sub1_prio_idx} = 'off';			
     		mask_enable{Pre1_prio_idx} = 'off';			
     		mask_enable{Sub1_prio_idx} = 'off';		
			mask_visibilities{Pre2_prio_idx} = 'off';			
			mask_visibilities{Sub2_prio_idx} = 'off';			
     		mask_enable{Pre2_prio_idx} = 'off';			
     		mask_enable{Sub2_prio_idx} = 'off';		
			mask_visibilities{Pre3_prio_idx} = 'off';			
			mask_visibilities{Sub3_prio_idx} = 'off';			
     		mask_enable{Pre3_prio_idx} = 'off';			
     		mask_enable{Sub3_prio_idx} = 'off';		
			mask_visibilities{Pre4_prio_idx} = 'off';			
			mask_visibilities{Sub4_prio_idx} = 'off';			
     		mask_enable{Pre4_prio_idx} = 'off';			
     		mask_enable{Sub4_prio_idx} = 'off';					
        elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_1')
			mask_visibilities{Time_base_idx} = 'off';
			mask_visibilities{Pre0_prio_idx} = 'off';			
			mask_visibilities{Sub0_prio_idx} = 'off';			
     		mask_enable{Pre0_prio_idx} = 'off';			
     		mask_enable{Sub0_prio_idx} = 'off';		
			mask_visibilities{Pre1_prio_idx} = 'on';			
			mask_visibilities{Sub1_prio_idx} = 'on';			
     		mask_enable{Pre1_prio_idx} = 'on';			
     		mask_enable{Sub1_prio_idx} = 'on';		
			mask_visibilities{Pre2_prio_idx} = 'off';			
			mask_visibilities{Sub2_prio_idx} = 'off';			
     		mask_enable{Pre2_prio_idx} = 'off';			
     		mask_enable{Sub2_prio_idx} = 'off';		
			mask_visibilities{Pre3_prio_idx} = 'off';			
			mask_visibilities{Sub3_prio_idx} = 'off';			
     		mask_enable{Pre3_prio_idx} = 'off';			
     		mask_enable{Sub3_prio_idx} = 'off';		
			mask_visibilities{Pre4_prio_idx} = 'off';			
			mask_visibilities{Sub4_prio_idx} = 'off';			
     		mask_enable{Pre4_prio_idx} = 'off';			
     		mask_enable{Sub4_prio_idx} = 'off';	
        elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_2')
			mask_visibilities{Time_base_idx} = 'off';
			mask_visibilities{Pre0_prio_idx} = 'off';			
			mask_visibilities{Sub0_prio_idx} = 'off';			
     		mask_enable{Pre0_prio_idx} = 'off';			
     		mask_enable{Sub0_prio_idx} = 'off';		
			mask_visibilities{Pre1_prio_idx} = 'off';			
			mask_visibilities{Sub1_prio_idx} = 'off';			
     		mask_enable{Pre1_prio_idx} = 'off';			
     		mask_enable{Sub1_prio_idx} = 'off';		
			mask_visibilities{Pre2_prio_idx} = 'on';			
			mask_visibilities{Sub2_prio_idx} = 'on';			
     		mask_enable{Pre2_prio_idx} = 'on';			
     		mask_enable{Sub2_prio_idx} = 'on';		
			mask_visibilities{Pre3_prio_idx} = 'off';			
			mask_visibilities{Sub3_prio_idx} = 'off';			
     		mask_enable{Pre3_prio_idx} = 'off';			
     		mask_enable{Sub3_prio_idx} = 'off';		
			mask_visibilities{Pre4_prio_idx} = 'off';			
			mask_visibilities{Sub4_prio_idx} = 'off';			
     		mask_enable{Pre4_prio_idx} = 'off';			
     		mask_enable{Sub4_prio_idx} = 'off';	
        elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_3')
			mask_visibilities{Time_base_idx} = 'off';
			mask_visibilities{Pre0_prio_idx} = 'off';			
			mask_visibilities{Sub0_prio_idx} = 'off';			
     		mask_enable{Pre0_prio_idx} = 'off';			
     		mask_enable{Sub0_prio_idx} = 'off';		
			mask_visibilities{Pre1_prio_idx} = 'off';			
			mask_visibilities{Sub1_prio_idx} = 'off';			
     		mask_enable{Pre1_prio_idx} = 'off';			
     		mask_enable{Sub1_prio_idx} = 'off';		
			mask_visibilities{Pre2_prio_idx} = 'off';			
			mask_visibilities{Sub2_prio_idx} = 'off';			
     		mask_enable{Pre2_prio_idx} = 'off';			
     		mask_enable{Sub2_prio_idx} = 'off';		
			mask_visibilities{Pre3_prio_idx} = 'on';			
			mask_visibilities{Sub3_prio_idx} = 'on';			
     		mask_enable{Pre3_prio_idx} = 'on';			
     		mask_enable{Sub3_prio_idx} = 'on';		
			mask_visibilities{Pre4_prio_idx} = 'off';			
			mask_visibilities{Sub4_prio_idx} = 'off';			
     		mask_enable{Pre4_prio_idx} = 'off';			
     		mask_enable{Sub4_prio_idx} = 'off';	
        elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_4')
			mask_visibilities{Time_base_idx} = 'off';
			mask_visibilities{Pre0_prio_idx} = 'off';			
			mask_visibilities{Sub0_prio_idx} = 'off';			
     		mask_enable{Pre0_prio_idx} = 'off';			
     		mask_enable{Sub0_prio_idx} = 'off';		
			mask_visibilities{Pre1_prio_idx} = 'off';			
			mask_visibilities{Sub1_prio_idx} = 'off';			
     		mask_enable{Pre1_prio_idx} = 'off';			
     		mask_enable{Sub1_prio_idx} = 'off';		
			mask_visibilities{Pre2_prio_idx} = 'off';			
			mask_visibilities{Sub2_prio_idx} = 'off';			
     		mask_enable{Pre2_prio_idx} = 'off';			
     		mask_enable{Sub2_prio_idx} = 'off';		
			mask_visibilities{Pre3_prio_idx} = 'off';			
			mask_visibilities{Sub3_prio_idx} = 'off';			
     		mask_enable{Pre3_prio_idx} = 'off';			
     		mask_enable{Sub3_prio_idx} = 'off';		
			mask_visibilities{Pre4_prio_idx} = 'on';			
			mask_visibilities{Sub4_prio_idx} = 'on';			
     		mask_enable{Pre4_prio_idx} = 'on';			
     		mask_enable{Sub4_prio_idx} = 'on';	
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);   

		case 'time_base'
           Time_Val = str2double(get_param(gcbh,'Time_base'));
            if (isnan(Time_Val)==1 || isnumeric(Time_Val)==0 || Time_Val <= 0 )
                set_param(gcbh,'Time_base','0.1');
    			errordlg('Time base must be a positive number.');
             end
	
end

function setHandlerName(periph)
	if isequal(periph,'SysTick')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'SysTick_Handler');
		end
	elseif isequal(periph,'ADC')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'ADC_IRQHandler');
		end
	elseif isequal(periph,'Timers')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'DMA')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'WWDG')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'PVD')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'TAMP')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'FLASH')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'RCC')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'CAN')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'EXTint')
	    lineNum = get_param(gcbh,'EXTI_line');
		if isequal(get_param(gcbh,'Def_handler'),'on')
			switch lineNum
			case '0'
				set_param (gcbh,'Cust_handler', 'EXTI0_IRQHandler');
			case '1'
				set_param (gcbh,'Cust_handler', 'EXTI1_IRQHandler');
			case '2'
				set_param (gcbh,'Cust_handler', 'EXTI2_IRQHandler');
			case '3'
				set_param (gcbh,'Cust_handler', 'EXTI3_IRQHandler');
			case '4'
				set_param (gcbh,'Cust_handler', 'EXTI4_IRQHandler');
			case {'5', '9'}
				set_param (gcbh,'Cust_handler', 'EXTI9_5_IRQHandler');
			case {'10', '15'}
				set_param (gcbh,'Cust_handler', 'EXTI10_15_IRQHandler');
			end
		end
		clear lineNum
	elseif isequal(periph,'I2C')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'SPI')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'USART')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'RTC')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'OTG_HS')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'FSMC')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'SDIO')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'ETH')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'OTG_FS')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'DCMI')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'CRYP')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'HASH')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	elseif isequal(periph,'FPU')
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	else
		if isequal(get_param(gcbh,'Def_handler'),'on')
			set_param (gcbh,'Cust_handler', 'Default_Handler');
		end
	end


function view_Misc(periph,group,pre0,sub0,pre1,sub1,pre2,sub2,pre3,sub3,pre4,sub4,timebase)
    mask_visibilities = get_param(gcbh,'MaskVisibilities');
    if isequal(periph,'SysTick')
		mask_visibilities{timebase} = 'on';
        val = 'off';
    else
		mask_visibilities{timebase} = 'off';
        val = 'on';
    end        
	mask_visibilities{group} = val;			
    if isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_0')
		mask_visibilities{pre0} = val;			
		mask_visibilities{sub0} = val;			
 	elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_1')
		mask_visibilities{pre1} = val;			
		mask_visibilities{sub1} = val;			
 	elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_2')
		mask_visibilities{pre2} = val;			
		mask_visibilities{sub2} = val;			
 	elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_3')
		mask_visibilities{pre3} = val;			
		mask_visibilities{sub3} = val;			
 	elseif isequal(get_param(gcbh,'Group_prio'),'NVIC_PriorityGroup_4')
		mask_visibilities{pre4} = val;			
		mask_visibilities{sub4} = val;			
    end
    set_param (gcbh,'MaskVisibilities', mask_visibilities);
