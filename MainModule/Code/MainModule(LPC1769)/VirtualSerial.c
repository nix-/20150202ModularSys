/*
 * @brief Make your board becomes a USB Virtual Com
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2012
 * Copyright(C) Dean Camera, 2011, 2012
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#include "VirtualSerial.h"

#include "ADCext.h"
#include <string.h>
#include "i2c.h"
//#include "MC24LC64.h"
//#include "PCF8574.h"
//#include "drv_hd44780.h"
#include "console.h"
#include "interfaces.h"
#include "drv8840.h"
#include "ads1115.h"
#include "protocol.h"

static void sendBuff(const char *buff);
void sendDataUSB(const char data);

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/

#define ECHO_CHARACTER_TASK     (0)
#define CDC_BRIDGE_TASK         (ECHO_CHARACTER_TASK + 1)

int test;
char buff[20] = {0};
char first;
char second;
char buff1[2] = {0};
char buff2[] = {0};
volatile short ads1115_buff[4] = {0};

volatile drv8840 Motor1;
volatile drv8840State Motor1State;

/** LPCUSBlib CDC Class driver interface configuration and state information. This structure is
 *  passed to all CDC Class driver functions, so that multiple instances of the same class
 *  within a device can be differentiated from one another.
 */
USB_ClassInfo_CDC_Device_t VirtualSerial_CDC_Interface = {
	.Config = {
		.ControlInterfaceNumber         = 0,

		.DataINEndpointNumber           = CDC_TX_EPNUM,
		.DataINEndpointSize             = CDC_TXRX_EPSIZE,
		.DataINEndpointDoubleBank       = false,

		.DataOUTEndpointNumber          = CDC_RX_EPNUM,
		.DataOUTEndpointSize            = CDC_TXRX_EPSIZE,
		.DataOUTEndpointDoubleBank      = false,

		.NotificationEndpointNumber     = CDC_NOTIFICATION_EPNUM,
		.NotificationEndpointSize       = CDC_NOTIFICATION_EPSIZE,
		.NotificationEndpointDoubleBank = false,
		.PortNumber             = 0,
	},
};

/** Standard file stream for the CDC interface when set up, so that the virtual CDC COM port can be
 *  used like any regular character stream in the C APIs
 */
// static FILE USBSerialStream;

/** Select example task, currently lpc11Uxx and lpc17xx don't support for bridging task
 * Only LPC18xx has this feature */
#define CDC_TASK_SELECT ECHO_CHARACTER_TASK

/*****************************************************************************
 * Private functions
 ****************************************************************************/
/** Configures the board hardware and chip peripherals for the demo's functionality. */
static void SetupHardware(void)
{
	Board_Init();
	init_extern_ADC(ON, ADC_100);
	USB_Init(VirtualSerial_CDC_Interface.Config.PortNumber, USB_MODE_Device);

#if defined(USB_DEVICE_ROM_DRIVER)
	UsbdCdc_Init();
#endif
}

static void sendBuff(const char *buff){

	CDC_Device_SendData(&VirtualSerial_CDC_Interface, (char *) buff, strlen(buff));

}

void sendDataUSB(const char data){

	CDC_Device_SendData(&VirtualSerial_CDC_Interface, &data, 1);

}

