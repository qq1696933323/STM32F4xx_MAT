/******************** (C) COPYRIGHT 2009 STMicroelectronics ********************
* File Name          : stm32f4xx_it.c
* Author             : MCD Application Team
* Version            : V0.0.1
* Date               : 06/08/2009
* Description        : Main Interrupt Service Routines.
*                      This file provides template for all exceptions handler
*                      and peripherals interrupt service routine.
********************************************************************************
* THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_it.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
* Function Name  : NMIException
* Description    : This function handles NMI exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void NMIException(void)
{
}

/*******************************************************************************
* Function Name  : HardFaultException
* Description    : This function handles Hard Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void HardFaultException(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : MemManageException
* Description    : This function handles Memory Manage exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void MemManageException(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : BusFaultException
* Description    : This function handles Bus Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void BusFaultException(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : UsageFaultException
* Description    : This function handles Usage Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void UsageFaultException(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : DebugMonitor
* Description    : This function handles Debug Monitor exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DebugMonitor(void)
{
}

/*******************************************************************************
* Function Name  : SVCHandler
* Description    : This function handles SVCall exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SVCHandler(void)
{
}

/*******************************************************************************
* Function Name  : PendSVC
* Description    : This function handles PendSVC exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void PendSVC(void)
{
}

/*******************************************************************************
* Function Name  : SysTickHandler
* Description    : This function handles SysTick Handler.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/* void SysTickHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : WWDG_IRQHandler
* Description    : This function handles WWDG interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void WWDG_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : PVD_IRQHandler
* Description    : This function handles PVD interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void PVD_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TAMP_STAMP_IRQHandler
* Description    : This function handles Tamper&Stamp pin interrupt request. 
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TAMP_STAMP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : RTC_WKUP_IRQHandler
* Description    : This function handles RTC Auto wake-up interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void RTC_WKUP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : FLASH_IRQHandler
* Description    : This function handles Flash interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void FLASH_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : RCC_IRQHandler
* Description    : This function handles RCC interrupt request. 
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void RCC_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : EXTI0_IRQHandler
* Description    : This function handles External interrupt Line 0 request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/* void EXTI0_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : EXTI1_IRQHandler
* Description    : This function handles External interrupt Line 1 request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : EXTI2_IRQHandler
* Description    : This function handles External interrupt Line 2 request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : EXTI3_IRQHandler
* Description    : This function handles External interrupt Line 3 request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI3_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : EXTI4_IRQHandler
* Description    : This function handles External interrupt Line 4 request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI4_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream0_IRQHandler
* Description    : This function handles DMA1 Stream 0 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream0_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream1_IRQHandler
* Description    : This function handles DMA1 Stream 1 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream2_IRQHandler
* Description    : This function handles DMA1 Stream 2 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream3_IRQHandler
* Description    : This function handles DMA1 Stream 3 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream3_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream4_IRQHandler
* Description    : This function handles DMA1 Stream 4 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream4_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream5_IRQHandler
* Description    : This function handles DMA1 Stream 5 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream5_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA1_Stream6_IRQHandler
* Description    : This function handles DMA1 Stream 6 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream6_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : ADC_IRQHandler
* Description    : This function handles ADC1, ADC2 and ADC3 global interrupt
*                  requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/*void ADC_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : CAN1_TX_IRQHandler
* Description    : This function handles CAN1 TX interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN1_TX_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN1_RX0_IRQHandler
* Description    : This function handles CAN1 RX0 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN1_RX0_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN1_RX1_IRQHandler
* Description    : This function handles CAN1 RX1 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN1_RX1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN1_SCE_IRQHandler
* Description    : This function handles CAN1 SCE interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN1_SCE_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : EXTI9_5_IRQHandler
* Description    : This function handles External lines 9 to 5 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI9_5_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM1_BRK_TIM9_IRQHandler
* Description    : This function handles TIM1 Break interrupt and TIM9 global 
*                  interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM1_BRK_TIM9_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM1_UP_TIM10_IRQHandler
* Description    : This function handles TIM1 overflow and update interrupt and
*                  TIM10 global interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM1_UP_TIM10_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM1_TRG_COM_TIM11_IRQHandler
* Description    : This function handles TIM1 Trigger and commutation interrupts 
*                  and TIM11 global interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM1_TRG_COM_TIM11_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM1_CC_IRQHandler
* Description    : This function handles TIM1 capture compare interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/*void TIM1_CC_IRQHandler(void)
{
} */

