classdef Timer < rtw.connectivity.Timer
% TIMER Get timing information for STM32F4 PIL application 
%
%   See also RTW.CONNECTIVITY.TIMER

%   Copyright 2009-2011 The MathWorks, Inc.

    methods

        function this = Timer
            
            % Configure data type returned by timer reads
            this.setTimerDataType('uint32');

            % The micros() function returns multiple of 10µ
            ticksPerSecond = 168e6; 
            this.setTicksPerSecond(ticksPerSecond);

            % The timer counts upwards
            this.setCountDirection('down');

            % Get STM32F4 installation path
            Stm32RootPath = updatePrefs('get','stm32f4RootPath');

            % Configure source files required to access the timer
            headerFile = fullfile(Stm32RootPath,...
                                  'pil',...
                                  'stm32F4xxSerialRtiostream',...
                                  'STM32F4xxSerialRtiostream-ProfilerTimer.h');

            timerSourceFile = fullfile(Stm32RootPath,...
                                  'pil',...
                                  'stm32F4xxSerialRtiostream',...
                                  'STM32F4xxSerialRtiostream-ProfilerTimer.c');
            
            this.setSourceFile(timerSourceFile);
            this.setHeaderFile(headerFile);

            % Configure the expression used to read the timer
            readTimerExpression = 'profileTimerRead(xsd_xil_timer_unfreeze)';
            this.setReadTimerExpression(readTimerExpression);
            
        end  
    end
end

