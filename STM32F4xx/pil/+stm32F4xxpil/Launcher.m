classdef Launcher < rtw.connectivity.Launcher
%LAUNCHER class for launching STM32F4xx PIL application
%
%   LAUNCHER(COMPONENTARGS,BUILDER) instantiates a LAUNCHER object that you can
%   use to control starting and stopping of an application on the target
%   processor. In this case the Debug Server Scripting (dss) utility which 
%   ships with EmbeddedCoder is used to download and 
%   run the executable.
%
%   See also RTW.CONNECTIVITY.LAUNCHER, RTWDEMO_CUSTOM_PIL
    
%   Copyright 2011 The MathWorks, Inc.
   
%% Class properties
    properties
    
       % For the host-based example, additional arguments
       % may be provided when the executable is launched
       % as a separate process on the host. 
       ArgString = '';
       
       % Keep track of the process ID of the executable
       % so that this process can be killed when no longer
       % required
       ExePid = '';
                   
       % Keep track a temporary file created by the
       % process launcher so that it can be deleted when
       % the process is terminated
       TempFile = '';   
       
       %Keep starting path
     %  Path = '';
       
    end

%% Class methods    
    methods
        % constructor
        function this = Launcher(componentArgs, builder)
            error(nargchk(2, 2, nargin, 'struct'));
            % call super class constructor
            this@rtw.connectivity.Launcher(componentArgs, builder);
        end
        
        % destructor
        function delete(this) %#ok
            
            % This method is called when an instance of this class is cleared from memory,
            % e.g. when the associated Simulink model is closed. You can use
            % this destructor method to close down any processes, e.g. an IDE or
            % debugger that was originally started by this class. If the
            % stopApplication method already performs this housekeeping at the
            % end of each on-target simulation run then it is not necessary to
            % insert any code in this destructor method. However, if the IDE or
            % debugger may be left open between successive on-target simulation
            % runs then it is recommended to insert code here to terminate that
            % application.
                
        end                    
        
        % Start the application
        function startApplication(this)
        %Get current repository (should be CodeGeneration)
        currentPath = pwd;            
        % get name of the executable file to download
        exe = this.getBuilder.getApplicationExecutable;
        disp(['### Downloading application...' exe]);
        modelName = this.getComponentArgs.getComponentCodeName;
        modelPilPath = this.getComponentArgs.getApplicationCodePath;        
		toolChainSelection = get_param(modelName,'ToolChain');
		toolPath = updatePrefs('get','stm32f4ToolPath');
		Stm32RootPath = updatePrefs('get','stm32f4RootPath');    
		if(isempty(Stm32RootPath))
			h = errordlg('Add STM32F4xx repository to Matlab default path!','STM32F4xx');	    
			close(h);
			clear h
        end
        
        %Keep current directory
     %   this.Path = pwd;
       
        switch toolChainSelection
            % IAR (Ewarm) toolchain
            case 'IAR'
			    probeName = get_param(modelName,'Dongle');
				bootMode = get_param(modelName,'flashRam');
                switch probeName
					case 'J-Link'
						str_dgl = ' --jlink_interface=SWD --jlink_speed=auto --jlink_initial_speed=32 --jlink_reset_strategy=0,3 --jlink_exec_commmand=monitor reg r13 = (0x20000000); monitor reg pc = (0x20000004); break main; continue';
						str_mac = [' --macro "',[Stm32RootPath,'\script\\',bootMode,'_UserResetMacro.mac"']];					
						toolDll = fullfile(toolPath, 'armjlink.dll');
					case 'STLinkV2'
						str_dgl = ' --stlink_interface=SWD --stlink_reset_strategy=0,0 ';
						str_mac = ' ';							
						toolDll = fullfile(toolPath, 'armstlink.dll');
					otherwise
						error('Not supported Dongle!');                           
                 end					
				 target = get_param(modelName,'stm32Target');
				 %RPModif armProcDll = fullfile(toolPath, 'armproc.dll');
				 plugInDll = fullfile(toolPath, 'armbat.dll');
				 %RPModif flashLoadpath = fullfile(toolPath, '..', 'config','flashloader','ST');
				 ddf = fullfile(toolPath, '..', 'config','debugger','ST');
				 %Set toolPath to IDE path
				 toolPath = fullfile(toolPath, '..','..', 'common','bin');
                 str = fullfile(toolPath,'IarIdePm.exe');
                 %Command string to start IDE
                 commandString = sprintf('%s', str);

                 %Build the argument string
                 str = [' --DBG ARM "', toolDll,'" ',modelPilPath,'\',modelName,'.out '];
				 str1 = [[' --plugin "' , plugInDll, '" --backend '],...
				 	'--endian=little --cpu=Cortex-M3 --fpu=None -p "',...
				 	[ddf,'\io',target,'.ddf"' ],...
				 	[' --semihosting --drv_communication=USB0 ',' --device=',target]];
                     
				 %argument string for IDE toolchain command
				 argString = strcat(str,str_mac,str1,str_dgl);

                 %Clear variables
                 clear probeName str_dgl str_mac toolDll target armProcDll plugInDll flashLoadpath ddf bootMode
			
            % KEIL (µVision) toolchain
            case 'KEIL'
				 probeName = get_param(modelName,'Dongle');
				 keil_MCUConf = [Stm32RootPath,'\toolchain\Keil\Keil_Prj_',probeName,'.uvproj'];
				 keil_FlashConf = [Stm32RootPath,'\toolchain\Keil\Keil_Prj_',probeName,'.uvopt'];
				 keil_Settings = [Stm32RootPath,'\toolchain\Keil\',probeName,'_Settings.ini'];

                 %Add buildDirectory to the path.
                 infoBuild = RTW.getBuildDir(modelName);
                 pathBuild =  textscan(infoBuild.ModelRefRelativeBuildDir,'%s','delimiter','\\');
                 origin = pathBuild{1}(1);
                 path2Add = fullfile(infoBuild.CodeGenFolder, origin);
                 addpath(genpath(path2Add{1}),'-begin');
                 
                 %Get generated model.elf file path 
                 hexGeneratedFile = [modelName,'.axf'];
                 hexGeneratedFilePath = which (hexGeneratedFile);
                 [pathstr, name, ext] = fileparts(hexGeneratedFilePath);
                 %CD to pil directory
                 cd(pathstr);
                 cd ..
                 %Copy keil template to prg/debug                  
				 disp(['Keil_MCUConf:',keil_MCUConf ]);
				 copyfile(keil_MCUConf,'Keil_Prj.uvproj','f');		                 
				 disp(['Keil_FlashConf:',keil_FlashConf ]);
				 copyfile(keil_FlashConf,'Keil_Prj.uvopt','f');		
				 disp(['Keil_Settings:',keil_Settings ]);
				 copyfile(keil_Settings,'Keil_Settings.ini','f');		
                 copyfile(hexGeneratedFilePath,'Keil_Prj.axf','f');                 
                 pause(1);
				 clear probeName
                  
                 %Command string to start IDE
 				 toolPath = fullfile(toolPath,'..','UV4');
                 str = fullfile(toolPath,'Uv4.exe');
                 %Command string to start IDE
                 commandString = sprintf('%s', str);
                 str = '-d Keil_Prj.uvproj';
  				 argString = sprintf('%s', str);                 
                
            % Atollic (TrueStudio) toolchain
			case 'ATOLLIC'
				 probeName = get_param(modelName,'Dongle');
				 bootMode = get_param(modelName,'flashRam');
				 atollic_PRJ = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\Atollic_Prj'];
				 atollic_DATA = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\.metadata'];
				 atollic_MCUConf = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\launch\',bootMode,'_',probeName];

                 %Add buildDirectory to the path.
                 infoBuild = RTW.getBuildDir(modelName);
                 pathBuild =  textscan(infoBuild.ModelRefRelativeBuildDir,'%s','delimiter','\\');
                 origin = pathBuild{1}(1);
                 path2Add = fullfile(infoBuild.CodeGenFolder, origin);
                 addpath(genpath(path2Add{1}),'-begin');
                 
                 %Get generated model.elf file path 
                 elfGeneratedFile = [modelName,'.elf'];
                 elfGeneratedFilePath = which (elfGeneratedFile);
                 [pathstr, name, ext] = fileparts(elfGeneratedFilePath);
                 %CD to pil directory
                 cd(pathstr);
                 cd ..
                 %Copy Atollic template to prg/debug                  
				 copyfile(atollic_PRJ,'Atollic_Prj','f');
				 copyfile(atollic_DATA,'.metadata','f');
				 disp(['atollic_MCUConf:',atollic_MCUConf ]);
				 copyfile(atollic_MCUConf,'Atollic_Prj\Atollic_Prj.elf.launch','f');					
				 copyfile(elfGeneratedFilePath,'Atollic_Prj\Atollic_Prj.elf','f');
                 pause(1);
				 clear atollic_PRJ atollic_DATA probeName bootMode
				 %Command string to start IDE
 				 toolPath = fullfile(toolPath,'ide');
                 str = fullfile(toolPath,'TrueSTUDIO.exe');
                 %Command string to start IDE
                 commandString = sprintf('%s', str);
                 str = ' -data .';
  				 argString = sprintf('%s', str);                 
        end
        
        %Set the argstring of process to launch
        this.ArgString = argString;
		clear Stm32RootPath toolChainSelection toolPath  argString          

        %RPModif programFile = exe;            
        disp(['Launcher command string:    ' commandString]);
        disp(['Launcher command arguments: ' this.ArgString]);
        
        %Launch process to download and run the embedded application
        [this.ExePid, this.TempFile] = ...
            rtw.connectivity.Utils.launchProcess(...
            commandString, ...
            this.ArgString);
                
        %Pause until IDE has started and application has been program
		scrsz = get(0,'ScreenSize');
		fig1=figure('Name','PIL start','Position',[scrsz(1)+scrsz(3)/3 scrsz(2)+scrsz(4)/3 scrsz(3)/3 scrsz(4)/3]);
        bckColor = get(gcf,'Color');
		h1 = uicontrol('Position',[scrsz(3)/10 20 200 40],'String','Continue',...
              'Callback','uiresume(gcbf)');
		h2 = uicontrol('Style','text','FontWeight','bold',...
        'Position',[scrsz(3)/10 2*scrsz(4)/10 200 40],...
        'String','Please wait for application and press Continue to start PIL.');  		
        set(h2,'BackgroundColor',bckColor);
		uiwait(gcf); 
        pause(1);
        close(fig1);
        pause(1);
        %Go back to current path
        cd(currentPath);
        clear currentPath bckColor h1 h2 fig1;
        
        % Verify that process launched properly
        if ~rtw.connectivity.Utils.isAlive(this.ExePid)
            disp('')
            disp(['Process is not alive, displaying contents '...
                'of log file:'])
            disp('')
            type(this.TempFile)
            disp('')
            error(['Failed to start process with PID = '...
                num2str(this.ExePid) ' using arguments '...
                this.ArgString '. '])
        end
            disp(['Started new process, pid = ' ...
                int2str(this.ExePid) ])            
        end
        
        % Stop the application
        function stopApplication(this)        
            % Kill the process that launched the embedded application
           if ~isempty(this.ExePid)
               %RPMODIF to kill process that Atollic launched
               child = psUtils('winchildren', this.ExePid);
               if (isempty(child))
                  rtw.connectivity.Utils.killProcess(this.ExePid, ...
                                                    this.TempFile);
               else
                 % Kill child process
                 psUtils('kill',child(end));
                 pause(1);
                 % kill IAR or Atollic process
                 rtw.connectivity.Utils.killProcess(this.ExePid, ...
                                                    this.TempFile);
               end                 
               disp(['Terminated process, pid = ' int2str(this.ExePid)]);
           end
           this.ExePid = '';
           this.ArgString = '';  
          % cd(this.Path);
          % this.Path = '';         
        end
        
    end
end