/*******************************************************************************
* Function Name  : TIM2_IRQHandler
* Description    : This function handles TIM2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM3_IRQHandler
* Description    : This function handles TIM3 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM3_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM4_IRQHandler
* Description    : This function handles TIM4 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM4_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : I2C1_EV_IRQHandler
* Description    : This function handles I2C1 Event interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C1_EV_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : I2C1_ER_IRQHandler
* Description    : This function handles I2C1 Error interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C1_ER_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : I2C2_EV_IRQHandler
* Description    : This function handles I2C2 Event interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C2_EV_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : I2C2_ER_IRQHandler
* Description    : This function handles I2C2 Error interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C2_ER_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : SPI1_IRQHandler
* Description    : This function handles SPI1 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SPI1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : SPI2_IRQHandler
* Description    : This function handles SPI2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SPI2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : USART1_IRQHandler
* Description    : This function handles USART1 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/* void USART1_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : USART2_IRQHandler
* Description    : This function handles USART2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/* void USART2_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : USART3_IRQHandler
* Description    : This function handles USART3 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/* void USART3_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : EXTI15_10_IRQHandler
* Description    : This function handles External lines 15 to 10 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void EXTI15_10_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : RTC_Alarm_IRQHandler
* Description    : This function handles RTC Alarm interrupt (A and B) request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void RTC_Alarm_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_FS_WKUP_IRQHandler
* Description    : This function handles USB On The Go FS Wake-up interrupt 
*                  request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_FS_WKUP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM8_BRK_TIM12_IRQHandler
* Description    : This function handles TIM8 Break interrupt and TIM12 global
*                  interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM8_BRK_TIM12_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM8_UP_TIM13_IRQHandler
* Description    : This function handles TIM8 overflow and update interrupt and 
*                  TIM13 global interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM8_UP_TIM13_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM8_TRG_COM_TIM14_IRQHandler
* Description    : This function handles TIM8 Trigger and commutation interrupts 
*                  and TIM14 global interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM8_TRG_COM_TIM14_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM8_CC_IRQHandler
* Description    : This function handles TIM8 capture compare interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/*void TIM8_CC_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : DMA1_Stream7_IRQHandler
* Description    : This function handles DMA1 Stream 7 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA1_Stream7_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : FSMC_IRQHandler
* Description    : This function handles FSMC global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void FSMC_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : SDIO_IRQHandler
* Description    : This function handles SDIO global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SDIO_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM5_IRQHandler
* Description    : This function handles TIM5 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM5_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : SPI3_IRQHandler
* Description    : This function handles SPI3 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SPI3_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : UART4_IRQHandler
* Description    : This function handles UART4 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void UART4_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : UART5_IRQHandler
* Description    : This function handles UART5 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void UART5_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM6_DAC1_IRQHandler
* Description    : This function handles TIM6 global interrupt and DAC1 interrupt
*                  requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM6_DAC1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : TIM7_DAC2_IRQHandler
* Description    : This function handles TIM7 global interrupt and DAC2 interrupt
*                  requests.
* Input          : None
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM7_DAC2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream0_IRQHandler
* Description    : This function handles DMA2 Stream 0 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream0_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream1_IRQHandler
* Description    : This function handles DMA2 Stream 1 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream2_IRQHandler
* Description    : This function handles DMA2 Stream 2 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream2_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream3_IRQHandler
* Description    : This function handles DMA2 Stream 3 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream3_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream4_IRQHandler
* Description    : This function handles DMA2 Stream 4 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream4_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : ETH_IRQHandler
* Description    : This function handles ETHERNET global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void ETH_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : ETH_WKUP_IRQHandler
* Description    : This function handles ETHERNET Wake-up interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void ETH_WKUP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN2_TX_IRQHandler
* Description    : This function handles CAN2 TX interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN2_TX_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN2_RX0_IRQHandler
* Description    : This function handles CAN2 RX0 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN2_RX0_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN2_RX1_IRQHandler
* Description    : This function handles CAN2 RX1 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN2_RX1_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CAN2_SCE_IRQHandler
* Description    : This function handles CAN2 SCE interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CAN2_SCE_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_FS_IRQHandler
* Description    : This function handles USB On The Go FS global interrupt 
*                  request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_FS_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream5_IRQHandler
* Description    : This function handles DMA2 Stream 5 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream5_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream6_IRQHandler
* Description    : This function handles DMA2 Stream 6 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream6_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DMA2_Stream7_IRQHandler
* Description    : This function handles DMA2 Stream 7 interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DMA2_Stream7_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : USART6_IRQHandler
* Description    : This function handles USART6 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
/*void USART6_IRQHandler(void)
{
}
*/
/*******************************************************************************
* Function Name  : I2C3_EV_IRQHandler
* Description    : This function handles I2C3 Event interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C3_EV_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : I2C3_ER_IRQHandler
* Description    : This function handles I2C3 Error interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C3_ER_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_HS_EP1_OUT_IRQHandler
* Description    : This function handles USB On The Go HS End Point 1 Output 
*                  interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_HS_EP1_OUT_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_HS_EP1_IN_IRQHandler
* Description    : This function handles USB On The Go HS End Point 1 Input 
*                  interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_HS_EP1_IN_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_HS_WKUP_IRQHandler
* Description    : This function handles USB On The Go HS Wake-up interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_HS_WKUP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : OTG_HS_IRQHandler
* Description    : This function handles USB On The Go HS global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void OTG_HS_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : DCMI_IRQHandler
* Description    : This function handles DCMI global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DCMI_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : CRYP_IRQHandler
* Description    : This function handles CRYP global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void CRYP_IRQHandler(void)
{
}

/*******************************************************************************
* Function Name  : HASH_RNG_IRQHandler
* Description    : This function handles HASH interrupt and RNG interrupt requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void HASH_RNG_IRQHandler(void)
{
}

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
