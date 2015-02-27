/*
 * transmitter_interface.c
 *
 *  Created on: May 14, 2014
 *      Author: nikica
 */

#include "transmitter_interface.h"

#include "LPC17xx.h"			/* LPC17xx Peripheral Registers */
#include "protocol.h"
//#include "adc.h"
//#include "uart.h"
//#include "ADC_MCP3425.h"
#include "ads1115.h"
//#include "VirtualSerial.h"

#define BAUDRATE 		38400

extern volatile short ads1115_buff[4];



/****************************************************************************
** Function name:	initPeripherals
**
** Descriptions:	function for initialization of the hardware which is used
** 					by the transmitter
**
** parameters:		None
** Returned value:	None
**
****************************************************************************/
void initPeripherals(void){
	/**LPC1769**/

/*
	// ADC ----------------------------------------------
	//A0.7 - P0.2
	LPC_PINCON->PINSEL0 &= ~(0x3 << 4);
	LPC_PINCON->PINSEL0 |=  (0x2 << 4);

	//A0.6 - P0.3
	LPC_PINCON->PINSEL0 &= ~(0x3 << 6);
	LPC_PINCON->PINSEL0 |=  (0x2 << 6);

	//A0.0 - P0.23
	LPC_PINCON->PINSEL1 &= ~(0x3 << 14);
	LPC_PINCON->PINSEL1 |=  (0x1 << 14);

	//A0.1 - P0.24
	LPC_PINCON->PINSEL1 &= ~(0x3 << 16);
	LPC_PINCON->PINSEL1 |=  (0x1 << 16);

	//A0.2 - P0.25
	LPC_PINCON->PINSEL1 &= ~(0x3 << 18);
	LPC_PINCON->PINSEL1 |=  (0x1 << 18);

	//A0.3 - P0.26
	LPC_PINCON->PINSEL1 &= ~(0x3 << 20);
	LPC_PINCON->PINSEL1 |=  (0x1 << 20);

	//A0.4 - P1.30
	LPC_PINCON->PINSEL3 |=  (0x3 << 28);

	//A0.5 - P1.31
	LPC_PINCON->PINSEL3 |=  (0x3 << 30);



	//GPIO - IN/OUT -------------------------------------------
	// P0.6
	LPC_PINCON->PINSEL0  &= ~(0x3 << 12);
	LPC_GPIO0->FIODIR 	 |=  (0x1 << 6);  // output pin

		// INPUTS
		// P0.7 - highZ
		LPC_PINCON->PINSEL0  &= ~(0x3 << 14);
		LPC_PINCON->PINMODE0 |=  (0x2 << 14); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 7);  // input pin

		// P0.8 - highZ
		LPC_PINCON->PINSEL0  &= ~(0x3 << 16);
		LPC_PINCON->PINMODE0 |=  (0x2 << 16); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 8);  // input pin

		// P0.9 - highZ
		LPC_PINCON->PINSEL0  &= ~(0x3 << 18);
		LPC_PINCON->PINMODE0 |=  (0x2 << 18); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 9);  // input pin

		// P0.21 - highZ
		LPC_PINCON->PINSEL1  &= ~(0x3 << 10);
		LPC_PINCON->PINMODE1 |=  (0x2 << 10); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 21);  // input pin

		// P0.22 - highZ
		LPC_PINCON->PINSEL1  &= ~(0x3 << 12);
		LPC_PINCON->PINMODE1 |=  (0x2 << 12); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 22);  // input pin

		// P0.27 - highZ
		LPC_PINCON->PINSEL1  &= ~(0x3 << 22);
		LPC_PINCON->PINMODE1 |=  (0x2 << 22); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 27);  // input pin

		// P0.28 - highZ
		LPC_PINCON->PINSEL1  &= ~(0x3 << 24);
		LPC_PINCON->PINMODE1 |=  (0x2 << 24); // without float resistor
		LPC_GPIO0->FIODIR 	 &= ~(0x1 << 28);  // input pin

		// P2.13 - highZ
		LPC_PINCON->PINSEL4  &= ~(0x3 << 26);
		LPC_PINCON->PINMODE4 |=  (0x2 << 26); // without float resistor
		LPC_GPIO2->FIODIR 	 &= ~(0x1 << 13);  // input pin

	// P2.9
	LPC_PINCON->PINSEL4  &= ~(0x3 << 18);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 9);  // output pin

	// P4.29
	LPC_PINCON->PINSEL9  &= ~(0x3 << 26);
	LPC_GPIO4->FIODIR 	 |=  (0x1 << 29);  // output pin

	// P4.28
	LPC_PINCON->PINSEL9  &= ~(0x3 << 24);
	LPC_GPIO4->FIODIR 	 |=  (0x1 << 28);  // output pin

	// P3.26
	LPC_PINCON->PINSEL7  &= ~(0x3 << 20);
	LPC_GPIO3->FIODIR 	 |=  (0x1 << 26);  // output pin

	// P3.25
	LPC_PINCON->PINSEL7  &= ~(0x3 << 18);
	LPC_GPIO3->FIODIR 	 |=  (0x1 << 25);  // output pin

	// P1.29
	LPC_PINCON->PINSEL3  &= ~(0x3 << 26);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 29);  // output pin

	// P1.28
	LPC_PINCON->PINSEL3  &= ~(0x3 << 24);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 28);  // output pin

	// P1.27
	LPC_PINCON->PINSEL3  &= ~(0x3 << 22);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 27);  // output pin

	// P1.26
	LPC_PINCON->PINSEL3  &= ~(0x3 << 20);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 26);  // output pin

	// P1.25
	LPC_PINCON->PINSEL3  &= ~(0x3 << 18);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 25);  // output pin

	// P1.24
	LPC_PINCON->PINSEL3  &= ~(0x3 << 16);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 24);  // output pin

	// P1.23
	LPC_PINCON->PINSEL3  &= ~(0x3 << 14);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 23);  // output pin

	// P1.22
	LPC_PINCON->PINSEL3  &= ~(0x3 << 12);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 22);  // output pin

	// P1.21
	LPC_PINCON->PINSEL3  &= ~(0x3 << 10);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 21);  // output pin

	// P1.20
	LPC_PINCON->PINSEL3  &= ~(0x3 << 8);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 20);  // output pin

	// P1.19
	LPC_PINCON->PINSEL3  &= ~(0x3 << 6);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 19);  // output pin

	// P1.18
	LPC_PINCON->PINSEL3  &= ~(0x3 << 4);
	LPC_GPIO1->FIODIR 	 |=  (0x1 << 18);  // output pin

	// P2.12
	LPC_PINCON->PINSEL4  &= ~(0x3 << 24);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 12);  // output pin

	// P2.11
	LPC_PINCON->PINSEL4  &= ~(0x3 << 22);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 11);  // output pin

	// P2.10
	LPC_PINCON->PINSEL4  &= ~(0x3 << 20);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 10);  // output pin

	// P2.8
	LPC_PINCON->PINSEL4  &= ~(0x3 << 16);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 8);  // output pin

	// P2.7
	LPC_PINCON->PINSEL4  &= ~(0x3 << 14);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 7);  // output pin

	// P2.6
	LPC_PINCON->PINSEL4  &= ~(0x3 << 12);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 6);  // output pin

	// P2.5
	LPC_PINCON->PINSEL4  &= ~(0x3 << 10);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 5);  // output pin

	// P2.4
	LPC_PINCON->PINSEL4  &= ~(0x3 << 8);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 4);  // output pin

	// P2.3
	LPC_PINCON->PINSEL4  &= ~(0x3 << 6);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 3);  // output pin

	// P2.2
	LPC_PINCON->PINSEL4  &= ~(0x3 << 4);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 2);  // output pin

	// P2.1
	LPC_PINCON->PINSEL4  &= ~(0x3 << 2);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 1);  // output pin

	// P2.0
	LPC_PINCON->PINSEL4  &= ~(0x3 << 0);
	LPC_GPIO2->FIODIR 	 |=  (0x1 << 0);  // output pin

	// P0.11
	LPC_PINCON->PINSEL0  &= ~(0x3 << 22);
	LPC_GPIO0->FIODIR 	 |=  (0x1 << 11);  // output pin

	// P0.10
	LPC_PINCON->PINSEL0  &= ~(0x3 << 20);
	LPC_GPIO0->FIODIR 	 |=  (0x1 << 10);  // output pin

	// P0.5
	LPC_PINCON->PINSEL0  &= ~(0x3 << 10);
	LPC_GPIO0->FIODIR 	 |=  (0x1 << 5);  // output pin

	// P0.4
	LPC_PINCON->PINSEL0  &= ~(0x3 << 8);
	LPC_GPIO0->FIODIR 	 |=  (0x1 << 4);  // output pin
*/


/*
	// UART 1 --------------------------------------
	// P0.16 - RxD1
	LPC_PINCON->PINSEL0 &= ~0xA0000000;
	LPC_PINCON->PINSEL0 |=  0x40000000;
	// P0.15 - TxD1
	LPC_PINCON->PINSEL1 &= ~0x00000003;
	LPC_PINCON->PINSEL1 |=  0x00000001;
	// communication
	//UART1Init(BAUDRATE, comunicationHandler);
*/


	/**External**/
	// <- External

	// disable All unneeded peripherals
/*
	LPC_SC->PCONP &= ~(1 << 1);  	// disable Timer0
	LPC_SC->PCONP &= ~(1 << 2);  	// disable Timer1
	LPC_SC->PCONP &= ~(1 << 3);  	// disable UART0
	LPC_SC->PCONP &= ~(1 << 6);  	// disable PWM1
	LPC_SC->PCONP &= ~(1 << 8);  	// disable SPI
	LPC_SC->PCONP &= ~(1 << 9);  	// disable RTC
	LPC_SC->PCONP &= ~(1 << 10);  	// disable SSP1
	LPC_SC->PCONP &= ~(1 << 26);  	// disable I2C2
	LPC_SC->PCONP &= ~(1 << 25);  	// disable UART3
	LPC_SC->PCONP &= ~(1 << 24);  	// disable UART2
*/

	addFunctions();
}


