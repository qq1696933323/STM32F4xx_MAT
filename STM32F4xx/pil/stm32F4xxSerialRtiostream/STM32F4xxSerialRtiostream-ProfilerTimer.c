/* STM32F4xxSerialRtiostream-ProfilerTimer.c
 *
 * Specifies profile timer access functions
 *
 * Copyright 2011 The MathWorks, Inc.
 */

#include "STM32F4xxSerialRtiostream-ProfilerTimer.h"
#include "stm32f4xx.h"
unsigned int* reloadVal = (unsigned int*)0xE000E014;
unsigned int* currentVal = (unsigned int*)0xE000E018;

void profileTimerInit( void )
{
	//SysTick called every time currentVal 1 to 0. Then reloaded with reload val.
    *reloadVal = 0x00FFFFFF;
}


unsigned int profileTimerRead( unsigned int initTimer )
{
	unsigned int timerVal = 0x00FFFFFF;;
	if(initTimer == 0) {
	/*When initTimer is null, it is xilProfilingSectionStart */
		*currentVal = 0x00FFFFFF;
	} else {
	/*When initTimer is NOT null, it is xilProfilingSectionEnd*/	
		timerVal = *currentVal;
	}
    return(timerVal);
}

/****************************************************
                     SysTick_Handler function
		This handler is called every tick 
*****************************************************/
void SysTick_Handler(void)
{
}
