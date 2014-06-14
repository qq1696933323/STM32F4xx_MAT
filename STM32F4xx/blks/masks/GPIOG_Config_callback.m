function GPIOG_Config_callback(action)
% Callback to set GPIOG_Config parameters



% declare parameter index
maskName = get_param(gcbh, 'MaskNames');
for i = 1:length(maskName)
    cmdStr = [maskName{i} '_idx=' num2str(i) ';'];
    eval(cmdStr);
end


switch action
           
    case 'use0'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin0_Use'),'on')
            mask_enable{Pin0_Speed_idx} = 'on';
            mask_enable{Pin0_Set_idx} = 'on';
            mask_enable{Pin0_Mode_idx} = 'on';
            mask_enable{Pin0_Type_idx} = 'on';
            mask_enable{Pin0_PuPd_idx} = 'on';
            mask_enable{Pin0_AF_idx} = 'on';
        else
            mask_enable{Pin0_Speed_idx} = 'off';
            mask_enable{Pin0_Set_idx} = 'off';
            mask_enable{Pin0_Mode_idx} = 'off';
            mask_enable{Pin0_Type_idx} = 'off';
            mask_enable{Pin0_PuPd_idx} = 'off';
            mask_enable{Pin0_AF_idx} = 'off';
			set_param (gcbh,'Pin0_Set', 'off');		
			set_param (gcbh,'Pin0_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin0_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin0_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin0_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin0_Set_idx} = 'on';			
			mask_visibilities{Pin0_Speed_idx} = 'on';			
			mask_visibilities{Pin0_Mode_idx} = 'on';			
			mask_visibilities{Pin0_Type_idx} = 'on';			
			mask_visibilities{Pin0_PuPd_idx} = 'off';			
			mask_visibilities{Pin0_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);

	case 'use1'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin1_Use'),'on')
            mask_enable{Pin1_Speed_idx} = 'on';
            mask_enable{Pin1_Set_idx} = 'on';
            mask_enable{Pin1_Mode_idx} = 'on';
            mask_enable{Pin1_Type_idx} = 'on';
            mask_enable{Pin1_PuPd_idx} = 'on';
            mask_enable{Pin1_AF_idx} = 'on';
        else
            mask_enable{Pin1_Speed_idx} = 'off';
            mask_enable{Pin1_Set_idx} = 'off';
            mask_enable{Pin1_Mode_idx} = 'off';
            mask_enable{Pin1_Type_idx} = 'off';
            mask_enable{Pin1_PuPd_idx} = 'off';
            mask_enable{Pin1_AF_idx} = 'off';
			set_param (gcbh,'Pin1_Set', 'off');		
			set_param (gcbh,'Pin1_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin1_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin1_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin1_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin1_Set_idx} = 'on';			
			mask_visibilities{Pin1_Speed_idx} = 'on';			
			mask_visibilities{Pin1_Mode_idx} = 'on';			
			mask_visibilities{Pin1_Type_idx} = 'on';			
			mask_visibilities{Pin1_PuPd_idx} = 'off';			
			mask_visibilities{Pin1_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use2'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin2_Use'),'on')
            mask_enable{Pin2_Speed_idx} = 'on';
            mask_enable{Pin2_Set_idx} = 'on';
            mask_enable{Pin2_Mode_idx} = 'on';
            mask_enable{Pin2_Type_idx} = 'on';
            mask_enable{Pin2_PuPd_idx} = 'on';
            mask_enable{Pin2_AF_idx} = 'on';
        else
            mask_enable{Pin2_Speed_idx} = 'off';
            mask_enable{Pin2_Set_idx} = 'off';
            mask_enable{Pin2_Mode_idx} = 'off';
            mask_enable{Pin2_Type_idx} = 'off';
            mask_enable{Pin2_PuPd_idx} = 'off';
            mask_enable{Pin2_AF_idx} = 'off';
			set_param (gcbh,'Pin2_Set', 'off');		
			set_param (gcbh,'Pin2_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin2_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin2_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin2_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin2_Set_idx} = 'on';			
			mask_visibilities{Pin2_Speed_idx} = 'on';			
			mask_visibilities{Pin2_Mode_idx} = 'on';			
			mask_visibilities{Pin2_Type_idx} = 'on';			
			mask_visibilities{Pin2_PuPd_idx} = 'off';			
			mask_visibilities{Pin2_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use3'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin3_Use'),'on')
            mask_enable{Pin3_Speed_idx} = 'on';
            mask_enable{Pin3_Set_idx} = 'on';
            mask_enable{Pin3_Mode_idx} = 'on';
            mask_enable{Pin3_Type_idx} = 'on';
            mask_enable{Pin3_PuPd_idx} = 'on';
            mask_enable{Pin3_AF_idx} = 'on';
        else
            mask_enable{Pin3_Speed_idx} = 'off';
            mask_enable{Pin3_Set_idx} = 'off';
            mask_enable{Pin3_Mode_idx} = 'off';
            mask_enable{Pin3_Type_idx} = 'off';
            mask_enable{Pin3_PuPd_idx} = 'off';
            mask_enable{Pin3_AF_idx} = 'off';
			set_param (gcbh,'Pin3_Set', 'off');		
			set_param (gcbh,'Pin3_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin3_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin3_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin3_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin3_Set_idx} = 'on';			
			mask_visibilities{Pin3_Speed_idx} = 'on';			
			mask_visibilities{Pin3_Mode_idx} = 'on';			
			mask_visibilities{Pin3_Type_idx} = 'on';			
			mask_visibilities{Pin3_PuPd_idx} = 'off';			
			mask_visibilities{Pin3_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use4'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin4_Use'),'on')
            mask_enable{Pin4_Speed_idx} = 'on';
            mask_enable{Pin4_Set_idx} = 'on';
            mask_enable{Pin4_Mode_idx} = 'on';
            mask_enable{Pin4_Type_idx} = 'on';
            mask_enable{Pin4_PuPd_idx} = 'on';
            mask_enable{Pin4_AF_idx} = 'on';
        else
            mask_enable{Pin4_Speed_idx} = 'off';
            mask_enable{Pin4_Set_idx} = 'off';
            mask_enable{Pin4_Mode_idx} = 'off';
            mask_enable{Pin4_Type_idx} = 'off';
            mask_enable{Pin4_PuPd_idx} = 'off';
            mask_enable{Pin4_AF_idx} = 'off';
			set_param (gcbh,'Pin4_Set', 'off');		
			set_param (gcbh,'Pin4_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin4_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin4_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin4_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin4_Set_idx} = 'on';			
			mask_visibilities{Pin4_Speed_idx} = 'on';			
			mask_visibilities{Pin4_Mode_idx} = 'on';			
			mask_visibilities{Pin4_Type_idx} = 'on';			
			mask_visibilities{Pin4_PuPd_idx} = 'off';			
			mask_visibilities{Pin4_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use5'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin5_Use'),'on')
            mask_enable{Pin5_Speed_idx} = 'on';
            mask_enable{Pin5_Set_idx} = 'on';
            mask_enable{Pin5_Mode_idx} = 'on';
            mask_enable{Pin5_Type_idx} = 'on';
            mask_enable{Pin5_PuPd_idx} = 'on';
            mask_enable{Pin5_AF_idx} = 'on';
        else
            mask_enable{Pin5_Speed_idx} = 'off';
            mask_enable{Pin5_Set_idx} = 'off';
            mask_enable{Pin5_Mode_idx} = 'off';
            mask_enable{Pin5_Type_idx} = 'off';
            mask_enable{Pin5_PuPd_idx} = 'off';
            mask_enable{Pin5_AF_idx} = 'off';
			set_param (gcbh,'Pin5_Set', 'off');		
			set_param (gcbh,'Pin5_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin5_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin5_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin5_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin5_Set_idx} = 'on';			
			mask_visibilities{Pin5_Speed_idx} = 'on';			
			mask_visibilities{Pin5_Mode_idx} = 'on';			
			mask_visibilities{Pin5_Type_idx} = 'on';			
			mask_visibilities{Pin5_PuPd_idx} = 'off';			
			mask_visibilities{Pin5_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use6'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin6_Use'),'on')
            mask_enable{Pin6_Speed_idx} = 'on';
            mask_enable{Pin6_Set_idx} = 'on';
            mask_enable{Pin6_Mode_idx} = 'on';
            mask_enable{Pin6_Type_idx} = 'on';
            mask_enable{Pin6_PuPd_idx} = 'on';
            mask_enable{Pin6_AF_idx} = 'on';
        else
            mask_enable{Pin6_Speed_idx} = 'off';
            mask_enable{Pin6_Set_idx} = 'off';
            mask_enable{Pin6_Mode_idx} = 'off';
            mask_enable{Pin6_Type_idx} = 'off';
            mask_enable{Pin6_PuPd_idx} = 'off';
            mask_enable{Pin6_AF_idx} = 'off';
			set_param (gcbh,'Pin6_Set', 'off');		
			set_param (gcbh,'Pin6_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin6_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin6_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin6_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin6_Set_idx} = 'on';			
			mask_visibilities{Pin6_Speed_idx} = 'on';			
			mask_visibilities{Pin6_Mode_idx} = 'on';			
			mask_visibilities{Pin6_Type_idx} = 'on';			
			mask_visibilities{Pin6_PuPd_idx} = 'off';			
			mask_visibilities{Pin6_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use7'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin7_Use'),'on')
            mask_enable{Pin7_Speed_idx} = 'on';
            mask_enable{Pin7_Set_idx} = 'on';
            mask_enable{Pin7_Mode_idx} = 'on';
            mask_enable{Pin7_Type_idx} = 'on';
            mask_enable{Pin7_PuPd_idx} = 'on';
            mask_enable{Pin7_AF_idx} = 'on';
        else
            mask_enable{Pin7_Speed_idx} = 'off';
            mask_enable{Pin7_Set_idx} = 'off';
            mask_enable{Pin7_Mode_idx} = 'off';
            mask_enable{Pin7_Type_idx} = 'off';
            mask_enable{Pin7_PuPd_idx} = 'off';
            mask_enable{Pin7_AF_idx} = 'off';
			set_param (gcbh,'Pin7_Set', 'off');		
			set_param (gcbh,'Pin7_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin7_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin7_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin7_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin7_Set_idx} = 'on';			
			mask_visibilities{Pin7_Speed_idx} = 'on';			
			mask_visibilities{Pin7_Mode_idx} = 'on';			
			mask_visibilities{Pin7_Type_idx} = 'on';			
			mask_visibilities{Pin7_PuPd_idx} = 'off';			
			mask_visibilities{Pin7_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use8'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin8_Use'),'on')
            mask_enable{Pin8_Speed_idx} = 'on';
            mask_enable{Pin8_Set_idx} = 'on';
            mask_enable{Pin8_Mode_idx} = 'on';
            mask_enable{Pin8_Type_idx} = 'on';
            mask_enable{Pin8_PuPd_idx} = 'on';
            mask_enable{Pin8_AF_idx} = 'on';
        else
            mask_enable{Pin8_Speed_idx} = 'off';
            mask_enable{Pin8_Set_idx} = 'off';
            mask_enable{Pin8_Mode_idx} = 'off';
            mask_enable{Pin8_Type_idx} = 'off';
            mask_enable{Pin8_PuPd_idx} = 'off';
            mask_enable{Pin8_AF_idx} = 'off';
			set_param (gcbh,'Pin8_Set', 'off');		
			set_param (gcbh,'Pin8_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin8_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin8_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin8_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin8_Set_idx} = 'on';			
			mask_visibilities{Pin8_Speed_idx} = 'on';			
			mask_visibilities{Pin8_Mode_idx} = 'on';			
			mask_visibilities{Pin8_Type_idx} = 'on';			
			mask_visibilities{Pin8_PuPd_idx} = 'off';			
			mask_visibilities{Pin8_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use9'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin9_Use'),'on')
            mask_enable{Pin9_Speed_idx} = 'on';
            mask_enable{Pin9_Set_idx} = 'on';
            mask_enable{Pin9_Mode_idx} = 'on';
            mask_enable{Pin9_Type_idx} = 'on';
            mask_enable{Pin9_PuPd_idx} = 'on';
            mask_enable{Pin9_AF_idx} = 'on';
        else
            mask_enable{Pin9_Speed_idx} = 'off';
            mask_enable{Pin9_Set_idx} = 'off';
            mask_enable{Pin9_Mode_idx} = 'off';
            mask_enable{Pin9_Type_idx} = 'off';
            mask_enable{Pin9_PuPd_idx} = 'off';
            mask_enable{Pin9_AF_idx} = 'off';
			set_param (gcbh,'Pin9_Set', 'off');		
			set_param (gcbh,'Pin9_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin9_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin9_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin9_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin9_Set_idx} = 'on';			
			mask_visibilities{Pin9_Speed_idx} = 'on';			
			mask_visibilities{Pin9_Mode_idx} = 'on';			
			mask_visibilities{Pin9_Type_idx} = 'on';			
			mask_visibilities{Pin9_PuPd_idx} = 'off';			
			mask_visibilities{Pin9_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use10'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin10_Use'),'on')
            mask_enable{Pin10_Speed_idx} = 'on';
            mask_enable{Pin10_Set_idx} = 'on';
            mask_enable{Pin10_Mode_idx} = 'on';
            mask_enable{Pin10_Type_idx} = 'on';
            mask_enable{Pin10_PuPd_idx} = 'on';
            mask_enable{Pin10_AF_idx} = 'on';
        else
            mask_enable{Pin10_Speed_idx} = 'off';
            mask_enable{Pin10_Set_idx} = 'off';
            mask_enable{Pin10_Mode_idx} = 'off';
            mask_enable{Pin10_Type_idx} = 'off';
            mask_enable{Pin10_PuPd_idx} = 'off';
            mask_enable{Pin10_AF_idx} = 'off';
			set_param (gcbh,'Pin10_Set', 'off');		
			set_param (gcbh,'Pin10_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin10_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin10_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin10_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin10_Set_idx} = 'on';			
			mask_visibilities{Pin10_Speed_idx} = 'on';			
			mask_visibilities{Pin10_Mode_idx} = 'on';			
			mask_visibilities{Pin10_Type_idx} = 'on';			
			mask_visibilities{Pin10_PuPd_idx} = 'off';			
			mask_visibilities{Pin10_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use11'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin11_Use'),'on')
            mask_enable{Pin11_Speed_idx} = 'on';
            mask_enable{Pin11_Set_idx} = 'on';
            mask_enable{Pin11_Mode_idx} = 'on';
            mask_enable{Pin11_Type_idx} = 'on';
            mask_enable{Pin11_PuPd_idx} = 'on';
            mask_enable{Pin11_AF_idx} = 'on';
        else
            mask_enable{Pin11_Speed_idx} = 'off';
            mask_enable{Pin11_Set_idx} = 'off';
            mask_enable{Pin11_Mode_idx} = 'off';
            mask_enable{Pin11_Type_idx} = 'off';
            mask_enable{Pin11_PuPd_idx} = 'off';
            mask_enable{Pin11_AF_idx} = 'off';
			set_param (gcbh,'Pin11_Set', 'off');		
			set_param (gcbh,'Pin11_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin11_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin11_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin11_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin11_Set_idx} = 'on';			
			mask_visibilities{Pin11_Speed_idx} = 'on';			
			mask_visibilities{Pin11_Mode_idx} = 'on';			
			mask_visibilities{Pin11_Type_idx} = 'on';			
			mask_visibilities{Pin11_PuPd_idx} = 'off';			
			mask_visibilities{Pin11_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use12'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin12_Use'),'on')
            mask_enable{Pin12_Speed_idx} = 'on';
            mask_enable{Pin12_Set_idx} = 'on';
            mask_enable{Pin12_Mode_idx} = 'on';
            mask_enable{Pin12_Type_idx} = 'on';
            mask_enable{Pin12_PuPd_idx} = 'on';
            mask_enable{Pin12_AF_idx} = 'on';
        else
            mask_enable{Pin12_Speed_idx} = 'off';
            mask_enable{Pin12_Set_idx} = 'off';
            mask_enable{Pin12_Mode_idx} = 'off';
            mask_enable{Pin12_Type_idx} = 'off';
            mask_enable{Pin12_PuPd_idx} = 'off';
            mask_enable{Pin12_AF_idx} = 'off';
			set_param (gcbh,'Pin12_Set', 'off');		
			set_param (gcbh,'Pin12_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin12_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin12_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin12_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin12_Set_idx} = 'on';			
			mask_visibilities{Pin12_Speed_idx} = 'on';			
			mask_visibilities{Pin12_Mode_idx} = 'on';			
			mask_visibilities{Pin12_Type_idx} = 'on';			
			mask_visibilities{Pin12_PuPd_idx} = 'off';			
			mask_visibilities{Pin12_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use13'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin13_Use'),'on')
            mask_enable{Pin13_Speed_idx} = 'on';
            mask_enable{Pin13_Set_idx} = 'on';
            mask_enable{Pin13_Mode_idx} = 'on';
            mask_enable{Pin13_Type_idx} = 'on';
            mask_enable{Pin13_PuPd_idx} = 'on';
            mask_enable{Pin13_AF_idx} = 'on';
        else
            mask_enable{Pin13_Speed_idx} = 'off';
            mask_enable{Pin13_Set_idx} = 'off';
            mask_enable{Pin13_Mode_idx} = 'off';
            mask_enable{Pin13_Type_idx} = 'off';
            mask_enable{Pin13_PuPd_idx} = 'off';
            mask_enable{Pin13_AF_idx} = 'off';
			set_param (gcbh,'Pin13_Set', 'off');		
			set_param (gcbh,'Pin13_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin13_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin13_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin13_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin13_Set_idx} = 'on';			
			mask_visibilities{Pin13_Speed_idx} = 'on';			
			mask_visibilities{Pin13_Mode_idx} = 'on';			
			mask_visibilities{Pin13_Type_idx} = 'on';			
			mask_visibilities{Pin13_PuPd_idx} = 'off';			
			mask_visibilities{Pin13_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use14'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin14_Use'),'on')
            mask_enable{Pin14_Speed_idx} = 'on';
            mask_enable{Pin14_Set_idx} = 'on';
            mask_enable{Pin14_Mode_idx} = 'on';
            mask_enable{Pin14_Type_idx} = 'on';
            mask_enable{Pin14_PuPd_idx} = 'on';
            mask_enable{Pin14_AF_idx} = 'on';
        else
            mask_enable{Pin14_Speed_idx} = 'off';
            mask_enable{Pin14_Set_idx} = 'off';
            mask_enable{Pin14_Mode_idx} = 'off';
            mask_enable{Pin14_Type_idx} = 'off';
            mask_enable{Pin14_PuPd_idx} = 'off';
            mask_enable{Pin14_AF_idx} = 'off';
			set_param (gcbh,'Pin14_Set', 'off');		
			set_param (gcbh,'Pin14_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin14_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin14_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin14_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin14_Set_idx} = 'on';			
			mask_visibilities{Pin14_Speed_idx} = 'on';			
			mask_visibilities{Pin14_Mode_idx} = 'on';			
			mask_visibilities{Pin14_Type_idx} = 'on';			
			mask_visibilities{Pin14_PuPd_idx} = 'off';			
			mask_visibilities{Pin14_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
	case 'use15'
        mask_enable = get_param(gcbh,'MaskEnables');
        if isequal(get_param(gcbh,'Pin15_Use'),'on')
            mask_enable{Pin15_Speed_idx} = 'on';
            mask_enable{Pin15_Set_idx} = 'on';
            mask_enable{Pin15_Mode_idx} = 'on';
            mask_enable{Pin15_Type_idx} = 'on';
            mask_enable{Pin15_PuPd_idx} = 'on';
            mask_enable{Pin15_AF_idx} = 'on';
        else
            mask_enable{Pin15_Speed_idx} = 'off';
            mask_enable{Pin15_Set_idx} = 'off';
            mask_enable{Pin15_Mode_idx} = 'off';
            mask_enable{Pin15_Type_idx} = 'off';
            mask_enable{Pin15_PuPd_idx} = 'off';
            mask_enable{Pin15_AF_idx} = 'off';
			set_param (gcbh,'Pin15_Set', 'off');		
			set_param (gcbh,'Pin15_Speed', 'GPIO_Speed_2MHz');		
			set_param (gcbh,'Pin15_Mode', 'GPIO_Mode_OUT');		
			set_param (gcbh,'Pin15_Type', 'GPIO_OType_PP');		
			set_param (gcbh,'Pin15_PuPd', 'GPIO_PuPd_NOPULL');		
			mask_visibilities = get_param(gcbh,'MaskVisibilities');
			mask_visibilities{Pin15_Set_idx} = 'on';			
			mask_visibilities{Pin15_Speed_idx} = 'on';			
			mask_visibilities{Pin15_Mode_idx} = 'on';			
			mask_visibilities{Pin15_Type_idx} = 'on';			
			mask_visibilities{Pin15_PuPd_idx} = 'off';			
			mask_visibilities{Pin15_AF_idx} = 'off';			
			set_param (gcbh,'MaskVisibilities', mask_visibilities);
        end
        set_param (gcbh,'MaskEnables', mask_enable);
		
    case 'mode0'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin0_Use'),'on')
        if isequal(get_param(gcbh,'Pin0_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin0_Type_idx} = 'off';
			mask_visibilities{Pin0_Type_idx} = 'off';
            mask_enable{Pin0_AF_idx} = 'off';
			mask_visibilities{Pin0_AF_idx} = 'off';			
            mask_enable{Pin0_PuPd_idx} = 'on';
			mask_visibilities{Pin0_PuPd_idx} = 'on';
            mask_enable{Pin0_Set_idx} = 'off';
			mask_visibilities{Pin0_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin0_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin0_Type_idx} = 'on';
			mask_visibilities{Pin0_Type_idx} = 'on';
            mask_enable{Pin0_AF_idx} = 'off';
			mask_visibilities{Pin0_AF_idx} = 'off';			
            mask_enable{Pin0_PuPd_idx} = 'off';
			mask_visibilities{Pin0_PuPd_idx} = 'off';
            mask_enable{Pin0_Set_idx} = 'on';
			mask_visibilities{Pin0_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin0_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin0_Type_idx} = 'off';
			mask_visibilities{Pin0_Type_idx} = 'off';
            mask_enable{Pin0_AF_idx} = 'on';
			mask_visibilities{Pin0_AF_idx} = 'on';			
            mask_enable{Pin0_PuPd_idx} = 'off';
			mask_visibilities{Pin0_PuPd_idx} = 'off';
            mask_enable{Pin0_Set_idx} = 'off';
			mask_visibilities{Pin0_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin0_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin0_Type_idx} = 'off';
			mask_visibilities{Pin0_Type_idx} = 'off';
            mask_enable{Pin0_AF_idx} = 'off';
			mask_visibilities{Pin0_AF_idx} = 'off';			
            mask_enable{Pin0_PuPd_idx} = 'off';
			mask_visibilities{Pin0_PuPd_idx} = 'off';
            mask_enable{Pin0_Set_idx} = 'off';
			mask_visibilities{Pin0_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode1'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin1_Use'),'on')
        if isequal(get_param(gcbh,'Pin1_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin1_Type_idx} = 'off';
			mask_visibilities{Pin1_Type_idx} = 'off';
            mask_enable{Pin1_AF_idx} = 'off';
			mask_visibilities{Pin1_AF_idx} = 'off';			
            mask_enable{Pin1_PuPd_idx} = 'on';
			mask_visibilities{Pin1_PuPd_idx} = 'on';
            mask_enable{Pin1_Set_idx} = 'off';
			mask_visibilities{Pin1_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin1_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin1_Type_idx} = 'on';
			mask_visibilities{Pin1_Type_idx} = 'on';
            mask_enable{Pin1_AF_idx} = 'off';
			mask_visibilities{Pin1_AF_idx} = 'off';			
            mask_enable{Pin1_PuPd_idx} = 'off';
			mask_visibilities{Pin1_PuPd_idx} = 'off';
            mask_enable{Pin1_Set_idx} = 'on';
			mask_visibilities{Pin1_Set_idx} = 'on';			
       elseif isequal(get_param(gcbh,'Pin1_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin1_Type_idx} = 'off';
			mask_visibilities{Pin1_Type_idx} = 'off';
            mask_enable{Pin1_AF_idx} = 'on';
			mask_visibilities{Pin1_AF_idx} = 'on';			
            mask_enable{Pin1_PuPd_idx} = 'off';
			mask_visibilities{Pin1_PuPd_idx} = 'off';
            mask_enable{Pin1_Set_idx} = 'off';
			mask_visibilities{Pin1_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin1_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin1_Type_idx} = 'off';
			mask_visibilities{Pin1_Type_idx} = 'off';
            mask_enable{Pin1_AF_idx} = 'off';
			mask_visibilities{Pin1_AF_idx} = 'off';			
            mask_enable{Pin1_PuPd_idx} = 'off';
			mask_visibilities{Pin1_PuPd_idx} = 'off';
            mask_enable{Pin1_Set_idx} = 'off';
			mask_visibilities{Pin1_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode2'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin2_Use'),'on')
        if isequal(get_param(gcbh,'Pin2_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin2_Type_idx} = 'off';
			mask_visibilities{Pin2_Type_idx} = 'off';
            mask_enable{Pin2_AF_idx} = 'off';
			mask_visibilities{Pin2_AF_idx} = 'off';			
            mask_enable{Pin2_PuPd_idx} = 'on';
			mask_visibilities{Pin2_PuPd_idx} = 'on';
            mask_enable{Pin2_Set_idx} = 'off';
			mask_visibilities{Pin2_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin2_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin2_Type_idx} = 'on';
			mask_visibilities{Pin2_Type_idx} = 'on';
            mask_enable{Pin2_AF_idx} = 'off';
			mask_visibilities{Pin2_AF_idx} = 'off';			
            mask_enable{Pin2_PuPd_idx} = 'off';
			mask_visibilities{Pin2_PuPd_idx} = 'off';
            mask_enable{Pin2_Set_idx} = 'on';
			mask_visibilities{Pin2_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin2_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin2_Type_idx} = 'off';
			mask_visibilities{Pin2_Type_idx} = 'off';
            mask_enable{Pin2_AF_idx} = 'on';
			mask_visibilities{Pin2_AF_idx} = 'on';			
            mask_enable{Pin2_PuPd_idx} = 'off';
			mask_visibilities{Pin2_PuPd_idx} = 'off';
            mask_enable{Pin2_Set_idx} = 'off';
			mask_visibilities{Pin2_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin2_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin2_Type_idx} = 'off';
			mask_visibilities{Pin2_Type_idx} = 'off';
            mask_enable{Pin2_AF_idx} = 'off';
			mask_visibilities{Pin2_AF_idx} = 'off';			
            mask_enable{Pin2_PuPd_idx} = 'off';
			mask_visibilities{Pin2_PuPd_idx} = 'off';
            mask_enable{Pin2_Set_idx} = 'off';
			mask_visibilities{Pin2_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode3'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin3_Use'),'on')
        if isequal(get_param(gcbh,'Pin3_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin3_Type_idx} = 'off';
			mask_visibilities{Pin3_Type_idx} = 'off';
            mask_enable{Pin3_AF_idx} = 'off';
			mask_visibilities{Pin3_AF_idx} = 'off';			
            mask_enable{Pin3_PuPd_idx} = 'on';
			mask_visibilities{Pin3_PuPd_idx} = 'on';
            mask_enable{Pin3_Set_idx} = 'off';
			mask_visibilities{Pin3_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin3_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin3_Type_idx} = 'on';
			mask_visibilities{Pin3_Type_idx} = 'on';
            mask_enable{Pin3_AF_idx} = 'off';
			mask_visibilities{Pin3_AF_idx} = 'off';			
            mask_enable{Pin3_PuPd_idx} = 'off';
			mask_visibilities{Pin3_PuPd_idx} = 'off';
            mask_enable{Pin3_Set_idx} = 'on';
			mask_visibilities{Pin3_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin3_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin3_Type_idx} = 'off';
			mask_visibilities{Pin3_Type_idx} = 'off';
            mask_enable{Pin3_AF_idx} = 'on';
			mask_visibilities{Pin3_AF_idx} = 'on';			
            mask_enable{Pin3_PuPd_idx} = 'off';
			mask_visibilities{Pin3_PuPd_idx} = 'off';
            mask_enable{Pin3_Set_idx} = 'off';
			mask_visibilities{Pin3_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin3_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin3_Type_idx} = 'off';
			mask_visibilities{Pin3_Type_idx} = 'off';
            mask_enable{Pin3_AF_idx} = 'off';
			mask_visibilities{Pin3_AF_idx} = 'off';			
            mask_enable{Pin3_PuPd_idx} = 'off';
			mask_visibilities{Pin3_PuPd_idx} = 'off';
            mask_enable{Pin3_Set_idx} = 'off';
			mask_visibilities{Pin3_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode4'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin4_Use'),'on')
        if isequal(get_param(gcbh,'Pin4_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin4_Type_idx} = 'off';
			mask_visibilities{Pin4_Type_idx} = 'off';
            mask_enable{Pin4_AF_idx} = 'off';
			mask_visibilities{Pin4_AF_idx} = 'off';			
            mask_enable{Pin4_PuPd_idx} = 'on';
			mask_visibilities{Pin4_PuPd_idx} = 'on';
            mask_enable{Pin4_Set_idx} = 'off';
			mask_visibilities{Pin4_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin4_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin4_Type_idx} = 'on';
			mask_visibilities{Pin4_Type_idx} = 'on';
            mask_enable{Pin4_AF_idx} = 'off';
			mask_visibilities{Pin4_AF_idx} = 'off';			
            mask_enable{Pin4_PuPd_idx} = 'off';
			mask_visibilities{Pin4_PuPd_idx} = 'off';
            mask_enable{Pin4_Set_idx} = 'on';
			mask_visibilities{Pin4_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin4_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin4_Type_idx} = 'off';
			mask_visibilities{Pin4_Type_idx} = 'off';
            mask_enable{Pin4_AF_idx} = 'on';
			mask_visibilities{Pin4_AF_idx} = 'on';			
            mask_enable{Pin4_PuPd_idx} = 'off';
			mask_visibilities{Pin4_PuPd_idx} = 'off';
            mask_enable{Pin4_Set_idx} = 'off';
			mask_visibilities{Pin4_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin4_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin4_Type_idx} = 'off';
			mask_visibilities{Pin4_Type_idx} = 'off';
            mask_enable{Pin4_AF_idx} = 'off';
			mask_visibilities{Pin4_AF_idx} = 'off';			
            mask_enable{Pin4_PuPd_idx} = 'off';
			mask_visibilities{Pin4_PuPd_idx} = 'off';
            mask_enable{Pin4_Set_idx} = 'off';
			mask_visibilities{Pin4_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode5'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin5_Use'),'on')
        if isequal(get_param(gcbh,'Pin5_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin5_Type_idx} = 'off';
			mask_visibilities{Pin5_Type_idx} = 'off';
            mask_enable{Pin5_AF_idx} = 'off';
			mask_visibilities{Pin5_AF_idx} = 'off';			
            mask_enable{Pin5_PuPd_idx} = 'on';
			mask_visibilities{Pin5_PuPd_idx} = 'on';
            mask_enable{Pin5_Set_idx} = 'off';
			mask_visibilities{Pin5_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin5_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin5_Type_idx} = 'on';
			mask_visibilities{Pin5_Type_idx} = 'on';
            mask_enable{Pin5_AF_idx} = 'off';
			mask_visibilities{Pin5_AF_idx} = 'off';			
            mask_enable{Pin5_PuPd_idx} = 'off';
			mask_visibilities{Pin5_PuPd_idx} = 'off';
            mask_enable{Pin5_Set_idx} = 'on';
			mask_visibilities{Pin5_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin5_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin5_Type_idx} = 'off';
			mask_visibilities{Pin5_Type_idx} = 'off';
            mask_enable{Pin5_AF_idx} = 'on';
			mask_visibilities{Pin5_AF_idx} = 'on';			
            mask_enable{Pin5_PuPd_idx} = 'off';
			mask_visibilities{Pin5_PuPd_idx} = 'off';
            mask_enable{Pin5_Set_idx} = 'off';
			mask_visibilities{Pin5_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin5_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin5_Type_idx} = 'off';
			mask_visibilities{Pin5_Type_idx} = 'off';
            mask_enable{Pin5_AF_idx} = 'off';
			mask_visibilities{Pin5_AF_idx} = 'off';			
            mask_enable{Pin5_PuPd_idx} = 'off';
			mask_visibilities{Pin5_PuPd_idx} = 'off';
            mask_enable{Pin5_Set_idx} = 'off';
			mask_visibilities{Pin5_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode6'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin6_Use'),'on')
        if isequal(get_param(gcbh,'Pin6_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin6_Type_idx} = 'off';
			mask_visibilities{Pin6_Type_idx} = 'off';
            mask_enable{Pin6_AF_idx} = 'off';
			mask_visibilities{Pin6_AF_idx} = 'off';			
            mask_enable{Pin6_PuPd_idx} = 'on';
			mask_visibilities{Pin6_PuPd_idx} = 'on';
            mask_enable{Pin6_Set_idx} = 'off';
			mask_visibilities{Pin6_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin6_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin6_Type_idx} = 'on';
			mask_visibilities{Pin6_Type_idx} = 'on';
            mask_enable{Pin6_AF_idx} = 'off';
			mask_visibilities{Pin6_AF_idx} = 'off';			
            mask_enable{Pin6_PuPd_idx} = 'off';
			mask_visibilities{Pin6_PuPd_idx} = 'off';
            mask_enable{Pin6_Set_idx} = 'on';
			mask_visibilities{Pin6_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin6_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin6_Type_idx} = 'off';
			mask_visibilities{Pin6_Type_idx} = 'off';
            mask_enable{Pin6_AF_idx} = 'on';
			mask_visibilities{Pin6_AF_idx} = 'on';			
            mask_enable{Pin6_PuPd_idx} = 'off';
			mask_visibilities{Pin6_PuPd_idx} = 'off';
            mask_enable{Pin6_Set_idx} = 'off';
			mask_visibilities{Pin6_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin6_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin6_Type_idx} = 'off';
			mask_visibilities{Pin6_Type_idx} = 'off';
            mask_enable{Pin6_AF_idx} = 'off';
			mask_visibilities{Pin6_AF_idx} = 'off';			
            mask_enable{Pin6_PuPd_idx} = 'off';
			mask_visibilities{Pin6_PuPd_idx} = 'off';
            mask_enable{Pin6_Set_idx} = 'off';
			mask_visibilities{Pin6_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode7'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin7_Use'),'on')
        if isequal(get_param(gcbh,'Pin7_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin7_Type_idx} = 'off';
			mask_visibilities{Pin7_Type_idx} = 'off';
            mask_enable{Pin7_AF_idx} = 'off';
			mask_visibilities{Pin7_AF_idx} = 'off';			
            mask_enable{Pin7_PuPd_idx} = 'on';
			mask_visibilities{Pin7_PuPd_idx} = 'on';
            mask_enable{Pin7_Set_idx} = 'off';
			mask_visibilities{Pin7_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin7_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin7_Type_idx} = 'on';
			mask_visibilities{Pin7_Type_idx} = 'on';
            mask_enable{Pin7_AF_idx} = 'off';
			mask_visibilities{Pin7_AF_idx} = 'off';			
            mask_enable{Pin7_PuPd_idx} = 'off';
			mask_visibilities{Pin7_PuPd_idx} = 'off';
            mask_enable{Pin7_Set_idx} = 'on';
			mask_visibilities{Pin7_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin7_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin7_Type_idx} = 'off';
			mask_visibilities{Pin7_Type_idx} = 'off';
            mask_enable{Pin7_AF_idx} = 'on';
			mask_visibilities{Pin7_AF_idx} = 'on';			
            mask_enable{Pin7_PuPd_idx} = 'off';
			mask_visibilities{Pin7_PuPd_idx} = 'off';
            mask_enable{Pin7_Set_idx} = 'off';
			mask_visibilities{Pin7_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin7_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin7_Type_idx} = 'off';
			mask_visibilities{Pin7_Type_idx} = 'off';
            mask_enable{Pin7_AF_idx} = 'off';
			mask_visibilities{Pin7_AF_idx} = 'off';			
            mask_enable{Pin7_PuPd_idx} = 'off';
			mask_visibilities{Pin7_PuPd_idx} = 'off';
            mask_enable{Pin7_Set_idx} = 'off';
			mask_visibilities{Pin7_Set_idx} = 'off';			
       end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode8'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin8_Use'),'on')
        if isequal(get_param(gcbh,'Pin8_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin8_Type_idx} = 'off';
			mask_visibilities{Pin8_Type_idx} = 'off';
            mask_enable{Pin8_AF_idx} = 'off';
			mask_visibilities{Pin8_AF_idx} = 'off';			
            mask_enable{Pin8_PuPd_idx} = 'on';
			mask_visibilities{Pin8_PuPd_idx} = 'on';
            mask_enable{Pin8_Set_idx} = 'off';
			mask_visibilities{Pin8_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin8_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin8_Type_idx} = 'on';
			mask_visibilities{Pin8_Type_idx} = 'on';
            mask_enable{Pin8_AF_idx} = 'off';
			mask_visibilities{Pin8_AF_idx} = 'off';			
            mask_enable{Pin8_PuPd_idx} = 'off';
			mask_visibilities{Pin8_PuPd_idx} = 'off';
            mask_enable{Pin8_Set_idx} = 'on';
			mask_visibilities{Pin8_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin8_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin8_Type_idx} = 'off';
			mask_visibilities{Pin8_Type_idx} = 'off';
            mask_enable{Pin8_AF_idx} = 'on';
			mask_visibilities{Pin8_AF_idx} = 'on';			
            mask_enable{Pin8_PuPd_idx} = 'off';
			mask_visibilities{Pin8_PuPd_idx} = 'off';
            mask_enable{Pin8_Set_idx} = 'off';
			mask_visibilities{Pin8_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin8_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin8_Type_idx} = 'off';
			mask_visibilities{Pin8_Type_idx} = 'off';
            mask_enable{Pin8_AF_idx} = 'off';
			mask_visibilities{Pin8_AF_idx} = 'off';			
            mask_enable{Pin8_PuPd_idx} = 'off';
			mask_visibilities{Pin8_PuPd_idx} = 'off';
            mask_enable{Pin8_Set_idx} = 'off';
			mask_visibilities{Pin8_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode9'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin9_Use'),'on')
        if isequal(get_param(gcbh,'Pin9_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin9_Type_idx} = 'off';
			mask_visibilities{Pin9_Type_idx} = 'off';
            mask_enable{Pin9_AF_idx} = 'off';
			mask_visibilities{Pin9_AF_idx} = 'off';			
            mask_enable{Pin9_PuPd_idx} = 'on';
			mask_visibilities{Pin9_PuPd_idx} = 'on';
            mask_enable{Pin9_Set_idx} = 'off';
			mask_visibilities{Pin9_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin9_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin9_Type_idx} = 'on';
			mask_visibilities{Pin9_Type_idx} = 'on';
            mask_enable{Pin9_AF_idx} = 'off';
			mask_visibilities{Pin9_AF_idx} = 'off';			
            mask_enable{Pin9_PuPd_idx} = 'off';
			mask_visibilities{Pin9_PuPd_idx} = 'off';
            mask_enable{Pin9_Set_idx} = 'on';
			mask_visibilities{Pin9_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin9_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin9_Type_idx} = 'off';
			mask_visibilities{Pin9_Type_idx} = 'off';
            mask_enable{Pin9_AF_idx} = 'on';
			mask_visibilities{Pin9_AF_idx} = 'on';			
            mask_enable{Pin9_PuPd_idx} = 'off';
			mask_visibilities{Pin9_PuPd_idx} = 'off';
            mask_enable{Pin9_Set_idx} = 'off';
			mask_visibilities{Pin9_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin9_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin9_Type_idx} = 'off';
			mask_visibilities{Pin9_Type_idx} = 'off';
            mask_enable{Pin9_AF_idx} = 'off';
			mask_visibilities{Pin9_AF_idx} = 'off';			
            mask_enable{Pin9_PuPd_idx} = 'off';
			mask_visibilities{Pin9_PuPd_idx} = 'off';
            mask_enable{Pin9_Set_idx} = 'off';
			mask_visibilities{Pin9_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode10'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin10_Use'),'on')
        if isequal(get_param(gcbh,'Pin10_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin10_Type_idx} = 'off';
			mask_visibilities{Pin10_Type_idx} = 'off';
            mask_enable{Pin10_AF_idx} = 'off';
			mask_visibilities{Pin10_AF_idx} = 'off';			
            mask_enable{Pin10_PuPd_idx} = 'on';
			mask_visibilities{Pin10_PuPd_idx} = 'on';
            mask_enable{Pin10_Set_idx} = 'off';
			mask_visibilities{Pin10_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin10_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin10_Type_idx} = 'on';
			mask_visibilities{Pin10_Type_idx} = 'on';
            mask_enable{Pin10_AF_idx} = 'off';
			mask_visibilities{Pin10_AF_idx} = 'off';			
            mask_enable{Pin10_PuPd_idx} = 'off';
			mask_visibilities{Pin10_PuPd_idx} = 'off';
            mask_enable{Pin10_Set_idx} = 'on';
			mask_visibilities{Pin10_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin10_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin10_Type_idx} = 'off';
			mask_visibilities{Pin10_Type_idx} = 'off';
            mask_enable{Pin10_AF_idx} = 'on';
			mask_visibilities{Pin10_AF_idx} = 'on';			
            mask_enable{Pin10_PuPd_idx} = 'off';
			mask_visibilities{Pin10_PuPd_idx} = 'off';
            mask_enable{Pin10_Set_idx} = 'off';
			mask_visibilities{Pin10_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin10_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin10_Type_idx} = 'off';
			mask_visibilities{Pin10_Type_idx} = 'off';
            mask_enable{Pin10_AF_idx} = 'off';
			mask_visibilities{Pin10_AF_idx} = 'off';			
            mask_enable{Pin10_PuPd_idx} = 'off';
			mask_visibilities{Pin10_PuPd_idx} = 'off';
            mask_enable{Pin10_Set_idx} = 'off';
			mask_visibilities{Pin10_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode11'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin11_Use'),'on')
        if isequal(get_param(gcbh,'Pin11_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin11_Type_idx} = 'off';
			mask_visibilities{Pin11_Type_idx} = 'off';
            mask_enable{Pin11_AF_idx} = 'off';
			mask_visibilities{Pin11_AF_idx} = 'off';			
            mask_enable{Pin11_PuPd_idx} = 'on';
			mask_visibilities{Pin11_PuPd_idx} = 'on';
            mask_enable{Pin11_Set_idx} = 'off';
			mask_visibilities{Pin11_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin11_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin11_Type_idx} = 'on';
			mask_visibilities{Pin11_Type_idx} = 'on';
            mask_enable{Pin11_AF_idx} = 'off';
			mask_visibilities{Pin11_AF_idx} = 'off';			
            mask_enable{Pin11_PuPd_idx} = 'off';
			mask_visibilities{Pin11_PuPd_idx} = 'off';
            mask_enable{Pin11_Set_idx} = 'on';
			mask_visibilities{Pin11_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin11_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin11_Type_idx} = 'off';
			mask_visibilities{Pin11_Type_idx} = 'off';
            mask_enable{Pin11_AF_idx} = 'on';
			mask_visibilities{Pin11_AF_idx} = 'on';			
            mask_enable{Pin11_PuPd_idx} = 'off';
			mask_visibilities{Pin11_PuPd_idx} = 'off';
            mask_enable{Pin11_Set_idx} = 'off';
			mask_visibilities{Pin11_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin11_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin11_Type_idx} = 'off';
			mask_visibilities{Pin11_Type_idx} = 'off';
            mask_enable{Pin11_AF_idx} = 'off';
			mask_visibilities{Pin11_AF_idx} = 'off';			
            mask_enable{Pin11_PuPd_idx} = 'off';
			mask_visibilities{Pin11_PuPd_idx} = 'off';
            mask_enable{Pin11_Set_idx} = 'off';
			mask_visibilities{Pin11_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode12'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin12_Use'),'on')
        if isequal(get_param(gcbh,'Pin12_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin12_Type_idx} = 'off';
			mask_visibilities{Pin12_Type_idx} = 'off';
            mask_enable{Pin12_AF_idx} = 'off';
			mask_visibilities{Pin12_AF_idx} = 'off';			
            mask_enable{Pin12_PuPd_idx} = 'on';
			mask_visibilities{Pin12_PuPd_idx} = 'on';
            mask_enable{Pin12_Set_idx} = 'off';
			mask_visibilities{Pin12_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin12_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin12_Type_idx} = 'on';
			mask_visibilities{Pin12_Type_idx} = 'on';
            mask_enable{Pin12_AF_idx} = 'off';
			mask_visibilities{Pin12_AF_idx} = 'off';			
            mask_enable{Pin12_PuPd_idx} = 'off';
			mask_visibilities{Pin12_PuPd_idx} = 'off';
            mask_enable{Pin12_Set_idx} = 'on';
			mask_visibilities{Pin12_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin12_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin12_Type_idx} = 'off';
			mask_visibilities{Pin12_Type_idx} = 'off';
            mask_enable{Pin12_AF_idx} = 'on';
			mask_visibilities{Pin12_AF_idx} = 'on';			
            mask_enable{Pin12_PuPd_idx} = 'off';
			mask_visibilities{Pin12_PuPd_idx} = 'off';
            mask_enable{Pin12_Set_idx} = 'off';
			mask_visibilities{Pin12_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin12_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin12_Type_idx} = 'off';
			mask_visibilities{Pin12_Type_idx} = 'off';
            mask_enable{Pin12_AF_idx} = 'off';
			mask_visibilities{Pin12_AF_idx} = 'off';			
            mask_enable{Pin12_PuPd_idx} = 'off';
			mask_visibilities{Pin12_PuPd_idx} = 'off';
            mask_enable{Pin12_Set_idx} = 'off';
			mask_visibilities{Pin12_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode13'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin13_Use'),'on')
        if isequal(get_param(gcbh,'Pin13_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin13_Type_idx} = 'off';
			mask_visibilities{Pin13_Type_idx} = 'off';
            mask_enable{Pin13_AF_idx} = 'off';
			mask_visibilities{Pin13_AF_idx} = 'off';			
            mask_enable{Pin13_PuPd_idx} = 'on';
			mask_visibilities{Pin13_PuPd_idx} = 'on';
            mask_enable{Pin13_Set_idx} = 'off';
			mask_visibilities{Pin13_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin13_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin13_Type_idx} = 'on';
			mask_visibilities{Pin13_Type_idx} = 'on';
            mask_enable{Pin13_AF_idx} = 'off';
			mask_visibilities{Pin13_AF_idx} = 'off';			
            mask_enable{Pin13_PuPd_idx} = 'off';
			mask_visibilities{Pin13_PuPd_idx} = 'off';
            mask_enable{Pin13_Set_idx} = 'on';
			mask_visibilities{Pin13_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin13_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin13_Type_idx} = 'off';
			mask_visibilities{Pin13_Type_idx} = 'off';
            mask_enable{Pin13_AF_idx} = 'on';
			mask_visibilities{Pin13_AF_idx} = 'on';			
            mask_enable{Pin13_PuPd_idx} = 'off';
			mask_visibilities{Pin13_PuPd_idx} = 'off';
            mask_enable{Pin13_Set_idx} = 'off';
			mask_visibilities{Pin13_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin13_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin13_Type_idx} = 'off';
			mask_visibilities{Pin13_Type_idx} = 'off';
            mask_enable{Pin13_AF_idx} = 'off';
			mask_visibilities{Pin13_AF_idx} = 'off';			
            mask_enable{Pin13_PuPd_idx} = 'off';
			mask_visibilities{Pin13_PuPd_idx} = 'off';
            mask_enable{Pin13_Set_idx} = 'off';
			mask_visibilities{Pin13_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode14'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin14_Use'),'on')
        if isequal(get_param(gcbh,'Pin14_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin14_Type_idx} = 'off';
			mask_visibilities{Pin14_Type_idx} = 'off';
            mask_enable{Pin14_AF_idx} = 'off';
			mask_visibilities{Pin14_AF_idx} = 'off';			
            mask_enable{Pin14_PuPd_idx} = 'on';
			mask_visibilities{Pin14_PuPd_idx} = 'on';
            mask_enable{Pin14_Set_idx} = 'off';
			mask_visibilities{Pin14_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin14_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin14_Type_idx} = 'on';
			mask_visibilities{Pin14_Type_idx} = 'on';
            mask_enable{Pin14_AF_idx} = 'off';
			mask_visibilities{Pin14_AF_idx} = 'off';			
            mask_enable{Pin14_PuPd_idx} = 'off';
			mask_visibilities{Pin14_PuPd_idx} = 'off';
            mask_enable{Pin14_Set_idx} = 'on';
			mask_visibilities{Pin14_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin14_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin14_Type_idx} = 'off';
			mask_visibilities{Pin14_Type_idx} = 'off';
            mask_enable{Pin14_AF_idx} = 'on';
			mask_visibilities{Pin14_AF_idx} = 'on';			
            mask_enable{Pin14_PuPd_idx} = 'off';
			mask_visibilities{Pin14_PuPd_idx} = 'off';
            mask_enable{Pin14_Set_idx} = 'off';
			mask_visibilities{Pin14_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin14_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin14_Type_idx} = 'off';
			mask_visibilities{Pin14_Type_idx} = 'off';
            mask_enable{Pin14_AF_idx} = 'off';
			mask_visibilities{Pin14_AF_idx} = 'off';			
            mask_enable{Pin14_PuPd_idx} = 'off';
			mask_visibilities{Pin14_PuPd_idx} = 'off';
            mask_enable{Pin14_Set_idx} = 'off';
			mask_visibilities{Pin14_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
    case 'mode15'
        mask_enable = get_param(gcbh,'MaskEnables');
        mask_visibilities = get_param(gcbh,'MaskVisibilities');
        if isequal(get_param(gcbh,'Pin15_Use'),'on')
        if isequal(get_param(gcbh,'Pin15_Mode'),'GPIO_Mode_IN')
            mask_enable{Pin15_Type_idx} = 'off';
			mask_visibilities{Pin15_Type_idx} = 'off';
            mask_enable{Pin15_AF_idx} = 'off';
			mask_visibilities{Pin15_AF_idx} = 'off';			
            mask_enable{Pin15_PuPd_idx} = 'on';
			mask_visibilities{Pin15_PuPd_idx} = 'on';
            mask_enable{Pin15_Set_idx} = 'off';
			mask_visibilities{Pin15_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin15_Mode'),'GPIO_Mode_OUT')
            mask_enable{Pin15_Type_idx} = 'on';
			mask_visibilities{Pin15_Type_idx} = 'on';
            mask_enable{Pin15_AF_idx} = 'off';
			mask_visibilities{Pin15_AF_idx} = 'off';			
            mask_enable{Pin15_PuPd_idx} = 'off';
			mask_visibilities{Pin15_PuPd_idx} = 'off';
            mask_enable{Pin15_Set_idx} = 'on';
			mask_visibilities{Pin15_Set_idx} = 'on';			
        elseif isequal(get_param(gcbh,'Pin15_Mode'),'GPIO_Mode_AF')
            mask_enable{Pin15_Type_idx} = 'off';
			mask_visibilities{Pin15_Type_idx} = 'off';
            mask_enable{Pin15_AF_idx} = 'on';
			mask_visibilities{Pin15_AF_idx} = 'on';			
            mask_enable{Pin15_PuPd_idx} = 'off';
			mask_visibilities{Pin15_PuPd_idx} = 'off';
            mask_enable{Pin15_Set_idx} = 'off';
			mask_visibilities{Pin15_Set_idx} = 'off';			
        elseif isequal(get_param(gcbh,'Pin15_Mode'),'GPIO_Mode_AN')
            mask_enable{Pin15_Type_idx} = 'off';
			mask_visibilities{Pin15_Type_idx} = 'off';
            mask_enable{Pin15_AF_idx} = 'off';
			mask_visibilities{Pin15_AF_idx} = 'off';			
            mask_enable{Pin15_PuPd_idx} = 'off';
			mask_visibilities{Pin15_PuPd_idx} = 'off';
            mask_enable{Pin15_Set_idx} = 'off';
			mask_visibilities{Pin15_Set_idx} = 'off';			
        end
        end
        set_param (gcbh,'MaskVisibilities', mask_visibilities);
        set_param (gcbh,'MaskEnables', mask_enable);
      
end
