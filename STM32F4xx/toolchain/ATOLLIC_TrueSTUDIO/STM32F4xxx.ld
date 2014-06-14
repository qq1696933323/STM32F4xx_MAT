/*
*****************************************************************************
**
**  File        : stm32F407xx.ld
**
**  Abstract    : stm32F407xx FLASH, RAM definition used for _FLASH.ld or _RAM.ld
**
**  Target      : STMicroelectronics STM32
**
**  Environment : Atollic TrueSTUDIO(R)
**
**  Distribution: The file is distributed “as is,” without any warranty
**                of any kind.
**
**  (c)Copyright Atollic AB.
**  You may use this file as-is or modify it according to the needs of your
**  project. Distribution of this file (unmodified or modified) is not
**  permitted. Atollic AB permit registered Atollic TrueSTUDIO(R) users the
**  rights to distribute the assembled, compiled & linked contents of this
**  file as part of an application binary file, provided that it is built
**  using the Atollic TrueSTUDIO(R) toolchain.
**
*****************************************************************************
*/

RAM_START = 0x20000000 ;
RAM_LENGTH = 128K ;
STACK_START = RAM_START + RAM_LENGTH ;

HEAP_LENGTH = 0K ;
STACK_LENGTH = 0x400 ;

/* Highest address of the user mode stack */
_estack = STACK_START;    /* end of RAM */

/* Generate a link error if heap and stack don't fit into RAM */
_Min_Heap_Size = HEAP_LENGTH;      /* required amount of heap  */
_Min_Stack_Size = STACK_LENGTH; /* required amount of stack */

/* Specify the memory areas */
MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 128K
  MEMORY_B1 (rx)  : ORIGIN = 0x60000000, LENGTH = 0K
  CCMRAM (rw)     : ORIGIN = 0x10000000, LENGTH = 64K  
}


