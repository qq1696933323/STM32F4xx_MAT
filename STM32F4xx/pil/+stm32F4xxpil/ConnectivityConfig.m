classdef ConnectivityConfig < rtw.connectivity.Config
%CONNECTIVITYCONFIG configuration class for STMicroelectronics stm32F4xx
%
%   CONNECTIVITYCONFIG(COMPONENTARGS) creates instances of MAKEFILEBUILDER,
%   LAUNCHER, RTIOSTREAMHOSTCOMMUNICATOR and collects them together into a
%   connectivity configuration class for PIL.
%
%   This PIL uses serial port communication.
%    
%   Copyright 2011 The MathWorks, Inc.
    
    methods
        % Constructor
        function this = ConnectivityConfig(componentArgs)
            
            % An executable framework specifies additional source files and
            % libraries required for building the PIL executable
            targetApplicationFramework = ...
                stm32F4xxpil.TargetApplicationFramework(componentArgs);
            
            % Filename extension for executable on the target system 
            modelName = componentArgs.getComponentCodeName;
            if (strcmp(get_param(modelName,'ToolChain'),'ATOLLIC')) 
                exeExtension = '.elf';
            elseif (strcmp(get_param(modelName,'ToolChain'),'IAR')) 
                exeExtension = '.out';
            else
                exeExtension = '.axf';
            end
            
            % Create an instance of MakefileBuilder; this works in
            % conjunction with your template makefile to build the PIL
            % executable
            builder = rtw.connectivity.MakefileBuilder(componentArgs, ...
                targetApplicationFramework, ...
                exeExtension);
            
            % Launcher
            launcher = stm32F4xxpil.Launcher(componentArgs, builder);

            % Host side rtiostream communication
            hostCommunicator = rtw.connectivity.RtIOStreamHostCommunicator(...
                componentArgs, ...
                launcher, ...
                'rtiostreamserial.dll');
            
            % For some targets it may be necessary to set a timeout value
            % for initial setup of the communications channel. For example,
            % the target processor may take a few seconds before it is
            % ready to open its side of the communications channel. If a
            % non-zero timeout value is set then the communicator will
            % repeatedly try to open the communications channel until the
            % timeout value is reached.
            hostCommunicator.setInitCommsTimeout(15); 
            
            % Configure a timeout period for reading of data by the host 
            % from the target. If no data is received with the specified 
            % period an error will be thrown.
            hostCommunicator.setTimeoutRecvSecs(10);
                       
            % COMPort  = 'COM1';
            % COMPort is a preference of STM32F4xx group
            COMPort = getpref('STM32F4xx','COMPort');
            BaudRate = 115200;
			disp(['### rtIOStream Port: ''' COMPort]);
            disp('### Use setpref of STM32F4xx group if you want to change it.');
            disp('### Communication parameters is: 115200bds, 8b, 1s, no parity, no Hw control.');            
            % Set serial host port settings
            rtIOStreamOpenArgs = {...
                '-baud', num2str(BaudRate), ...
                '-port', COMPort, ...
                }; 
            
            hostCommunicator.setOpenRtIOStreamArgList(...              
                rtIOStreamOpenArgs);                                                                                           
                                               
            % Call super class constructor to register components
            this@rtw.connectivity.Config(componentArgs,...
                                         builder,...
                                         launcher,...
                                         hostCommunicator);
               
            % Register hardware configuration
            %Not mandatory for STM32F4xx (8bit char)
            %RPmodif extendedHWConfig = stm32F4xxpil.ExtendedHardwareConfig;
            %RPmodif this.setExtendedHardwareConfig(extendedHWConfig);  
            
            % Register timer functions
            timer = stm32F4xxpil.Timer;
            this.setTimer(timer);
                                     
        end
    end
end