#if (CDC_TASK_SELECT == ECHO_CHARACTER_TASK)
/** Checks for data input, reply back to the host. */
static void EchoCharacter(void)
{
	/* Echo back character */
	uint8_t recv_byte[CDC_TXRX_EPSIZE];
#if !defined(USB_DEVICE_ROM_DRIVER)
	if (CDC_Device_BytesReceived(&VirtualSerial_CDC_Interface)) {
		// Tuka vraka echo

/*		MC24LC64_Init(); // ToDo: treba da se iskoristat funkciite koi se povikuvaat vo ovaa rutina

		//Chip_I2C_Init(I2C1);
		char buff[]="n";
		uint8_t RdBuffer[10];

		//MC24LC64_Wr(0x000F, "Mr Nikica.S", sizeof("Mr Nikica.S"));

		MC24LC64_Rd(0x000F, RdBuffer, sizeof(RdBuffer));

		//PCF8574_Wr(PCF8574_ADDR, 0xFF);

		PCF8574_Rd(PCF8574_ADDR, RdBuffer);

		HD44780_IO_Init();

		display(1,2, "Nikica Srezoski");

		while(1){
			test = takeDataADC_ADS1231();
			sprintf(buff, "%d\r\n", test);
			CDC_Device_SendData(&VirtualSerial_CDC_Interface, buff, strlen(buff));
		}
*/

		// ToDo: da se napise funkcija za prakanje na informaciite

		recv_byte[0] = CDC_Device_ReceiveByte(&VirtualSerial_CDC_Interface);
		recv_byte[1] = '\0';
		//CDC_Device_SendData(&VirtualSerial_CDC_Interface, (char *) recv_byte, 1);

		parsingSerialCommand(&recv_byte);
		charArrived(recv_byte[0]);

	}
#else
	uint32_t recv_count;
	recv_count = UsbdCdc_RecvData(recv_byte, CDC_TXRX_EPSIZE);
	if (recv_count) {
		UsbdCdc_SendData(recv_byte, recv_count);
	}
#endif

}

#else
/** USB-UART Bridge Task */
static void CDC_Bridge_Task(void)
{
	/* Echo back character */
	uint8_t out_buff[CDC_TXRX_EPSIZE], in_buff[CDC_TXRX_EPSIZE];
	uint32_t recv_count;
#if !defined(USB_DEVICE_ROM_DRIVER)
	recv_count = CDC_Device_BytesReceived(&VirtualSerial_CDC_Interface);
	while (recv_count--) {
		out_buff[0] = CDC_Device_ReceiveByte(&VirtualSerial_CDC_Interface);
		Serial_Send((uint8_t *) out_buff, 1, BLOCKING);
	}

	recv_count = Serial_Revc(in_buff, CDC_TXRX_EPSIZE, NONE_BLOCKING);
	if (recv_count) {
		CDC_Device_SendData(&VirtualSerial_CDC_Interface, (char *) in_buff, recv_count);
	}
#else
	recv_count = UsbdCdc_RecvData(out_buff, CDC_TXRX_EPSIZE);
	if (recv_count) {
		Serial_Send((uint8_t *) out_buff, recv_count, BLOCKING);
	}

	recv_count = Serial_Revc(in_buff, CDC_TXRX_EPSIZE, NONE_BLOCKING);
	if (recv_count) {
		UsbdCdc_SendData(in_buff, recv_count);
	}
#endif
}

#endif

/*****************************************************************************
 * Public functions
 ****************************************************************************/

void pecati_adc(void)
{
	sprintf(buff, "ADC0:%d\t ADC1:%d\t ADC2:%d\t ADC3:%d\t \r\n", ads1115_buff[0], ads1115_buff[1], ads1115_buff[2], ads1115_buff[3]);
	CDC_Device_SendData(&VirtualSerial_CDC_Interface, buff, strlen(buff));
}

/** Main program entry point. This routine contains the overall program flow, including initial
 *  setup of all components and the main program loop.
 */
