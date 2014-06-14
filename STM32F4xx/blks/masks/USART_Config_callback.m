function USART_Config_callback(action)
% Callback to set PIL parameter : USART number dedicated to RtioStream communication


% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end

%All parameters are visible
%mask_visibilities = get_param(gcbh,'MaskVisibilities');
%for i = 1:length(maskName)
	%mask_visibilities{i} = 'on';
%end;
%set_param (gcbh,'MaskVisibilities', mask_visibilities);

switch action
    
    case 'default'
       if isequal(get_param(gcbh,'USART_DEFAULT'),'on')        
            %Compute only if we push default button
            set_param(gcbh,'USART_DEFAULT','off');  
            set_param(gcbh,'USART_SPEED','115200');
            set_param(gcbh,'USART_DATA','USART_WordLength_8b');
            set_param(gcbh,'USART_PARITY','USART_Parity_No');
            set_param(gcbh,'USART_STOP','USART_StopBits_1');
            set_param(gcbh,'USART_FLOW','on');	
            set_param(gcbh,'It_rcv','on');	
            set_param(gcbh,'It_send','on');	
            set_param(gcbh,'Def_handler','on');	
			UsartName = get_param(gcbh,'USART_CONFIG');
			set_param (gcbh,'Cust_handler', [UsartName '_IRQHandler']);
			clear UsartName
        end          


    case 'usart'
	%Usart connection depending on selected USART
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'USART_CONFIG'),'USART1')
			mask_enable{USART_CONFIG_PIN_idx} = 'on';
			set_param(gcbh,'USART_CONFIG_PIN','PA10/PA9 : (usart1)');
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'USART2')
			mask_enable{USART_CONFIG_PIN_idx} = 'on';
			set_param(gcbh,'USART_CONFIG_PIN','PA3/PA2 : (usart2)');
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'USART3')
			mask_enable{USART_CONFIG_PIN_idx} = 'on';
			set_param(gcbh,'USART_CONFIG_PIN','PC11/PC10 : (usart3 / uart4)');
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'UART4')
			mask_enable{USART_CONFIG_PIN_idx} = 'on';
			set_param(gcbh,'USART_CONFIG_PIN','PA1/PA0 : (uart4)' );
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'UART5')
			set_param(gcbh,'USART_CONFIG_PIN','PD2/PC12 : (uart5)');
			mask_enable{USART_CONFIG_PIN_idx} = 'off';
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'USART6')
			mask_enable{USART_CONFIG_PIN_idx} = 'on';
			set_param(gcbh,'USART_CONFIG_PIN','PC7/PC6 : (usart6)');			
		elseif isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL')
			mask_enable{USART_CONFIG_PIN_idx} = 'off';
			set_param(gcbh,'USART_CONFIG_PIN','PC11/PC10 : (usart3 / uart4)');			
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		UsartName = get_param(gcbh,'USART_CONFIG');
		set_param (gcbh,'Cust_handler', [UsartName '_IRQHandler']);
		clear UsartName
	
	case 'usart_pin'
	%Not useful!!!
        mask_enable = get_param(gcbh,'MaskEnables');
		if (isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PA10/PA9 : (usart1)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PB7/PB6 : (usart1)'))
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'USART1') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		elseif (isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PA3/PA2 : (usart2)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PD6/PD5 : (usart2)'))
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'USART2') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		elseif (isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PB11/PB10 : (usart3)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PD9/PD8 : (usart3)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PC11/PC10 : (usart3 / uart4)'))
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'USART3') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		elseif (isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PA1/PA0 : (uart4)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PC11/PC10 : (usart3 / uart4)'))
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'UART4') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		elseif isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PD2/PC12 : (uart5)')
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'UART5') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		elseif (isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PC7/PC6 : (usart6)') || isequal(get_param(gcbh,'USART_CONFIG_PIN'),'PG9/PG14 : (usart6)'))
			if ((~isequal(get_param(gcbh,'USART_CONFIG'),'USART6') || (~isequal(get_param(gcbh,'USART_CONFIG'),'NO-PIL'))))
			end
		end		
		set_param (gcbh,'MaskEnables', mask_enable);
	
	case 'interrupt_rcv'
		mask_visibilities = get_param(gcbh,'MaskVisibilities');
		if isequal(get_param(gcbh,'It_rcv'),'on')||isequal(get_param(gcbh,'It_send'),'on') 
			mask_visibilities{Def_handler_idx} = 'on';		
			mask_visibilities{Cust_handler_idx} = 'on';		
        else 
			mask_visibilities{Def_handler_idx} = 'off';		
			mask_visibilities{Cust_handler_idx} = 'off';		
		end          
		set_param (gcbh,'MaskVisibilities', mask_visibilities);
		UsartName = get_param(gcbh,'USART_CONFIG');
		set_param (gcbh,'Cust_handler', [UsartName '_IRQHandler']);
		clear UsartName                

    case 'interrupt_send'
		mask_visibilities = get_param(gcbh,'MaskVisibilities');
		if isequal(get_param(gcbh,'It_rcv'),'on')||isequal(get_param(gcbh,'It_send'),'on') 
			mask_visibilities{Def_handler_idx} = 'on';		
			mask_visibilities{Cust_handler_idx} = 'on';		
        else 
			mask_visibilities{Def_handler_idx} = 'off';		
			mask_visibilities{Cust_handler_idx} = 'off';		
		end          
		set_param (gcbh,'MaskVisibilities', mask_visibilities);
		UsartName = get_param(gcbh,'USART_CONFIG');
		set_param (gcbh,'Cust_handler', [UsartName '_IRQHandler']);
		clear UsartName                
        
	case 'def_handler'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Def_handler'),'on')
			mask_enable{Cust_handler_idx} = 'off';	
			UsartName = get_param(gcbh,'USART_CONFIG');
			set_param (gcbh,'Cust_handler', [UsartName '_IRQHandler']);
			clear UsartName
        else
    		mask_enable{Cust_handler_idx} = 'on';			
        end
        set_param (gcbh,'MaskEnables', mask_enable);
	
end


