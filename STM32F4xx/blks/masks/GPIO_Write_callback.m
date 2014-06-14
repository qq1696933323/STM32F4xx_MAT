function GPIO_Write_callback(action)
% Callback to set GPIO_Write parameters



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
		mask_visibilities{Port_name_idx} = 'on';			
		mask_visibilities{Enable_input_idx} = 'on';			
		mask_visibilities{Pin0_idx} = 'on';			
		mask_visibilities{Pin1_idx} = 'on';			
		mask_visibilities{Pin2_idx} = 'on';			
		mask_visibilities{Pin3_idx} = 'on';			
		mask_visibilities{Pin4_idx} = 'on';			
		mask_visibilities{Pin5_idx} = 'on';			
		mask_visibilities{Pin6_idx} = 'on';			
		mask_visibilities{Pin7_idx} = 'on';			
		mask_visibilities{Pin8_idx} = 'on';			
		mask_visibilities{Pin9_idx} = 'on';			
		mask_visibilities{Pin10_idx} = 'on';			
		mask_visibilities{Pin11_idx} = 'on';			
		mask_visibilities{Pin12_idx} = 'on';			
		mask_visibilities{Pin13_idx} = 'on';			
		mask_visibilities{Pin14_idx} = 'on';			
		mask_visibilities{Pin15_idx} = 'on';			
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
              	
    case 'Enable_input'
        if isequal(get_param(gcbh,'Enable_input'),'off')
            if((isequal(get_param(gcbh,'Pin0'),'on')&&isequal(get_param(gcbh,'Toggle_Pin0'),'off'))...
             ||(isequal(get_param(gcbh,'Pin1'),'on')&&isequal(get_param(gcbh,'Toggle_Pin1'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin2'),'on')&&isequal(get_param(gcbh,'Toggle_Pin2'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin3'),'on')&&isequal(get_param(gcbh,'Toggle_Pin3'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin4'),'on')&&isequal(get_param(gcbh,'Toggle_Pin4'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin5'),'on')&&isequal(get_param(gcbh,'Toggle_Pin5'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin6'),'on')&&isequal(get_param(gcbh,'Toggle_Pin6'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin7'),'on')&&isequal(get_param(gcbh,'Toggle_Pin7'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin8'),'on')&&isequal(get_param(gcbh,'Toggle_Pin8'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin9'),'on')&&isequal(get_param(gcbh,'Toggle_Pin9'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin10'),'on')&&isequal(get_param(gcbh,'Toggle_Pin10'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin11'),'on')&&isequal(get_param(gcbh,'Toggle_Pin11'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin12'),'on')&&isequal(get_param(gcbh,'Toggle_Pin12'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin13'),'on')&&isequal(get_param(gcbh,'Toggle_Pin13'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin14'),'on')&&isequal(get_param(gcbh,'Toggle_Pin14'),'off'))...  
             ||(isequal(get_param(gcbh,'Pin15'),'on')&&isequal(get_param(gcbh,'Toggle_Pin15'),'off')))
                warndlg('Input must be enabled if pin is not toggling only.','!! Warning !!','modal');
                set_param(gcbh,'Enable_input','on');
            end
        end       
        
    case 'Pin0'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin0'),'on')
			mask_visibilities{Toggle_Pin0_idx} = 'on';	
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin0', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin0_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin0', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
    
    case 'Pin1'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin1'),'on')
			mask_visibilities{Toggle_Pin1_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin1', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin1_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin1', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin2'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin2'),'on')
			mask_visibilities{Toggle_Pin2_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin2', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin2_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin2', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin3'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin3'),'on')
			mask_visibilities{Toggle_Pin3_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin3', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin3_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin3', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin4'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin4'),'on')
			mask_visibilities{Toggle_Pin4_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin4', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin4_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin4', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin5'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin5'),'on')
			mask_visibilities{Toggle_Pin5_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin5', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin5_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin5', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin6'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin6'),'on')
			mask_visibilities{Toggle_Pin6_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin6', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin6_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin6', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin7'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin7'),'on')
			mask_visibilities{Toggle_Pin7_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin7', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin7_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin7', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin8'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin8'),'on')
			mask_visibilities{Toggle_Pin8_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin8', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin8_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin8', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin9'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin9'),'on')
			mask_visibilities{Toggle_Pin9_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin9', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin9_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin9', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin10'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin10'),'on')
			mask_visibilities{Toggle_Pin10_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin10', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin10_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin10', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin11'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin11'),'on')
			mask_visibilities{Toggle_Pin11_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin11', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin11_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin11', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin12'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin12'),'on')
			mask_visibilities{Toggle_Pin12_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin12', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin12_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin12', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin13'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin13'),'on')
			mask_visibilities{Toggle_Pin13_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin13', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin13_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin13', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin14'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin14'),'on')
			mask_visibilities{Toggle_Pin14_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin14', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin14_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin14', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
    case 'Pin15'
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin15'),'on')
			mask_visibilities{Toggle_Pin15_idx} = 'on';			
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
            if isequal(get_param(gcbh,'Enable_input'),'off')
                set_param (gcbh,'Toggle_Pin15', 'on');
            end  
        else
			mask_visibilities{Toggle_Pin15_idx} = 'off';			
            set_param (gcbh,'Toggle_Pin15', 'off');
            set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
		
	case 'Toggle0'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin0'),get_param(gcbh,'Toggle_Pin0'));
		set_param(gcbh,'Toggle_Pin0',toggleOut);

    case 'Toggle1'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin1'),get_param(gcbh,'Toggle_Pin1'));
		set_param(gcbh,'Toggle_Pin1',toggleOut);

    case 'Toggle2'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin2'),get_param(gcbh,'Toggle_Pin2'));
		set_param(gcbh,'Toggle_Pin2',toggleOut);

    case 'Toggle3'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin3'),get_param(gcbh,'Toggle_Pin3'));
		set_param(gcbh,'Toggle_Pin3',toggleOut);

    case 'Toggle4'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin4'),get_param(gcbh,'Toggle_Pin4'));
		set_param(gcbh,'Toggle_Pin4',toggleOut);

    case 'Toggle5'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin5'),get_param(gcbh,'Toggle_Pin5'));
		set_param(gcbh,'Toggle_Pin5',toggleOut);

    case 'Toggle6'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin6'),get_param(gcbh,'Toggle_Pin6'));
		set_param(gcbh,'Toggle_Pin6',toggleOut);

    case 'Toggle7'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin7'),get_param(gcbh,'Toggle_Pin7'));
		set_param(gcbh,'Toggle_Pin7',toggleOut);

    case 'Toggle8'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin8'),get_param(gcbh,'Toggle_Pin8'));
		set_param(gcbh,'Toggle_Pin8',toggleOut);

    case 'Toggle9'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin9'),get_param(gcbh,'Toggle_Pin9'));
		set_param(gcbh,'Toggle_Pin9',toggleOut);

    case 'Toggle10'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin10'),get_param(gcbh,'Toggle_Pin10'));
		set_param(gcbh,'Toggle_Pin10',toggleOut);

    case 'Toggle11'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin11'),get_param(gcbh,'Toggle_Pin11'));
		set_param(gcbh,'Toggle_Pin11',toggleOut);

    case 'Toggle12'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin12'),get_param(gcbh,'Toggle_Pin12'));
		set_param(gcbh,'Toggle_Pin12',toggleOut);

    case 'Toggle13'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin13'),get_param(gcbh,'Toggle_Pin13'));
		set_param(gcbh,'Toggle_Pin13',toggleOut);

    case 'Toggle14'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin14'),get_param(gcbh,'Toggle_Pin14'));
		set_param(gcbh,'Toggle_Pin14',toggleOut);

    case 'Toggle15'
		toggleOut = togglePin(get_param(gcbh,'Enable_input'),get_param(gcbh,'Pin15'),get_param(gcbh,'Toggle_Pin15'));
		set_param(gcbh,'Toggle_Pin15',toggleOut);
end


end

function [toggleOut] = togglePin(Enable,Pin,Toggle)
    if (isequal(Enable,'on'))
        toggleOut = Toggle;
    elseif  (isequal(Pin,'off'))
		toggleOut = 'off';        
    elseif (isequal(Pin,'on')&&isequal(Toggle,'off'))
        warndlg('Only toggle pin is allowed when Enable input parameter is not set (no input)','!! Warning !!','modal');
		toggleOut = 'on';
	else
		toggleOut = Toggle;
    end
end
