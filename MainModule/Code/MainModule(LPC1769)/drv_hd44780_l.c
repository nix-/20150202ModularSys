/*
 * drv_hd44780_l.c
 *
 *  Created on: Jul 11, 2013
 *      Author: nikica
 */

#include 	"drv_hd44780_l.h"

#include    "drv_hd44780_cnfg.h"
#include    "drv_hd44780.h"
#include 	"LPC17xx.h"
#include 	"PCF8574.h"

#define HD44780_INPUT_SET_MASK        ~((1 << 8) | (1 << 10) | (1 << 11) | (1 << 12))
#define HD44780_OUTPUT_SET_MASK        ((1 << 8) | (1 << 10) | (1 << 11) | (1 << 12))

/* Delay macro */
#define HD44780_BUS_DLY()      volatile int dly = 20; for(;dly;--dly)

/*************************************************************************
 * Function Name: HD44780_IO_Init
 * Parameters: none
 * Return: none
 * Description: Init IO ports directions and level
 *
 *************************************************************************/
void HD44780_IO_Init (void *arg)
{
  // RS Output - Low
  HD44780SetRS(0);
  // E  Output - Low
  HD44780SetE(0);
#if HD4780_WR > 0
  // WR Output - Low
  HD44780SetRW(0);
#endif
}

/*************************************************************************
 * Function Name: HD44780SetRS
 * Parameters: Boolean Data
 * Return: none
 * Description: Set RS signal
 *
 *************************************************************************/
void HD44780SetRS (Boolean Data)
{
	char port = 0;
	char portStatus[2] = {0};
	PCF8574_Rd(PCF8574_ADDR, portStatus);

	if(Data)
	{
		port = portStatus[1] | 0x01; // RS bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
	else
	{
		port = portStatus[1] & ~(0x01);  // RS bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
}


/*************************************************************************
 * Function Name: HD44780SetE
 * Parameters: Boolean Data
 * Return: none
 * Description: Set E signal
 *
 *************************************************************************/
void HD44780SetE (Boolean Data)
{
	char port = 0;
	char portStatus[2] = {0};
	PCF8574_Rd(PCF8574_ADDR, portStatus);

	if(Data)
	{
		port = portStatus[1] | 0x04; // E bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
	else
	{
		port = portStatus[1] & ~(0x04);  // E bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
}

/*************************************************************************
 * Function Name: HD44780WrIO
 * Parameters: Int8U Data
 * Return: none
 * Description: Write to HD44780 I/O
 *
 *************************************************************************/
void HD44780WrIO (Int8U Data)
{
  Int8U Tmp;
  char port = 0;
  char portStatus[2] = {0};

  // Set Direction (output)
#if HD4780_WR > 0
  HD44780SetRW(0);
#endif
  // Write Data
  // Clock E
  HD44780SetE(1);

  PCF8574_Rd(PCF8574_ADDR, portStatus);
  port = portStatus[1] & ~(0xF0);  // clear upper 4 bits
  port |= Data << 4;
  PCF8574_Wr(PCF8574_ADDR, port);

  HD44780_BUS_DLY();
  HD44780SetE(0);
}

#if HD4780_WR > 0

/*************************************************************************
 * Function Name: HD44780SetRW
 * Parameters: Boolean Data
 * Return: none
 * Description: Set R/W signal
 *
 *************************************************************************/
void HD44780SetRW (Boolean Data)
{
	char port = 0;
	char portStatus[2] = {0};
	PCF8574_Rd(PCF8574_ADDR, portStatus);

	if(Data)
	{
		port = portStatus[1] | 0x02; // R/W bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
	else
	{
		port = portStatus[1] & ~(0x02);  // R/W bit
		PCF8574_Wr(PCF8574_ADDR, port);
	}
}


/*************************************************************************
 * Function Name: HD44780RdIO
 * Parameters: none
 * Return: Int8U
 * Description: Read from HD44780 I/O
 *
 *************************************************************************/
Int8U HD44780RdIO (void *arg)
{
	Int8U Data;
	char port = 0;
	char portStatus[2] = {0};
  	// Set Direction (INPUT)
	HD44780SetRW(1);
	// Read Data
	HD44780SetE(1);
	HD44780_BUS_DLY();

	PCF8574_Rd(PCF8574_ADDR, portStatus);
	Data = portStatus[1] >> 4;

	HD44780SetE(0);
	// Clock E
	return Data;
}
#endif

/*************************************************************************
 * Function Name: display
 * Parameters: none
 * Return: int, int, Int8U*
 * Description: 4x20 display
 *
 *************************************************************************/
void display(int x, int y, uint8_t* text){

	int stringLength = strlen(text);
	uint8_t string[21] = {0};

	if(stringLength > (HD44780_HORIZONTAL_SIZE - x +1)){
		strncpy(string, text, (HD44780_HORIZONTAL_SIZE - x +1));
	}else{
		strcpy(string, text);
	}

	if(x > 20){
		return;
	}

	switch( y ){

	case 1: // prva linija
		HD44780_StrShow(x ,1 , string);
		break;

	case 2:
		HD44780_StrShow(x ,2 , string);
		break;

	case 3:
		HD44780_StrShow(x + HD44780_HORIZONTAL_SIZE ,1 , string);
		break;

	case 4:
		HD44780_StrShow(x + HD44780_HORIZONTAL_SIZE ,2 , string);
		break;

	}

	return;
}