uint8_t swapByte(uint8_t data){

	uint8_t tmp = 0;

	tmp |= (data & 0x01) << 7;
	tmp |= (data & 0x02) << 5;
	tmp |= (data & 0x04) << 3;
	tmp |= (data & 0x08) << 1;
	tmp |= (data & 0x10) >> 1;
	tmp |= (data & 0x20) >> 3;
	tmp |= (data & 0x40) >> 5;
	tmp |= (data & 0x80) >> 7;

	return tmp;
}

/***************************************************************************
 * Funcition: old transmitel protocol sending function
 * !! OVAA FUNKCIJA NE TREBA SA SE CEPKA V
 *
 **************************************************************************/
volatile uint32_t sendADCData(uint16_t data){

	uint8_t tmp_data;

	//first byte
/*	tmp_data = (uint8_t)((0xFE0 & data) >> 5);
	tmp_data = swapByte(tmp_data);*/
	tmp_data = 0xff & data;
	sendDataUSB(tmp_data);

	//second byte
/*	tmp_data = (uint8_t)((0x01F & data) << 3);
	tmp_data = swapByte(tmp_data);*/
	tmp_data = 0xff & (data >> 8);
	sendDataUSB(tmp_data);

	return 0;
}


/********************************************************************************************
 * function: Reading ADC (channel 0)
 *
 *******************************************************************************************/
