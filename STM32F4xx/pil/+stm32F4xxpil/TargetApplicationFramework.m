classdef TargetApplicationFramework < rtw.pil.RtIOStreamApplicationFramework
%TARGETAPPLICATIONFRAMEWORK creates application framework for stm32F4xx PIL
%
%   The TARGETAPPLICATIONFRAMEWORK allows you to specify additional files needed
%   to build an application for the target environment. These files may include
%   code for hardware initialization as well as device driver code for a
%   communications channel. 
%
%   See also RTW.PIL.RTIOSTREAMAPPLICATIONFRAMEWORK, RTWDEMO_CUSTOM_PIL
 
%   Copyright 2011 The MathWorks, Inc.
    
    methods
        % constructor
        function this = TargetApplicationFramework(componentArgs)
            error(nargchk(1, 1, nargin, 'struct'));
            % call super class constructor
            this@rtw.pil.RtIOStreamApplicationFramework(componentArgs);
            
            % To build the PIL application you must specify a main.c file.       
            % The following PIL main.c files are provided and can be             
            % added to the application framework via the "addPILMain"                
            % method:                                                            
            %                                                                    
            % 1) A main.c adapted for on-target PIL and suitable                 
            %    for most PIL implementations. Select by specifying              
            %    'target' argument to "addPILMain" method.                       
            %                                                                    
            % 2) A main.c adapted for host-based PIL such as the                 
            %    "mypil" host example. Select by specifying 'host'               
            %    argument to "addPILMain" method.                                
            %this.addPILMain('host');                                             
            %this.addPILMain('target');
                                                                                
            % Additional source and library files to include in the build        
            % must be added to the BuildInfo property                            
                                                                                 
            % Get the BuildInfo object to update                                 
            buildInfo = this.getBuildInfo;

            % Add USART driver files to implement the target-side of the
            % host-target rtIOStream communications channel            
            libSrcPath = getpref('STM32F4xx','stm32f4LibSrcPath');
            libIncPath = getpref('STM32F4xx','stm32f4LibIncPath');
            buildInfo.addIncludePaths(libIncPath);			
            buildInfo.addSourcePaths(libSrcPath);                      
            %STM32 RTIOStream is USART : Add usart driver and GPIO driver
            %Clock configuration is mandatory : Add RCC_config file           
            buildInfo.addSourceFiles('stm32f4xx_usart.c',libSrcPath);
            %RPMODIF buildInfo.addSourceFiles('stm32f4xx_gpio.c',libSrcPath);
            %RPMODIF buildInfo.addSourceFiles('stm32f4xx_rcc.c',libSrcPath);        

            %% Include path
            stm32f4RootPath = getpref('STM32F4xx','stm32f4RootPath');
            rtiostream_src_path = fullfile(stm32f4RootPath,'pil','stm32F4xxSerialRtiostream');
            buildInfo.addIncludePaths(rtiostream_src_path);
            buildInfo.addSourcePaths(rtiostream_src_path);                      
            buildInfo.addSourceFiles('STM32F4xxSerialRtiostream-Rtiostream.c',rtiostream_src_path);
            buildInfo.addSourceFiles('STM32F4xxSerialRtiostream-ProfilerTimer.c',rtiostream_src_path);
            
            %% Get target USART to use for PIL.
            scrsz = get(0,'ScreenSize');
            global usartSelection ;
            usartSelection = 'USART3:PC11/PC10';
            figPos = [scrsz(1)+scrsz(3)/3 scrsz(2)+scrsz(4)/3 scrsz(3)/3 scrsz(4)/3];
            textPos = [scrsz(3)/10 scrsz(4)/10 200 40];
            fig1=figure('Name','PIL Target USART selection','Position',figPos);
            bckColor = get(gcf,'Color');
            h2 = uicontrol('Style','text',...
                'Position',[scrsz(3)/10 5*scrsz(4)/20 200 40],'FontWeight','bold',...
                'String','Select PIL target USART parameters and press continue.');  
            set(h2,'BackgroundColor',bckColor);
            h1 = uicontrol('Style','popupmenu',...
                'String',{'USART1:PA10/PA9','USART1:PB7/PB6','USART2:PA3/PA2','USART2:PD6/PD5','USART3:PC11/PC10','USART3:PB11/PB10','USART3:PD9/PD8','UART4:PC11/PC10','UART4:PA1/PA0','UART5:PD2/PC12','USART6:PC7/PC6','USART6:PG9/PG14'},...
                'Value',5,'Position',[scrsz(3)/10 (3*scrsz(4)/20)+20 200 40],'Callback',@getusart_callback);            
            h11 = uicontrol('Style','text','FontWeight','bold',...
                'Position',[(scrsz(3)/10)-70 (3*scrsz(4)/20)+40 70 20],...
                'String','USART');  
             set(h11,'BackgroundColor',bckColor);
