function autopath_callback(hDlg, hSrc, paramName)
%Callback for Get ToolPath automatically modification.
%used to enable or not compiler path
	
	if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'on')) 
		getpath_callback(hDlg, hSrc, 'ToolChain');
		slConfigUISetEnabled(hDlg, hSrc, 'CompilerPath', false);
	else
 		slConfigUISetEnabled(hDlg, hSrc, 'CompilerPath', true);
	end
end
