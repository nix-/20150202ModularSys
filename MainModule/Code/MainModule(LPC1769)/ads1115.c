/*
 * ads1115.c
 *
 *  Created on: Dec 13, 2014
 *      Author: nikica
 */
#include <string.h>
#include "LPC17xx.h"			/* LPC17xx Peripheral Registers */
#include "i2c.h"
#include "ads1115.h"

//ToDo: treba da se smeni definicijata za se sto e povrzano so EEPROM memorijata


/*****************************************************************************
** Function name:	ads1115_wr
**
** Descriptions:	Function for writing data to ADS1115
**
** parameters:		Address:	EEPROM Start Address for writing
** 								(0x00 - 0x1FFF)
** 					Buffer:		Pointer to data for write
** 					Length:		Data Length (1 - 32)
**
** Returned value:	Status
**
*****************************************************************************/
uint32_t ads1115_wr(uint8_t Add, uint8_t RegAdd, uint8_t *Buffer, uint32_t Length)
{

	if(Buffer == 0)
		return FALSE;

	if((Length < 0) || (Length > 32))
		return FALSE;

	/* In order to start the I2CEngine, the all the parameters
  	  must be set in advance, including I2CWriteLength, I2CReadLength,
  	  I2CCmd, and the I2cMasterBuffer which contains the stream
  	  command/data to the I2c slave device.
  	  (1) If it's a I2C write only, the number of bytes to be written is
  	  I2CWriteLength, I2CReadLength is zero, the content will be filled
  	  in the I2CMasterBuffer.
  	  (2) If it's a I2C read only, the number of bytes to be read is
  	  I2CReadLength, I2CWriteLength is 0, the read value will be filled
  	  in the I2CMasterBuffer.
  	  (3) If it's a I2C Write/Read with repeated start, specify the
  	  I2CWriteLength, fill the content of bytes to be written in
  	  I2CMasterBuffer, specify the I2CReadLength, after the repeated
  	  start and the device address with RD bit set, the content of the
  	  reading will be filled in I2CMasterBuffer index at
  	  I2CMasterBuffer[I2CWriteLength+2].

  	  e.g. Start, DevAddr(W), WRByte1...WRByteN, Repeated-Start, DevAddr(R),
  	  RDByte1...RDByteN Stop. The content of the reading will be filled
  	  after (I2CWriteLength + two devaddr) bytes. */

	/* Write SLA(W), address and one data byte */

	memcpy((void*)(&I2CMasterBuffer[2]), (void*)Buffer, Length);

	I2CWriteLength = Length + 2;
	I2CMasterBuffer[0] = Add;
	I2CMasterBuffer[1] = RegAdd;

	I2CReadLength = 0;

	uint32_t fin_state = I2CEngine();

	return TRUE;
}

/*****************************************************************************
** Function name:	ads1115_rd
**
** Descriptions:	Function for reading from ADS1115
**
** parameters:		Address:	EEPROM Start Address for reading
** 								(0x00 - 0x1FFF)
** 					Buffer:		Pointer to data from read
** 					Length:		Data Length (1 - 32)
** Returned value:	Status
**
*****************************************************************************/
uint32_t ads1115_rd(uint8_t Add, uint8_t *Buffer, uint32_t Length)
{

	if(Buffer == 0)
		return FALSE;

	if((Length < 1) || (Length > 32))
		return FALSE;

	I2CWriteLength = 1;
	I2CReadLength = Length;
	I2CMasterBuffer[0] = Add | RD_BIT;

	while(I2CEngine() == I2CSTATE_SLA_NACK);

	memcpy((void*)Buffer, (void*)I2CSlaveBuffer, Length);

	return TRUE;
}

/*****************************************************************************
** Function name:	ads1115_init
**
** Descriptions:	Function for ads1115 communication channel (I2C)
** 					initialization
**
** parameters:		None
** Returned value:	Status
**
*****************************************************************************/
uint32_t ads1115_init(void)
{
	if(I2CInit((uint32_t)I2CMASTER) == 0)	/* initialize I2c */
		return FALSE;				/* Fatal error */

	return TRUE;
}

/******************************************************************************
**                            End Of File
******************************************************************************/