%            h4 = uicontrol('Style','popupmenu',...
%                'String',{'512','1024','1536','2048','2560','3072','3584','4096','5120','6144','7168','8192','16384','24576','32768','36864'},...
%                'Value',1,'Position',[scrsz(3)/10 2*scrsz(4)/20 200 40],'Callback',@getbuffer_callback);            

            h4 = uicontrol('Style','edit','String','512',...
                'Position',[scrsz(3)/10 (2*scrsz(4)/20)+20 200 20]);            
            
            h41 = uicontrol('Style','text','FontWeight','bold',...
                'Position',[(scrsz(3)/10)-70 (2*scrsz(4)/20)+20 70 28],...
                'String','Rcv Buffer Size (bytes)');  
            set(h41,'BackgroundColor',bckColor);
            
            h3 = uicontrol('Position',[scrsz(3)/10 20 200 40],'String','Continue',...
                'Callback','uiresume(gcbf)');
            uiwait(gcf); 
            bufferSize = get(h4, 'String');            
            close(fig1);
            pause(1);                                        
             clear fig1 h1 h2 h3 h4 h11 h41 bckColor
            rtiostreamConfigFile = fullfile(rtiostream_src_path,'STM32F4xxSerialRtiostream_Config.h');
            fid = fopen(rtiostreamConfigFile,'w');
            modelName = this.getComponentArgs.getComponentCodeName;    
            usartName = 'USART3';
            fprintf(fid,'/*\n * File: STM32F4xxSerialRtiostream_Config.h\n *\n * Code generated for Simulink model :%s\n *\n',modelName);
            fprintf(fid,' * PIL USART File configuration\n *\n *\n *\n * * ******************************************************************************\n');
            fprintf(fid,'* * attention\n');
            fprintf(fid,'* *\n');
            fprintf(fid,'* * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS\n');
            fprintf(fid,'* * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE\n');
            fprintf(fid,'* * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY\n');
            fprintf(fid,'* * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING\n');
            fprintf(fid,'* * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE\n');
            fprintf(fid,'* * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.\n');
            fprintf(fid,'* *\n');
            fprintf(fid,'* ******************************************************************************\n*/\n\n');
            fprintf(fid,'#ifndef RTW_HEADER_STM32F4xxSerialRtiostream_Config_h_\n');
            fprintf(fid,'#define RTW_HEADER_STM32F4xxSerialRtiostream_Config_h_\n');
            usartDelim = regexp(usartSelection, ':', 'split');
            usartName = cell2mat(usartDelim(1,1));
            portDelim = regexp(cell2mat(usartDelim(1,2)), '/', 'split');
            rx = cell2mat(portDelim(1,1));
            tx = cell2mat(portDelim(1,2));
            rxPort = rx(2);
            txPort = tx(2);
            rxNum = rx(3:end);
            txNum = tx(3:end);
            fprintf(fid,'#define PIL_USART_NAME\t %s\n',usartName);
            fprintf(fid,'#define PIL_USART_PIN_RX\tGPIO_Pin_%s\n',rxNum);
            fprintf(fid,'#define PIL_USART_PIN_TX\tGPIO_Pin_%s\n',txNum);
            fprintf(fid,'#define PIL_USART_PORT_RX\tGPIO%s\n',rxPort);
            fprintf(fid,'#define PIL_USART_PORT_TX\tGPIO%s\n\n',txPort);                 
            fprintf(fid,'#define USARTx_IRQn\t %s_IRQn\n\n',usartName);                 
            fprintf(fid,'#define USARTx_IRQHandler\t %s_IRQHandler\n\n',usartName);   
            fprintf(fid,'#define USART_RCV_BUFF_SIZE\t %s\n\n',bufferSize);               
            fprintf(fid,'/* Enable usart peripheral clocks */\n');
			if(strcmp(usartName,'USART1')||strcmp(usartName,'USART6'))				
			fprintf(fid,'#define RCC_USART_ClockCmd() RCC_APB2PeriphClockCmd(RCC_APB2Periph_%s, ENABLE)\n',usartName);
            else
			fprintf(fid,'#define RCC_USART_ClockCmd() RCC_APB1PeriphClockCmd(RCC_APB1Periph_%s, ENABLE)\n',usartName);
            end
 			fprintf(fid,'\n/* Enable GPIO clocks */\n');
            if(strcmp(usartName,'UART5'))
			fprintf(fid,'#define	RCC_GPIORx_ClockCmd() RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIO%s, ENABLE)\n',rxPort);
			fprintf(fid,'#define	RCC_GPIOTx_ClockCmd() RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIO%s, ENABLE)\n',txPort);
            else
			fprintf(fid,'#define	RCC_GPIORx_ClockCmd() RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIO%s, ENABLE)\n',rxPort);
			fprintf(fid,'#define	RCC_GPIOTx_ClockCmd()\n'); 
            end
            fprintf(fid,'\n/* Configure AFIO Alternate fonction */\n');
            fprintf(fid,'#define GPIORx_PinAFConfig() GPIO_PinAFConfig(GPIO%s, GPIO_PinSource%s, GPIO_AF_%s)\n',rxPort,rxNum,usartName);
            fprintf(fid,'#define GPIOTx_PinAFConfig() GPIO_PinAFConfig(GPIO%s, GPIO_PinSource%s, GPIO_AF_%s)\n',txPort,txNum,usartName);   
            fprintf(fid,'#endif\n');
            fprintf(fid,'\n/* File trailer for Real-Time Workshop generated code.\n*\n* [EOF] STM32F4xxSerialRtiostream_Config.h\n*/\n');        
            fclose(fid);
            clear fid  rtiostreamConfigFile usartName rxNum txNum rxPort txPort usartDelim portDelim rx tx
        end
    end
end