int main(void)
{

	/*Definitions*/
	ads1115_conf_reg* confReg;
	ads1115_conf_reg ad0, ad1, ad2, ad3, ad4, ad5, ad6, ad7, ad8, ad9, ad10, ad11, ad12, ad13, ad14, ad15;

	/*Transmiter*/
	initPeripherals();

	/*USB communication*/
	SetupHardware();

	/*ADC*/
	ads1115_init();

// ADC 0
	ad0.os 			= SING_CONV;
	ad0.mux			= AIN0_GND;
	ad0.pga			= RANGE_4096V	;
	ad0.mode		= SHOT_POW_DOWN;
	ad0.data_rate	= SPS860;
	ad0.cmp_mode	= TRADI;
	ad0.cmp_pol		= ACT_LOW;
	ad0.cmp_lat		= NON_LATCH;
	ad0.cmp_que		= ASSERT_DIS;

	ad1.os 			= SING_CONV;
	ad1.mux			= AIN1_GND;
	ad1.pga			= RANGE_4096V;
	ad1.mode		= SHOT_POW_DOWN;
	ad1.data_rate	= SPS860;
	ad1.cmp_mode	= TRADI;
	ad1.cmp_pol		= ACT_LOW;
	ad1.cmp_lat		= NON_LATCH;
	ad1.cmp_que		= ASSERT_DIS;

	ad2.os 			= SING_CONV;
	ad2.mux			= AIN2_GND;
	ad2.pga			= RANGE_4096V;
	ad2.mode		= SHOT_POW_DOWN;
	ad2.data_rate	= SPS860;
	ad2.cmp_mode	= TRADI;
	ad2.cmp_pol		= ACT_LOW;
	ad2.cmp_lat		= NON_LATCH;
	ad2.cmp_que		= ASSERT_DIS;

	ad3.os 			= SING_CONV;
	ad3.mux			= AIN3_GND;
	ad3.pga			= RANGE_4096V;
	ad3.mode		= SHOT_POW_DOWN;
	ad3.data_rate	= SPS860;
	ad3.cmp_mode	= TRADI;
	ad3.cmp_pol		= ACT_LOW;
	ad3.cmp_lat		= NON_LATCH;
	ad3.cmp_que		= ASSERT_DIS;
// ADC 1
	ad4.os 			= SING_CONV;
	ad4.mux			= AIN0_GND;
	ad4.pga			= RANGE_4096V	;
	ad4.mode		= SHOT_POW_DOWN;
	ad4.data_rate	= SPS860;
	ad4.cmp_mode	= TRADI;
	ad4.cmp_pol		= ACT_LOW;
	ad4.cmp_lat		= NON_LATCH;
	ad4.cmp_que		= ASSERT_DIS;

	ad5.os 			= SING_CONV;
	ad5.mux			= AIN1_GND;
	ad5.pga			= RANGE_4096V;
	ad5.mode		= SHOT_POW_DOWN;
	ad5.data_rate	= SPS860;
	ad5.cmp_mode	= TRADI;
	ad5.cmp_pol		= ACT_LOW;
	ad5.cmp_lat		= NON_LATCH;
	ad5.cmp_que		= ASSERT_DIS;

	ad6.os 			= SING_CONV;
	ad6.mux			= AIN2_GND;
	ad6.pga			= RANGE_4096V;
	ad6.mode		= SHOT_POW_DOWN;
	ad6.data_rate	= SPS860;
	ad6.cmp_mode	= TRADI;
	ad6.cmp_pol		= ACT_LOW;
	ad6.cmp_lat		= NON_LATCH;
	ad6.cmp_que		= ASSERT_DIS;

	ad7.os 			= SING_CONV;
	ad7.mux			= AIN3_GND;
	ad7.pga			= RANGE_4096V;
	ad7.mode		= SHOT_POW_DOWN;
	ad7.data_rate	= SPS860;
	ad7.cmp_mode	= TRADI;
	ad7.cmp_pol		= ACT_LOW;
	ad7.cmp_lat		= NON_LATCH;
	ad7.cmp_que		= ASSERT_DIS;
// ADC 2
	ad8.os 			= SING_CONV;
	ad8.mux			= AIN0_GND;
	ad8.pga			= RANGE_4096V;
	ad8.mode		= SHOT_POW_DOWN;
	ad8.data_rate	= SPS860;
	ad8.cmp_mode	= TRADI;
	ad8.cmp_pol		= ACT_LOW;
	ad8.cmp_lat		= NON_LATCH;
	ad8.cmp_que		= ASSERT_DIS;

	ad9.os 			= SING_CONV;
	ad9.mux			= AIN1_GND;
	ad9.pga			= RANGE_4096V;
	ad9.mode		= SHOT_POW_DOWN;
	ad9.data_rate	= SPS860;
	ad9.cmp_mode	= TRADI;
	ad9.cmp_pol		= ACT_LOW;
	ad9.cmp_lat		= NON_LATCH;
	ad9.cmp_que		= ASSERT_DIS;

	ad10.os 		= SING_CONV;
	ad10.mux		= AIN2_GND;
	ad10.pga		= RANGE_4096V;
	ad10.mode		= SHOT_POW_DOWN;
	ad10.data_rate	= SPS860;
	ad10.cmp_mode	= TRADI;
	ad10.cmp_pol	= ACT_LOW;
	ad10.cmp_lat	= NON_LATCH;
	ad10.cmp_que	= ASSERT_DIS;

	ad11.os 		= SING_CONV;
	ad11.mux		= AIN3_GND;
	ad11.pga		= RANGE_4096V;
	ad11.mode		= SHOT_POW_DOWN;
	ad11.data_rate	= SPS860;
	ad11.cmp_mode	= TRADI;
	ad11.cmp_pol	= ACT_LOW;
	ad11.cmp_lat	= NON_LATCH;
	ad11.cmp_que	= ASSERT_DIS;
// ADC 3
	ad12.os 		= SING_CONV;
	ad12.mux		= AIN0_GND;
	ad12.pga		= RANGE_4096V;
	ad12.mode		= SHOT_POW_DOWN;
	ad12.data_rate	= SPS860;
	ad12.cmp_mode	= TRADI;
	ad12.cmp_pol	= ACT_LOW;
	ad12.cmp_lat	= NON_LATCH;
	ad12.cmp_que	= ASSERT_DIS;

	ad13.os 		= SING_CONV;
	ad13.mux		= AIN1_GND;
	ad13.pga		= RANGE_4096V;
	ad13.mode		= SHOT_POW_DOWN;
	ad13.data_rate	= SPS860;
	ad13.cmp_mode	= TRADI;
	ad13.cmp_pol	= ACT_LOW;
	ad13.cmp_lat	= NON_LATCH;
	ad13.cmp_que	= ASSERT_DIS;

	ad14.os 		= SING_CONV;
	ad14.mux		= AIN2_GND;
	ad14.pga		= RANGE_4096V;
	ad14.mode		= SHOT_POW_DOWN;
	ad14.data_rate	= SPS860;
	ad14.cmp_mode	= TRADI;
	ad14.cmp_pol	= ACT_LOW;
	ad14.cmp_lat	= NON_LATCH;
	ad14.cmp_que	= ASSERT_DIS;

	ad15.os 		= SING_CONV;
	ad15.mux		= AIN3_GND;
	ad15.pga		= RANGE_4096V;
	ad15.mode		= SHOT_POW_DOWN;
	ad15.data_rate	= SPS860;
	ad15.cmp_mode	= TRADI;
	ad15.cmp_pol	= ACT_LOW;
	ad15.cmp_lat	= NON_LATCH;
	ad15.cmp_que	= ASSERT_DIS;


	for (;; ) {

		/*ADC conversion code*/

		// CH0 -----------------------------------------------------------------------
		ads1115_wr(ADS1115_ADDR0, CONF_REG, (char*)(&ad0), 2);	//ch0
		ads1115_wr(ADS1115_ADDR1, CONF_REG, (char*)(&ad4), 2); 	//ch4
		ads1115_wr(ADS1115_ADDR2, CONF_REG, (char*)(&ad8), 2);	//ch8
		ads1115_wr(ADS1115_ADDR3, CONF_REG, (char*)(&ad12), 2);	//ch12


		do{// ch0
			ads1115_rd(ADS1115_ADDR0, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR0, CONVER_REG, buff2 , 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR0, buff, 2);
		ads1115_buff[0] = buff[0] << 8;
		ads1115_buff[0] |= buff[1];

		do{ // ch4
			ads1115_rd(ADS1115_ADDR1, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR1, CONVER_REG, (char*)(&ad4), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR1, buff, 2);

		ads1115_buff[4] = buff[0] << 8;
		ads1115_buff[4] |= buff[1];

		do{ // ch8
			ads1115_rd(ADS1115_ADDR2, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR2, CONVER_REG, (char*)(&ad8), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR2, buff, 2);

		ads1115_buff[8] = buff[0] << 8;
		ads1115_buff[8] |= buff[1];

		do{ // ch12
			ads1115_rd(ADS1115_ADDR3, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR3, CONVER_REG, (char*)(&ad12), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR3, buff, 2);

		ads1115_buff[12] = buff[0] << 8;
		ads1115_buff[12] |= buff[1];


		// CH1 -----------------------------------------------------------------------
		ads1115_wr(ADS1115_ADDR0, CONF_REG, (char*)(&ad1), 2); // ch1
		ads1115_wr(ADS1115_ADDR1, CONF_REG, (char*)(&ad5), 2); // ch5
		ads1115_wr(ADS1115_ADDR2, CONF_REG, (char*)(&ad9), 2); // ch9
		ads1115_wr(ADS1115_ADDR3, CONF_REG, (char*)(&ad13), 2);	//ch13

		do{ // ch1
			ads1115_rd(ADS1115_ADDR0, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR0, CONVER_REG, buff2 , 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR0, buff, 2);

		ads1115_buff[1] = buff[0] << 8;
		ads1115_buff[1] |= buff[1];

		do{ // ch5
			ads1115_rd(ADS1115_ADDR1, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR1, CONVER_REG, (char*)(&ad5), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR1, buff, 2);

		ads1115_buff[5] = buff[0] << 8;
		ads1115_buff[5] |= buff[1];

		do{ // ch9
			ads1115_rd(ADS1115_ADDR2, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR2, CONVER_REG, (char*)(&ad9), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR2, buff, 2);

		ads1115_buff[9] = buff[0] << 8;
		ads1115_buff[9] |= buff[1];

		do{ // ch13
			ads1115_rd(ADS1115_ADDR3, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR3, CONVER_REG, (char*)(&ad13), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR3, buff, 2);

		ads1115_buff[13] = buff[0] << 8;
		ads1115_buff[13] |= buff[1];


		// CH2 -----------------------------------------------------------------------
		ads1115_wr(ADS1115_ADDR0, CONF_REG, (char*)(&ad2), 2); 	// ch2
		ads1115_wr(ADS1115_ADDR1, CONF_REG, (char*)(&ad6), 2); 	// ch6
		ads1115_wr(ADS1115_ADDR2, CONF_REG, (char*)(&ad10), 2); // ch10
		ads1115_wr(ADS1115_ADDR3, CONF_REG, (char*)(&ad14), 2);	//ch14

		do{ // ch2
			ads1115_rd(ADS1115_ADDR0, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR0, CONVER_REG, buff2 , 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR0, buff, 2);

		ads1115_buff[2] = buff[0] << 8;
		ads1115_buff[2] |= buff[1];

		do{ //ch6
			ads1115_rd(ADS1115_ADDR1, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR1, CONVER_REG, (char*)(&ad6), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR1, buff, 2);

		ads1115_buff[6] = buff[0] << 8;
		ads1115_buff[6] |= buff[1];

		do{ //ch10
			ads1115_rd(ADS1115_ADDR2, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR2, CONVER_REG, (char*)(&ad10), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR2, buff, 2);

		ads1115_buff[10] = buff[0] << 8;
		ads1115_buff[10] |= buff[1];

		do{ //ch14
			ads1115_rd(ADS1115_ADDR3, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR3, CONVER_REG, (char*)(&ad14), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR3, buff, 2);

		ads1115_buff[14] = buff[0] << 8;
		ads1115_buff[14] |= buff[1];


		// CH3 -----------------------------------------------------------------------
		ads1115_wr(ADS1115_ADDR0, CONF_REG, (char*)(&ad3), 2); 	// ch3
		ads1115_wr(ADS1115_ADDR1, CONF_REG, (char*)(&ad7), 2); 	// ch7
		ads1115_wr(ADS1115_ADDR2, CONF_REG, (char*)(&ad11), 2); // ch11
		ads1115_wr(ADS1115_ADDR3, CONF_REG, (char*)(&ad15), 2);	//ch15

		do{ //ch3
			ads1115_rd(ADS1115_ADDR0, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR0, CONVER_REG, (char*)(&ad3), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR0, buff, 2);

		ads1115_buff[3] = buff[0] << 8;
		ads1115_buff[3] |= buff[1];

		do{ //ch7
			ads1115_rd(ADS1115_ADDR1, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR1, CONVER_REG, (char*)(&ad7), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR1, buff, 2);

		ads1115_buff[7] = buff[0] << 8;
		ads1115_buff[7] |= buff[1];

		do{ //ch11
			ads1115_rd(ADS1115_ADDR2, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR2, CONVER_REG, (char*)(&ad11), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR2, buff, 2);

		ads1115_buff[11] = buff[0] << 8;
		ads1115_buff[11] |= buff[1];

		do{  //ch15
			ads1115_rd(ADS1115_ADDR3, buff, 2); //
		}while((0x80 & buff[0]) == 0);
		confReg = buff; // check config register

		ads1115_wr(ADS1115_ADDR3, CONVER_REG, (char*)(&ad15), 0); // points to conversion reg
		ads1115_rd(ADS1115_ADDR3, buff, 2);

		ads1115_buff[15] = buff[0] << 8;
		ads1115_buff[15] |= buff[1];

		// END channels ---------------------------------------------------------------


		sprintf(buff, "ADC0:%d\tADC1:%d\tADC2:%d\tADC3:%d\tADC4:%d\tADC5:%d\tADC6:%d\tADC7:%d\tADC8:%d\tADC9:%d\tADC10:%d\tADC11:%d\tADC12:%d\tADC13:%d\tADC14:%d\t\r\n",
				ads1115_buff[0], ads1115_buff[1], ads1115_buff[2], ads1115_buff[3], ads1115_buff[4], ads1115_buff[5], ads1115_buff[6], ads1115_buff[7], ads1115_buff[8], ads1115_buff[9], ads1115_buff[10], ads1115_buff[11], ads1115_buff[12], ads1115_buff[13], ads1115_buff[14]);
		CDC_Device_SendData(&VirtualSerial_CDC_Interface, buff, strlen(buff));


#if defined(USB_DEVICE_ROM_DRIVER)
		UsbdCdc_IO_Buffer_Sync_Task();
#endif

#if (CDC_TASK_SELECT == ECHO_CHARACTER_TASK)
		EchoCharacter();
#else
		CDC_Bridge_Task();
#endif
#if !defined(USB_DEVICE_ROM_DRIVER)
		// CDC_Device_USBTask(&VirtualSerial_CDC_Interface);
		USB_USBTask(VirtualSerial_CDC_Interface.Config.PortNumber, USB_MODE_Device);
#endif

	}
}

/** Event handler for the library USB Connection event. */
void EVENT_USB_Device_Connect(void)
{}

/** Event handler for the library USB Disconnection event. */
void EVENT_USB_Device_Disconnect(void)
{}

/** Event handler for the library USB Configuration Changed event. */
void EVENT_USB_Device_ConfigurationChanged(void)
{
	bool ConfigSuccess = true;

	ConfigSuccess &= CDC_Device_ConfigureEndpoints(&VirtualSerial_CDC_Interface);

	//	LEDs_SetAllLEDs(ConfigSuccess ? LEDMASK_USB_READY : LEDMASK_USB_ERROR);
}

/** Event handler for the library USB Control Request reception event. */
void EVENT_USB_Device_ControlRequest(void)
{
	VirtualSerial_CDC_Interface.State.LineEncoding.BaudRateBPS = 921600;  // set baudRate
	CDC_Device_ProcessControlRequest(&VirtualSerial_CDC_Interface);
}

#if !defined(USB_DEVICE_ROM_DRIVER)
void EVENT_CDC_Device_LineEncodingChanged(USB_ClassInfo_CDC_Device_t *const CDCInterfaceInfo)
{
	/*TODO: add LineEncoding processing here
	 * this is just a simple statement, only Baud rate is set */
	// Serial_Init(CDCInterfaceInfo->State.LineEncoding.BaudRateBPS, false);
}

#else
void EVENT_UsbdCdc_SetLineCode(CDC_LINE_CODING *line_coding)
{
	// Serial_Init(VirtualSerial_CDC_Interface.State.LineEncoding.BaudRateBPS, false);
}

#endif