volatile uint32_t adc0(void){

	return ads1115_buff[0];
}

/********************************************************************************************
 * function: Reading ADC (channel 1)
 *
 *******************************************************************************************/
volatile uint32_t adc1(void){

	return ads1115_buff[1];
}

/********************************************************************************************
 * function: Reading ADC (channel 2)
 *
 *******************************************************************************************/
volatile uint32_t adc2(void){

	return ads1115_buff[2];
}

/********************************************************************************************
 * function: Reading ADC (channel 3)
 *
 *******************************************************************************************/
volatile uint32_t adc3(void){

	return ads1115_buff[3];
}

/********************************************************************************************
 * function: Reading ADC (channel 4)
 *
 *******************************************************************************************/
volatile uint32_t adc4(void){

	return ads1115_buff[4]; //ADCReadBlocking(4);
}

/********************************************************************************************
 * function: Reading ADC (channel 5)
 *
 *******************************************************************************************/
volatile uint32_t adc5(void){

	return ads1115_buff[5]; //ADCReadBlocking(5);
}

/********************************************************************************************
 * function: Reading ADC (channel 6)
 *
 *******************************************************************************************/
volatile uint32_t adc6(void){

	return ads1115_buff[6]; //ADCReadBlocking(6);
}

/********************************************************************************************
 * function: Reading ADC (channel 7)
 *
 *******************************************************************************************/
volatile uint32_t adc7(void){

	return ads1115_buff[7]; //ADCReadBlocking(7);
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 8)
 *
 *******************************************************************************************/
volatile uint32_t adc8(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[8];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 9)
 *
 *******************************************************************************************/
volatile uint32_t adc9(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[9];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 10)
 *
 *******************************************************************************************/
volatile uint32_t adc10(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[10];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 11)
 *
 *******************************************************************************************/
volatile uint32_t adc11(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[11];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 12)
 *
 *******************************************************************************************/
volatile uint32_t adc12(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[12];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 13)
 *
 *******************************************************************************************/
volatile uint32_t adc13(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[13];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 10)
 *
 *******************************************************************************************/
volatile uint32_t adc14(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[14];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Reading External ADC via I2C interface (channel 11)
 *
 *******************************************************************************************/
volatile uint32_t adc15(void){

	//mcp3425_data i2cBuff; // ToDo: ova ne treba da bide vaka treba da se smeni funkcijata sto go koristi kako argument

	//if(MCP3425_read( &i2cBuff ) == FALSE)
	return ads1115_buff[15];

	return (uint32_t) 0; //i2cBuff.sample;
}

/********************************************************************************************
 * function: Add channel function to the transmitter core function
 *
 *******************************************************************************************/

void addFunctions(void){

	// set ADC functions
	addAdcArrayFunction(/*function*/adc0, /*channal*/0);
	addAdcArrayFunction(adc1, 1);
	addAdcArrayFunction(adc2, 2);
	addAdcArrayFunction(adc3, 3);
	addAdcArrayFunction(adc4, 4);
	addAdcArrayFunction(adc5, 5);
	addAdcArrayFunction(adc6, 6);
	addAdcArrayFunction(adc7, 7);
	addAdcArrayFunction(adc8, 8); 	// External ADC (I2C interface)
	addAdcArrayFunction(adc9, 9);
	addAdcArrayFunction(adc10, 10);
	addAdcArrayFunction(adc11, 11);
	addAdcArrayFunction(adc12, 12);
	addAdcArrayFunction(adc13, 13);
	addAdcArrayFunction(adc14, 14);
	addAdcArrayFunction(adc15, 15);

	// function for sending data
	adcSend = sendADCData;
}


