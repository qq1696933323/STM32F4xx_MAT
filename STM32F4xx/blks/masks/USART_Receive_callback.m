function USART_Receive_callback(action)
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
%	mask_visibilities{i} = 'on';
%end;
%set_param (gcbh,'MaskVisibilities', mask_visibilities);

switch action
    
    case 'softint'
		mask_visibilities = get_param(gcbh,'MaskVisibilities');
		if isequal(get_param(gcbh,'Soft_it'),'on')  
			mask_visibilities{Soft_num_idx} = 'on';	
        else 
			mask_visibilities{Soft_num_idx} = 'off';		
		end          
		set_param (gcbh,'MaskVisibilities', mask_visibilities);
		
end


