function TIMERS_Config_callback(action)
% Callback to set TIMERS_Config parameters



% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end


switch action
    
    case 'init'
        %All mask are visible except toggle pins
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_visibilities{Timer_name_idx} = 'on';
        mask_visibilities{Timer_clock_idx} = 'on';
        mask_visibilities{Timer_mode_idx} = 'on';
        mask_visibilities{Timer_inout_idx} = 'on';
        mask_visibilities{CH1_enable_idx} = 'on';
        mask_visibilities{CH1_type_idx} = 'on';
        mask_visibilities{CH1_int_idx} = 'off';
        mask_visibilities{Variable_frequency_idx} = 'on';
        mask_visibilities{Output_frequency_idx} = 'on';
        mask_visibilities{CH1_variable_duty_idx} = 'off';
        mask_visibilities{CH1_output_duty_idx} = 'off';
        mask_visibilities{CH1_output_polarity_idx} = 'off';
        mask_visibilities{CH1_output_comp_state_idx} = 'off';
        mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
        mask_visibilities{CH1_output_idle_idx} = 'off';
        mask_visibilities{CH1_output_comp_idle_idx} = 'off';
        mask_visibilities{CH1_input_polarity_idx} = 'off';
        mask_visibilities{CH1_input_prescaler_idx} = 'off';
        mask_visibilities{CH1_input_filter_idx} = 'off';
        mask_visibilities{CH1_input_it_idx} = 'off';
        mask_visibilities{CH2_enable_idx} = 'on';
        mask_visibilities{CH2_type_idx} = 'on';
        mask_visibilities{CH2_int_idx} = 'off';
        mask_visibilities{CH2_variable_duty_idx} = 'off';
        mask_visibilities{CH2_output_duty_idx} = 'off';
        mask_visibilities{CH2_output_polarity_idx} = 'off';
        mask_visibilities{CH2_output_comp_state_idx} = 'off';
        mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
        mask_visibilities{CH2_output_idle_idx} = 'off';
        mask_visibilities{CH2_output_comp_idle_idx} = 'off';
        mask_visibilities{CH2_input_polarity_idx} = 'off';
        mask_visibilities{CH2_input_prescaler_idx} = 'off';
        mask_visibilities{CH2_input_filter_idx} = 'off';
        mask_visibilities{CH2_input_it_idx} = 'off';
        mask_visibilities{CH3_enable_idx} = 'on';
        mask_visibilities{CH3_type_idx} = 'on';
        mask_visibilities{CH3_int_idx} = 'off';
        mask_visibilities{CH3_variable_duty_idx} = 'off';
        mask_visibilities{CH3_output_duty_idx} = 'off';
        mask_visibilities{CH3_output_polarity_idx} = 'off';
        mask_visibilities{CH3_output_comp_state_idx} = 'off';
        mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
        mask_visibilities{CH3_output_idle_idx} = 'off';
        mask_visibilities{CH3_output_comp_idle_idx} = 'off';
        mask_visibilities{CH3_input_polarity_idx} = 'off';
        mask_visibilities{CH3_input_prescaler_idx} = 'off';
        mask_visibilities{CH3_input_filter_idx} = 'off';
        mask_visibilities{CH3_input_it_idx} = 'off';		
        mask_visibilities{Encoder_mode_idx} = 'off';
        mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
        mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
        mask_visibilities{Encoder_auto_reload_idx} = 'off';		
        mask_visibilities{TRGO_source_idx} = 'off';		
        mask_visibilities{Repetition_counter_idx} = 'off';		
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
        
    case 'Timer_name'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
            if(isequal(get_param(gcbh,'CH1_enable'),'on')&&isequal(get_param(gcbh,'CH1_type'),'Output'))
                mask_visibilities{CH1_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH1_output_idle_idx} = 'on';
                mask_visibilities{CH1_output_comp_idle_idx} = 'on';            
                mask_enable{CH1_output_comp_polarity_idx} = 'on';
                mask_enable{CH1_output_idle_idx} = 'on';
                mask_enable{CH1_output_comp_idle_idx} = 'on';    
            end            
            if(isequal(get_param(gcbh,'CH2_enable'),'on')&&isequal(get_param(gcbh,'CH2_type'),'Output'))
                mask_visibilities{CH2_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH2_output_idle_idx} = 'on';
                mask_visibilities{CH2_output_comp_idle_idx} = 'on';            
                mask_enable{CH2_output_comp_polarity_idx} = 'on';
                mask_enable{CH2_output_idle_idx} = 'on';
                mask_enable{CH2_output_comp_idle_idx} = 'on';    
            end            
            if(isequal(get_param(gcbh,'CH3_enable'),'on')&&isequal(get_param(gcbh,'CH3_type'),'Output'))
                mask_visibilities{CH3_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH3_output_idle_idx} = 'on';
                mask_visibilities{CH3_output_comp_idle_idx} = 'on';            
                mask_enable{CH3_output_comp_polarity_idx} = 'on';
                mask_enable{CH3_output_idle_idx} = 'on';
                mask_enable{CH3_output_comp_idle_idx} = 'on';    
            end            
        else
            mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH1_output_idle_idx} = 'off';
            mask_visibilities{CH1_output_comp_idle_idx} = 'off';            
            mask_enable{CH1_output_comp_polarity_idx} = 'off';
            mask_enable{CH1_output_idle_idx} = 'off';
            mask_enable{CH1_output_comp_idle_idx} = 'off';                            
            mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH2_output_idle_idx} = 'off';
            mask_visibilities{CH2_output_comp_idle_idx} = 'off';            
            mask_enable{CH2_output_comp_polarity_idx} = 'off';
            mask_enable{CH2_output_idle_idx} = 'off';
            mask_enable{CH2_output_comp_idle_idx} = 'off';                            
            mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH3_output_idle_idx} = 'off';
            mask_visibilities{CH3_output_comp_idle_idx} = 'off';            
            mask_enable{CH3_output_comp_polarity_idx} = 'off';
            mask_enable{CH3_output_idle_idx} = 'off';
            mask_enable{CH3_output_comp_idle_idx} = 'off';                            
        end
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
 
    case 'Timer_inout'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Timer_inout'),'Output_PWM')
			set_param(gcbh,'CH1_type','Output');
			set_param(gcbh,'CH2_type','Output');
			set_param(gcbh,'CH3_type','Output');
            mask_enable{CH1_type_idx} = 'off';                            
            mask_enable{CH2_type_idx} = 'off';                            
            mask_enable{CH3_type_idx} = 'off';                            
			mask_visibilities{Variable_frequency_idx} = 'on';
			mask_visibilities{Output_frequency_idx} = 'on';	
			mask_enable{CH1_enable_idx} = 'on';					
			mask_enable{CH2_enable_idx} = 'on';					
			mask_enable{CH3_enable_idx} = 'on';	
            mask_visibilities{Encoder_mode_idx} = 'off';
            mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
            mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
			mask_visibilities{Encoder_auto_reload_idx} = 'off';	
            mask_visibilities{TRGO_source_idx} = 'on';
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'TRGO_source'),'TIM_TRGOSource_Update')
                mask_visibilities{Repetition_counter_idx} = 'on';		
                mask_enable{Repetition_counter_idx} = 'on';		
            else
                mask_visibilities{Repetition_counter_idx} = 'off';		
            end            
        elseif isequal(get_param(gcbh,'Timer_inout'),'Input_Capture')
			set_param(gcbh,'CH1_type','Input_Capture');
			set_param(gcbh,'CH2_type','Input_Capture');
			set_param(gcbh,'CH3_type','Input_Capture');
            mask_enable{CH1_type_idx} = 'off';                            
            mask_enable{CH2_type_idx} = 'off';                            
            mask_enable{CH3_type_idx} = 'off';                            
            set_param(gcbh,'Variable_frequency', 'off');                        
	        mask_visibilities{Variable_frequency_idx} = 'off';
			mask_visibilities{Output_frequency_idx} = 'off';
			mask_enable{CH1_enable_idx} = 'on';					
			mask_enable{CH2_enable_idx} = 'on';					
			mask_enable{CH3_enable_idx} = 'on';	
            mask_visibilities{Encoder_mode_idx} = 'off';
            mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
            mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
	        mask_visibilities{Encoder_auto_reload_idx} = 'off';		
            mask_visibilities{TRGO_source_idx} = 'off';		
            mask_visibilities{Repetition_counter_idx} = 'off';		
        else
            mask_visibilities{CH1_input_it_idx} = 'on';
            mask_visibilities{CH1_variable_duty_idx} = 'on';
            mask_visibilities{CH1_int_idx} = 'on';
            mask_visibilities{CH2_input_it_idx} = 'on';
            mask_visibilities{CH2_variable_duty_idx} = 'on';
            mask_visibilities{CH2_int_idx} = 'on';
            mask_visibilities{CH3_input_it_idx} = 'on';
            mask_visibilities{CH3_variable_duty_idx} = 'on';
            mask_visibilities{CH3_int_idx} = 'on';
	        mask_visibilities{Variable_frequency_idx} = 'on';
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            set_param(gcbh,'CH1_input_it', 'No_interrupt');        
            set_param(gcbh,'CH1_variable_duty', 'off');            
            set_param(gcbh,'CH1_int', 'off');            
            set_param(gcbh,'CH2_input_it', 'No_interrupt');            
            set_param(gcbh,'CH2_variable_duty', 'off');            
            set_param(gcbh,'CH2_int', 'off');            
            set_param(gcbh,'CH3_input_it', 'No_interrupt');            
            set_param(gcbh,'CH3_variable_duty', 'off');            
            set_param(gcbh,'CH3_int', 'off');   
            mask_visibilities{CH1_input_it_idx} = 'off';
            mask_visibilities{CH1_variable_duty_idx} = 'off';
            mask_visibilities{CH1_int_idx} = 'off';
            mask_visibilities{CH2_input_it_idx} = 'off';
            mask_visibilities{CH2_variable_duty_idx} = 'off';
            mask_visibilities{CH2_int_idx} = 'off';
            mask_visibilities{CH3_input_it_idx} = 'off';
            mask_visibilities{CH3_variable_duty_idx} = 'off';
            mask_visibilities{CH3_int_idx} = 'off';
            set_param(gcbh,'Variable_frequency', 'off');
	        mask_visibilities{Variable_frequency_idx} = 'off';
            set_param (gcbh,'MaskVisibilities', mask_visibilities);                        
            set_param(gcbh,'CH1_type','Encoder');
			set_param(gcbh,'CH2_type','Encoder');
			set_param(gcbh,'CH3_type','Encoder');
            mask_enable{CH1_type_idx} = 'off';                            
            mask_enable{CH2_type_idx} = 'off';                            
            mask_enable{CH3_type_idx} = 'off';                            
			mask_visibilities{Output_frequency_idx} = 'off';	
            mask_visibilities{Encoder_mode_idx} = 'on';
	        mask_visibilities{Encoder_auto_reload_idx} = 'on';		
            mask_visibilities{TRGO_source_idx} = 'off';		
            mask_visibilities{Repetition_counter_idx} = 'off';		
            mask_enable{CH3_enable_idx} = 'off';					                        
            set_param(gcbh,'CH3_enable', 'off');    
            set_param(gcbh,'MaskEnables', mask_enable);
            set_param (gcbh,'MaskVisibilities', mask_visibilities);            
            if isequal(get_param(gcbh,'Encoder_mode'),'TIM_EncoderMode_TI1')
                mask_enable{CH1_enable_idx} = 'on';	
                mask_enable{CH2_enable_idx} = 'off';	
                set_param(gcbh,'CH1_enable', 'on');                    
                set_param(gcbh,'CH2_enable', 'off');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
            elseif isequal(get_param(gcbh,'Encoder_mode'),'TIM_EncoderMode_TI2')
    			mask_enable{CH1_enable_idx} = 'off';	
    			mask_enable{CH2_enable_idx} = 'on';		            
                set_param(gcbh,'CH1_enable', 'off');                    
                set_param(gcbh,'CH2_enable', 'on');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
            else
    			mask_enable{CH1_enable_idx} = 'on';	
    			mask_enable{CH2_enable_idx} = 'on';					
                set_param(gcbh,'CH1_enable', 'on');                    
                set_param(gcbh,'CH2_enable', 'on');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
            end                
        end
        if isequal(get_param(gcbh,'CH1_enable'),'on')
         if isequal(get_param(gcbh,'CH1_type'),'Output')
            mask_visibilities{CH1_int_idx} = 'on';
            mask_visibilities{CH1_variable_duty_idx} = 'on';
            mask_visibilities{CH1_output_duty_idx} = 'on';
            mask_visibilities{CH1_output_polarity_idx} = 'on';
            mask_visibilities{CH1_output_comp_state_idx} = 'on';
            if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                mask_visibilities{CH1_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH1_output_idle_idx} = 'on';
                mask_visibilities{CH1_output_comp_idle_idx} = 'on';            
                mask_enable{CH1_output_comp_polarity_idx} = 'on';
                mask_enable{CH1_output_idle_idx} = 'on';
                mask_enable{CH1_output_comp_idle_idx} = 'on';    
            end
            mask_enable{CH1_int_idx} = 'on';
            mask_enable{CH1_variable_duty_idx} = 'on';
            mask_enable{CH1_output_duty_idx} = 'on';
            mask_enable{CH1_output_polarity_idx} = 'on';
            mask_enable{CH1_output_comp_state_idx} = 'on';
            set_param(gcbh,'CH1_input_it', 'No_interrupt');            
            mask_visibilities{CH1_input_polarity_idx} = 'off';
            mask_visibilities{CH1_input_prescaler_idx} = 'off';
            mask_visibilities{CH1_input_filter_idx} = 'off';
            mask_visibilities{CH1_input_it_idx} = 'off';                        
		 elseif isequal(get_param(gcbh,'CH1_type'),'Input_Capture')
            mask_visibilities{CH1_input_polarity_idx} = 'on';
            mask_visibilities{CH1_input_prescaler_idx} = 'on';
            mask_visibilities{CH1_input_filter_idx} = 'on';
            mask_visibilities{CH1_input_it_idx} = 'on';
            mask_enable{CH1_input_polarity_idx} = 'on';
            mask_enable{CH1_input_prescaler_idx} = 'on';
            mask_enable{CH1_input_filter_idx} = 'on';
            mask_enable{CH1_input_it_idx} = 'on';
            set_param(gcbh,'CH1_variable_duty', 'off');            
            set_param(gcbh,'CH1_int', 'off');            
            mask_visibilities{CH1_int_idx} = 'off';
            mask_visibilities{CH1_variable_duty_idx} = 'off';
            mask_visibilities{CH1_output_duty_idx} = 'off';
            mask_visibilities{CH1_output_polarity_idx} = 'off';
            mask_visibilities{CH1_output_comp_state_idx} = 'off';
            mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH1_output_idle_idx} = 'off';
            mask_visibilities{CH1_output_comp_idle_idx} = 'off';     
         else
            mask_visibilities{CH1_input_polarity_idx} = 'off';
            mask_visibilities{CH1_input_prescaler_idx} = 'off';
            mask_visibilities{CH1_input_filter_idx} = 'off';
            mask_visibilities{CH1_input_it_idx} = 'off';                        
            mask_visibilities{CH1_int_idx} = 'off';
            mask_visibilities{CH1_variable_duty_idx} = 'off';
            mask_visibilities{CH1_output_duty_idx} = 'off';
            mask_visibilities{CH1_output_polarity_idx} = 'off';
            mask_visibilities{CH1_output_comp_state_idx} = 'off';
            mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH1_output_idle_idx} = 'off';
            mask_visibilities{CH1_output_comp_idle_idx} = 'off';     
            mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
         end               
        end
        if isequal(get_param(gcbh,'CH2_enable'),'on')
         if isequal(get_param(gcbh,'CH2_type'),'Output')
            mask_visibilities{CH2_int_idx} = 'on';
            mask_visibilities{CH2_variable_duty_idx} = 'on';
            mask_visibilities{CH2_output_duty_idx} = 'on';
            mask_visibilities{CH2_output_polarity_idx} = 'on';
            mask_visibilities{CH2_output_comp_state_idx} = 'on';
            if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                mask_visibilities{CH2_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH2_output_idle_idx} = 'on';
                mask_visibilities{CH2_output_comp_idle_idx} = 'on';            
                mask_enable{CH2_output_comp_polarity_idx} = 'on';
                mask_enable{CH2_output_idle_idx} = 'on';
                mask_enable{CH2_output_comp_idle_idx} = 'on';    
            end
            mask_enable{CH2_int_idx} = 'on';
            mask_enable{CH2_variable_duty_idx} = 'on';
            mask_enable{CH2_output_duty_idx} = 'on';
            mask_enable{CH2_output_polarity_idx} = 'on';
            mask_enable{CH2_output_comp_state_idx} = 'on';
            set_param(gcbh,'CH2_input_it', 'No_interrupt');            
            mask_visibilities{CH2_input_polarity_idx} = 'off';
            mask_visibilities{CH2_input_prescaler_idx} = 'off';
            mask_visibilities{CH2_input_filter_idx} = 'off';
            mask_visibilities{CH2_input_it_idx} = 'off';                        
		 elseif isequal(get_param(gcbh,'CH2_type'),'Input_Capture')
            mask_visibilities{CH2_input_polarity_idx} = 'on';
            mask_visibilities{CH2_input_prescaler_idx} = 'on';
            mask_visibilities{CH2_input_filter_idx} = 'on';
            mask_visibilities{CH2_input_it_idx} = 'on';
            mask_enable{CH2_input_polarity_idx} = 'on';
            mask_enable{CH2_input_prescaler_idx} = 'on';
            mask_enable{CH2_input_filter_idx} = 'on';
            mask_enable{CH2_input_it_idx} = 'on';
            set_param(gcbh,'CH2_variable_duty', 'off');            
            mask_visibilities{CH2_variable_duty_idx} = 'off';
            set_param(gcbh,'CH2_int', 'off');            
            mask_visibilities{CH2_int_idx} = 'off';
            mask_visibilities{CH2_output_duty_idx} = 'off';
            mask_visibilities{CH2_output_polarity_idx} = 'off';
            mask_visibilities{CH2_output_comp_state_idx} = 'off';
            mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH2_output_idle_idx} = 'off';
            mask_visibilities{CH2_output_comp_idle_idx} = 'off';  
         else
            mask_visibilities{CH2_input_polarity_idx} = 'off';
            mask_visibilities{CH2_input_prescaler_idx} = 'off';
            mask_visibilities{CH2_input_filter_idx} = 'off';
            mask_visibilities{CH2_input_it_idx} = 'off';                        
            mask_visibilities{CH2_variable_duty_idx} = 'off';
            mask_visibilities{CH2_int_idx} = 'off';
            mask_visibilities{CH2_output_duty_idx} = 'off';
            mask_visibilities{CH2_output_polarity_idx} = 'off';
            mask_visibilities{CH2_output_comp_state_idx} = 'off';
            mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH2_output_idle_idx} = 'off';
            mask_visibilities{CH2_output_comp_idle_idx} = 'off';  
            mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
         end               
        end
        if isequal(get_param(gcbh,'CH3_enable'),'on')
         if isequal(get_param(gcbh,'CH3_type'),'Output')
            mask_visibilities{CH3_int_idx} = 'on';
            mask_visibilities{CH3_variable_duty_idx} = 'on';
            mask_visibilities{CH3_output_duty_idx} = 'on';
            mask_visibilities{CH3_output_polarity_idx} = 'on';
            mask_visibilities{CH3_output_comp_state_idx} = 'on';
            if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                mask_visibilities{CH3_output_comp_polarity_idx} = 'on';
                mask_visibilities{CH3_output_idle_idx} = 'on';
                mask_visibilities{CH3_output_comp_idle_idx} = 'on';            
                mask_enable{CH3_output_comp_polarity_idx} = 'on';
                mask_enable{CH3_output_idle_idx} = 'on';
                mask_enable{CH3_output_comp_idle_idx} = 'on';    
            end
            mask_enable{CH3_int_idx} = 'on';
            mask_enable{CH3_variable_duty_idx} = 'on';
            mask_enable{CH3_output_duty_idx} = 'on';
            mask_enable{CH3_output_polarity_idx} = 'on';
            mask_enable{CH3_output_comp_state_idx} = 'on';
            set_param(gcbh,'CH3_input_it', 'No_interrupt');            
            mask_visibilities{CH3_input_polarity_idx} = 'off';
            mask_visibilities{CH3_input_prescaler_idx} = 'off';
            mask_visibilities{CH3_input_filter_idx} = 'off';
            mask_visibilities{CH3_input_it_idx} = 'off';                        
		 elseif isequal(get_param(gcbh,'CH3_type'),'Input_Capture')
            mask_visibilities{CH3_input_polarity_idx} = 'on';
            mask_visibilities{CH3_input_prescaler_idx} = 'on';
            mask_visibilities{CH3_input_filter_idx} = 'on';
            mask_visibilities{CH3_input_it_idx} = 'on';
            mask_enable{CH3_input_polarity_idx} = 'on';
            mask_enable{CH3_input_prescaler_idx} = 'on';
            mask_enable{CH3_input_filter_idx} = 'on';
            mask_enable{CH3_input_it_idx} = 'on';
            set_param(gcbh,'CH3_variable_duty', 'off');            
            mask_visibilities{CH3_variable_duty_idx} = 'off';
            set_param(gcbh,'CH3_int', 'off');            
            mask_visibilities{CH3_int_idx} = 'off';
            mask_visibilities{CH3_output_duty_idx} = 'off';
            mask_visibilities{CH3_output_polarity_idx} = 'off';
            mask_visibilities{CH3_output_comp_state_idx} = 'off';
            mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH3_output_idle_idx} = 'off';
            mask_visibilities{CH3_output_comp_idle_idx} = 'off';  
         else
            mask_visibilities{CH3_input_polarity_idx} = 'off';
            mask_visibilities{CH3_input_prescaler_idx} = 'off';
            mask_visibilities{CH3_input_filter_idx} = 'off';
            mask_visibilities{CH3_input_it_idx} = 'off';                        
            mask_visibilities{CH3_variable_duty_idx} = 'off';
            mask_visibilities{CH3_int_idx} = 'off';
            mask_visibilities{CH3_output_duty_idx} = 'off';
            mask_visibilities{CH3_output_polarity_idx} = 'off';
            mask_visibilities{CH3_output_comp_state_idx} = 'off';
            mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH3_output_idle_idx} = 'off';
            mask_visibilities{CH3_output_comp_idle_idx} = 'off';  
         end               
        end
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'TRGO_source'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'TRGO_source'),'TIM_TRGOSource_Update')
            mask_visibilities{Repetition_counter_idx} = 'on';		
            mask_enable{Repetition_counter_idx} = 'on';		
        else
            mask_visibilities{Repetition_counter_idx} = 'off';		
        end
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
        
		
    case 'CH1_enable'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'CH1_enable'),'off')
     		mask_enable{CH1_type_idx} = 'off';
            set_param(gcbh,'CH1_input_it', 'No_interrupt');            
            set_param(gcbh,'CH1_variable_duty', 'off');            
            set_param(gcbh,'CH1_int', 'off');            
            mask_visibilities{CH1_int_idx} = 'off';
            mask_visibilities{CH1_variable_duty_idx} = 'off';
            mask_visibilities{CH1_output_duty_idx} = 'off';
            mask_visibilities{CH1_output_polarity_idx} = 'off';
            mask_visibilities{CH1_output_comp_state_idx} = 'off';
            mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH1_output_idle_idx} = 'off';
            mask_visibilities{CH1_output_comp_idle_idx} = 'off';
            mask_visibilities{CH1_input_polarity_idx} = 'off';
            mask_visibilities{CH1_input_prescaler_idx} = 'off';
            mask_visibilities{CH1_input_filter_idx} = 'off';
            mask_visibilities{CH1_input_it_idx} = 'off';
            mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
		else
     		mask_enable{CH1_type_idx} = 'off';            
            if isequal(get_param(gcbh,'CH1_type'),'Output')
                mask_visibilities{CH1_int_idx} = 'on';
                mask_visibilities{CH1_variable_duty_idx} = 'on';
                mask_visibilities{CH1_output_duty_idx} = 'on';
                mask_visibilities{CH1_output_polarity_idx} = 'on';
                mask_visibilities{CH1_output_comp_state_idx} = 'on';
                if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                    mask_visibilities{CH1_output_comp_polarity_idx} = 'on';
                    mask_visibilities{CH1_output_idle_idx} = 'on';
                    mask_visibilities{CH1_output_comp_idle_idx} = 'on';            
                    mask_enable{CH1_output_comp_polarity_idx} = 'on';
                    mask_enable{CH1_output_idle_idx} = 'on';
                    mask_enable{CH1_output_comp_idle_idx} = 'on';    
                end
                mask_enable{CH1_variable_duty_idx} = 'on';
                mask_enable{CH1_output_duty_idx} = 'on';
                mask_enable{CH1_output_polarity_idx} = 'on';
                mask_enable{CH1_output_comp_state_idx} = 'on';
                mask_visibilities{CH1_input_polarity_idx} = 'off';
                mask_visibilities{CH1_input_prescaler_idx} = 'off';
                mask_visibilities{CH1_input_filter_idx} = 'off';
                mask_visibilities{CH1_input_it_idx} = 'off';                        
            elseif isequal(get_param(gcbh,'CH1_type'),'Input_Capture')
                mask_visibilities{CH1_input_polarity_idx} = 'on';
                mask_visibilities{CH1_input_prescaler_idx} = 'on';
                mask_visibilities{CH1_input_filter_idx} = 'on';
                mask_visibilities{CH1_input_it_idx} = 'on';
                mask_enable{CH1_input_polarity_idx} = 'on';
                mask_enable{CH1_input_prescaler_idx} = 'on';
                mask_enable{CH1_input_filter_idx} = 'on';
                mask_enable{CH1_input_it_idx} = 'on';
                mask_visibilities{CH1_variable_duty_idx} = 'off';
                mask_visibilities{CH1_output_duty_idx} = 'off';
                mask_visibilities{CH1_output_polarity_idx} = 'off';
                mask_visibilities{CH1_output_comp_state_idx} = 'off';
                mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH1_output_idle_idx} = 'off';
                mask_visibilities{CH1_output_comp_idle_idx} = 'off';     
            else
                mask_visibilities{CH1_input_polarity_idx} = 'off';
                mask_visibilities{CH1_input_prescaler_idx} = 'off';
                mask_visibilities{CH1_input_filter_idx} = 'off';
                mask_visibilities{CH1_input_it_idx} = 'off';                        
                mask_visibilities{CH1_int_idx} = 'off';
                mask_visibilities{CH1_variable_duty_idx} = 'off';
                mask_visibilities{CH1_output_duty_idx} = 'off';
                mask_visibilities{CH1_output_polarity_idx} = 'off';
                mask_visibilities{CH1_output_comp_state_idx} = 'off';
                mask_visibilities{CH1_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH1_output_idle_idx} = 'off';
                mask_visibilities{CH1_output_comp_idle_idx} = 'off';     
                mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
            end                                                                 
        end       
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'CH2_enable'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'CH2_enable'),'off')
     		mask_enable{CH2_type_idx} = 'off';
            set_param(gcbh,'CH2_input_it', 'No_interrupt');            
            set_param(gcbh,'CH2_variable_duty', 'off');            
            set_param(gcbh,'CH2_int', 'off');            
            mask_visibilities{CH2_int_idx} = 'off';
            mask_visibilities{CH2_variable_duty_idx} = 'off';
            mask_visibilities{CH2_output_duty_idx} = 'off';
            mask_visibilities{CH2_output_polarity_idx} = 'off';
            mask_visibilities{CH2_output_comp_state_idx} = 'off';
            mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH2_output_idle_idx} = 'off';
            mask_visibilities{CH2_output_comp_idle_idx} = 'off';
            mask_visibilities{CH2_input_polarity_idx} = 'off';
            mask_visibilities{CH2_input_prescaler_idx} = 'off';
            mask_visibilities{CH2_input_filter_idx} = 'off';
            mask_visibilities{CH2_input_it_idx} = 'off';
            mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
		else
     		mask_enable{CH2_type_idx} = 'off';            
            if isequal(get_param(gcbh,'CH2_type'),'Output')
                mask_visibilities{CH2_int_idx} = 'on';
                mask_visibilities{CH2_variable_duty_idx} = 'on';
                mask_visibilities{CH2_output_duty_idx} = 'on';
                mask_visibilities{CH2_output_polarity_idx} = 'on';
                mask_visibilities{CH2_output_comp_state_idx} = 'on';
                if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                    mask_visibilities{CH2_output_comp_polarity_idx} = 'on';
                    mask_visibilities{CH2_output_idle_idx} = 'on';
                    mask_visibilities{CH2_output_comp_idle_idx} = 'on';            
                    mask_enable{CH2_output_comp_polarity_idx} = 'on';
                    mask_enable{CH2_output_idle_idx} = 'on';
                    mask_enable{CH2_output_comp_idle_idx} = 'on';    
                end
                mask_enable{CH2_variable_duty_idx} = 'on';
                mask_enable{CH2_output_duty_idx} = 'on';
                mask_enable{CH2_output_polarity_idx} = 'on';
                mask_enable{CH2_output_comp_state_idx} = 'on';
                mask_visibilities{CH2_input_polarity_idx} = 'off';
                mask_visibilities{CH2_input_prescaler_idx} = 'off';
                mask_visibilities{CH2_input_filter_idx} = 'off';
                mask_visibilities{CH2_input_it_idx} = 'off';                        
            elseif isequal(get_param(gcbh,'CH2_type'),'Input_Capture')
                mask_visibilities{CH2_input_polarity_idx} = 'on';
                mask_visibilities{CH2_input_prescaler_idx} = 'on';
                mask_visibilities{CH2_input_filter_idx} = 'on';
                mask_visibilities{CH2_input_it_idx} = 'on';
                mask_enable{CH2_input_polarity_idx} = 'on';
                mask_enable{CH2_input_prescaler_idx} = 'on';
                mask_enable{CH2_input_filter_idx} = 'on';
                mask_enable{CH2_input_it_idx} = 'on';
                mask_visibilities{CH2_variable_duty_idx} = 'off';
                mask_visibilities{CH2_output_duty_idx} = 'off';
                mask_visibilities{CH2_output_polarity_idx} = 'off';
                mask_visibilities{CH2_output_comp_state_idx} = 'off';
                mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH2_output_idle_idx} = 'off';
                mask_visibilities{CH2_output_comp_idle_idx} = 'off';  
            else
                mask_visibilities{CH2_input_polarity_idx} = 'off';
                mask_visibilities{CH2_input_prescaler_idx} = 'off';
                mask_visibilities{CH2_input_filter_idx} = 'off';
                mask_visibilities{CH2_input_it_idx} = 'off';                        
                mask_visibilities{CH2_variable_duty_idx} = 'off';
                mask_visibilities{CH2_int_idx} = 'off';
                mask_visibilities{CH2_output_duty_idx} = 'off';
                mask_visibilities{CH2_output_polarity_idx} = 'off';
                mask_visibilities{CH2_output_comp_state_idx} = 'off';
                mask_visibilities{CH2_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH2_output_idle_idx} = 'off';
                mask_visibilities{CH2_output_comp_idle_idx} = 'off';  
                mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
            end                                                                 
        end       
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities

    case 'CH3_enable'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'CH3_enable'),'off')
     		mask_enable{CH3_type_idx} = 'off';
            set_param(gcbh,'CH3_input_it', 'No_interrupt');            
            set_param(gcbh,'CH3_variable_duty', 'off');                        
            set_param(gcbh,'CH3_int', 'off');            
            mask_visibilities{CH3_int_idx} = 'off';
            mask_visibilities{CH3_variable_duty_idx} = 'off';
            mask_visibilities{CH3_output_duty_idx} = 'off';
            mask_visibilities{CH3_output_polarity_idx} = 'off';
            mask_visibilities{CH3_output_comp_state_idx} = 'off';
            mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
            mask_visibilities{CH3_output_idle_idx} = 'off';
            mask_visibilities{CH3_output_comp_idle_idx} = 'off';
            mask_visibilities{CH3_input_polarity_idx} = 'off';
            mask_visibilities{CH3_input_prescaler_idx} = 'off';
            mask_visibilities{CH3_input_filter_idx} = 'off';
            mask_visibilities{CH3_input_it_idx} = 'off';
		else
     		mask_enable{CH3_type_idx} = 'off';            
            if isequal(get_param(gcbh,'CH3_type'),'Output')
                mask_visibilities{CH3_int_idx} = 'on';
                mask_visibilities{CH3_variable_duty_idx} = 'on';
                mask_visibilities{CH3_output_duty_idx} = 'on';
                mask_visibilities{CH3_output_polarity_idx} = 'on';
                mask_visibilities{CH3_output_comp_state_idx} = 'on';
                if (isequal(get_param(gcbh,'Timer_name'),'TIM1')||isequal(get_param(gcbh,'Timer_name'),'TIM8'))
                    mask_visibilities{CH3_output_comp_polarity_idx} = 'on';
                    mask_visibilities{CH3_output_idle_idx} = 'on';
                    mask_visibilities{CH3_output_comp_idle_idx} = 'on';            
                    mask_enable{CH3_output_comp_polarity_idx} = 'on';
                    mask_enable{CH3_output_idle_idx} = 'on';
                    mask_enable{CH3_output_comp_idle_idx} = 'on';    
                end
                mask_enable{CH3_variable_duty_idx} = 'on';
                mask_enable{CH3_output_duty_idx} = 'on';
                mask_enable{CH3_output_polarity_idx} = 'on';
                mask_enable{CH3_output_comp_state_idx} = 'on';
                mask_visibilities{CH3_input_polarity_idx} = 'off';
                mask_visibilities{CH3_input_prescaler_idx} = 'off';
                mask_visibilities{CH3_input_filter_idx} = 'off';
                mask_visibilities{CH3_input_it_idx} = 'off';                        
            elseif isequal(get_param(gcbh,'CH3_type'),'Input_Capture')
                mask_visibilities{CH3_input_polarity_idx} = 'on';
                mask_visibilities{CH3_input_prescaler_idx} = 'on';
                mask_visibilities{CH3_input_filter_idx} = 'on';
                mask_visibilities{CH3_input_it_idx} = 'on';
                mask_enable{CH3_input_polarity_idx} = 'on';
                mask_enable{CH3_input_prescaler_idx} = 'on';
                mask_enable{CH3_input_filter_idx} = 'on';
                mask_enable{CH3_input_it_idx} = 'on';
                mask_visibilities{CH3_variable_duty_idx} = 'off';
                mask_visibilities{CH3_output_duty_idx} = 'off';
                mask_visibilities{CH3_output_polarity_idx} = 'off';
                mask_visibilities{CH3_output_comp_state_idx} = 'off';
                mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH3_output_idle_idx} = 'off';
                mask_visibilities{CH3_output_comp_idle_idx} = 'off';  
            else
                mask_visibilities{CH3_input_polarity_idx} = 'off';
                mask_visibilities{CH3_input_prescaler_idx} = 'off';
                mask_visibilities{CH3_input_filter_idx} = 'off';
                mask_visibilities{CH3_input_it_idx} = 'off';                        
                mask_visibilities{CH3_variable_duty_idx} = 'off';
                mask_visibilities{CH3_int_idx} = 'off';
                mask_visibilities{CH3_output_duty_idx} = 'off';
                mask_visibilities{CH3_output_polarity_idx} = 'off';
                mask_visibilities{CH3_output_comp_state_idx} = 'off';
                mask_visibilities{CH3_output_comp_polarity_idx} = 'off';
                mask_visibilities{CH3_output_idle_idx} = 'off';
                mask_visibilities{CH3_output_comp_idle_idx} = 'off';  
            end                                                                 
        end       
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
        
    case 'Encoder_mode'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Timer_inout'),'Encoder')
            mask_enable{CH3_enable_idx} = 'off';					                        
            set_param(gcbh,'CH3_enable', 'off');                    
            if isequal(get_param(gcbh,'Encoder_mode'),'TIM_EncoderMode_TI1')
                mask_enable{CH1_enable_idx} = 'on';	
                mask_enable{CH2_enable_idx} = 'off';	
                set_param(gcbh,'CH1_enable', 'on');                    
                set_param(gcbh,'CH2_enable', 'off');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'off';
            elseif isequal(get_param(gcbh,'Encoder_mode'),'TIM_EncoderMode_TI2')
    			mask_enable{CH1_enable_idx} = 'off';	
    			mask_enable{CH2_enable_idx} = 'on';		            
                set_param(gcbh,'CH1_enable', 'off');                    
                set_param(gcbh,'CH2_enable', 'on');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'off';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
            else
    			mask_enable{CH1_enable_idx} = 'on';	
    			mask_enable{CH2_enable_idx} = 'on';					
                set_param(gcbh,'CH1_enable', 'on');                    
                set_param(gcbh,'CH2_enable', 'on');                    
                mask_visibilities{Encoder_TI1_polarity_idx} = 'on';
                mask_visibilities{Encoder_TI2_polarity_idx} = 'on';
            end                
        end
        set_param(gcbh,'MaskEnables', mask_enable);
        clear mask_enable          
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        clear mask_visibilities
          
end

end

