/* STM32F4xxSerialRtiostream-Rtiostream.c
 *
 * Specifies rtiostream functions to implement serial PIL
 *
 * NOTES: 
 *  - Baud rate is specified as 115.2Kbaud in UART_PIL_Configuration();
 *  - rtIOStreamSend & rtIOStreamRecv functions send and receive
 *    8-bit characters.
 *
 * Copyright 2011 The MathWorks, Inc.
 */

// Include header files
#include <stdlib.h>
#include <stdio.h>
#include "stm32f4xx.h"
#include "STM32F4xxSerialRtiostream-Rtiostream.h"
/* STM32F4xxSerialRtiostream_Config.h is generated with definitions 
depending on USART selection */
#include "STM32F4xxSerialRtiostream_Config.h"

//#define USART_RCV_BUFF_SIZE 36864
static volatile unsigned int NbrOfDataToRead = 0;
static char RxBuffer[USART_RCV_BUFF_SIZE];
static char* ReadPt = RxBuffer;
static char* WritePt = RxBuffer;

		
// Function prototypes
static void GPIO_PIL_Configuration(void);
static void UART_PIL_Configuration(void);
static void USART_NVIC_Config(void);

/* Global Variable Definition for GPIO Configuration */
static GPIO_InitTypeDef GPIO_InitStructure;

/* Global Variable Definition for UART Configuration */
static USART_InitTypeDef USARTInitStructure;
static USART_ClockInitTypeDef USARTClockInitStructure;

/* Function: rtIOStreamOpen ================================================= */
/* Configuration of USART for rtIOStream =====================================*/
int rtIOStreamOpen(int argc, void * argv[])
{
    (void)argc;
    (void)argv;
    
 	//GPIO init
	GPIO_PIL_Configuration();
	
	//IT Config
	USART_NVIC_Config();

	//USART Periph init
  	UART_PIL_Configuration();
    
	// Initialize timer for profiling
    //RPModif profileTimerInit();

	USART_ITConfig(PIL_USART_NAME, USART_IT_RXNE, ENABLE);

	
    return SERVER_STREAM_ID;
}


/* Function: rtIOStreamClose ================================================ */
int rtIOStreamClose(int streamID)
{
    return RTIOSTREAM_NO_ERROR;
}


/* Function: rtIOStreamSend ================================================ */
int rtIOStreamSend(int streamID, const void *src, size_t size, size_t *sizeSent)
{
    u16 i = 0;
    char* charToSend = (char *)src;
	(void)streamID; //streamID not used

#ifdef PIL_LED_BLINK
	/* Turn ON led4 connected to PC7 pins to indicate data is sent */
//	GPIO_WriteBit(GPIOI, GPIO_Pin_9, Bit_SET);
   GPIO_WriteBit(GPIOI, GPIO_Pin_9, Bit_RESET);
#endif
		
	for (i=0; i<size; i++) {
      while (USART_GetFlagStatus(PIL_USART_NAME, USART_FLAG_TXE) == RESET) ;
      USART_SendData(PIL_USART_NAME, *charToSend++);
    }
    *sizeSent = i;
	
#ifdef PIL_LED_BLINK
    /* Turn OFF led4 connected to PC7 pins to indicate data was sent */
//    GPIO_WriteBit(GPIOI, GPIO_Pin_9, Bit_RESET);
	GPIO_WriteBit(GPIOI, GPIO_Pin_9, Bit_SET);
#endif
 
 
 
    return RTIOSTREAM_NO_ERROR;
}


 /* Function: rtIOStreamRecv ================================================ */
int rtIOStreamRecv(int streamID, void * dst, size_t size, size_t * sizeRecv) 
{
    u16 i = 0;
    char* charToRcv = (char *)dst;
	(void)streamID; //streamID not used
 

#ifdef PIL_LED_BLINK
	/* Turn ON led4 connected to PC7 pins to indicate data is received */
	GPIO_WriteBit(GPIOC, GPIO_Pin_7, Bit_SET);
//    GPIO_WriteBit(GPIOC, GPIO_Pin_7, Bit_RESET);
#endif

	//Wait for nb of received data from IT
    while(NbrOfDataToRead <size);

	for (i=0; i<size ; i++) {
		*charToRcv++ = *ReadPt++;
		NbrOfDataToRead--;
		if(ReadPt>=&RxBuffer[USART_RCV_BUFF_SIZE])
			ReadPt = RxBuffer;
	}
	*sizeRecv = i;
	
#ifdef PIL_LED_BLINK
    /* Turn OFF led4 connected to PC7 pins to indicate data has been received */
//	GPIO_WriteBit(GPIOC, GPIO_Pin_7, Bit_SET);
    GPIO_WriteBit(GPIOC, GPIO_Pin_7, Bit_RESET);
#endif
     
    return RTIOSTREAM_NO_ERROR;
}


  /*******************************************************************************
   * Function Name  : GPIO_PIL_Configuration
   * Description    : Configures GPIOs (general IOs, UART2, onboard LED).
   * Input          : -
   *******************************************************************************/
static void GPIO_PIL_Configuration(void)
{
    // USART IO configuration ------------------------------------//
    // Enable GPIO clock
	RCC_GPIORx_ClockCmd();
	RCC_GPIORx_ClockCmd();
	
    // Set USART_TX as PP AF 
    GPIO_InitStructure.GPIO_Pin = PIL_USART_PIN_TX;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(PIL_USART_PORT_TX, &GPIO_InitStructure);

    // Set USART_RX as Pull-Up 
    GPIO_InitStructure.GPIO_Pin = PIL_USART_PIN_RX;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_Init(PIL_USART_PORT_RX, &GPIO_InitStructure);

    // configure AFIO
    GPIOTx_PinAFConfig();
	GPIORx_PinAFConfig();
	
	RCC_USART_ClockCmd();
	
#ifdef PIL_LED_BLINK
    //Configure LED of EVAL BOARD  to blink during communication
    // Configure GPIOC Pin 7 as Output push-pull - LD4
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    // Configure GPIOG Pin 6, Pin 8 as Output push-pull - LD1,2
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_8;
    GPIO_Init(GPIOG, &GPIO_InitStructure);

    // Configure GPIOI Pin 9 as Output push-pull - LD3
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_Init(GPIOI, &GPIO_InitStructure);
#endif
}


  /*******************************************************************************
   * Function Name  : UART_PIL_Configuration
   * Description    : Configures and Enables UART.
   * Input          : -
   *******************************************************************************/
 static void UART_PIL_Configuration(void)
 {
    // UART2or3 configuration --------------------------------------//
    // UART2or3 configured as follow:
    //      - BaudRate = 115200 baud
    //      - Word Length = 8 Bits
    //      - 1 Stop Bit
    //      - No parity
    //      - Hardware flow control disabled (RTS and CTS signals)
    //      - Receive and transmit enabled
    //      - UART Clock disabled
    //      - UART CPOL: Clock is active low
    //      - UART CPHA: Data is captured on the middle
    //      - UART LastBit: The clock pulse of the last data bit is not output to
    //                       the SCLK pin
    USARTInitStructure.USART_BaudRate = 115200;
    USARTInitStructure.USART_WordLength = USART_WordLength_8b;
    USARTInitStructure.USART_StopBits = USART_StopBits_1;
    USARTInitStructure.USART_Parity = USART_Parity_No;
    USARTInitStructure.USART_HardwareFlowControl =
      USART_HardwareFlowControl_None;
    USARTInitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    USARTClockInitStructure.USART_Clock = USART_Clock_Disable;
    USARTClockInitStructure.USART_CPOL = USART_CPOL_Low;
    USARTClockInitStructure.USART_CPHA = USART_CPHA_2Edge;
    USARTClockInitStructure.USART_LastBit = USART_LastBit_Disable;

    USART_Init(PIL_USART_NAME, &USARTInitStructure);
    USART_ClockInit(PIL_USART_NAME, &USARTClockInitStructure);

    // Enable USART selected from PIL config model.
    USART_Cmd(PIL_USART_NAME, ENABLE);
}

  /*******************************************************************************
   * Function Name  : USART_NVIC_Config
   * Description    : Configures UART interrupt .
   * Input          : -
   *******************************************************************************/
static void USART_NVIC_Config(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

  /* Enable the USARTx Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = USARTx_IRQn ;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}


 /*******************************************************************************
   * Function Name  : USARTx_IRQHANDLER
   * Description    : USART interrupt management. For reception.
   * Input          : -
   *******************************************************************************/
void USARTx_IRQHandler (void)
{
  if(USART_GetITStatus(PIL_USART_NAME, USART_IT_RXNE) != RESET)
  {
    /* Read one byte from the receive data register */
	if(NbrOfDataToRead < USART_RCV_BUFF_SIZE){
		*WritePt++ = PIL_USART_NAME->DR;
		NbrOfDataToRead++;
		if(WritePt>=&RxBuffer[USART_RCV_BUFF_SIZE])
			WritePt = RxBuffer;
	} else {
		if(WritePt>=&RxBuffer[USART_RCV_BUFF_SIZE])
			WritePt = RxBuffer;		
	}	
  }
}
