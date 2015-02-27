/*
 * PCF8574.c
 *
 *  Created on: Oct 8, 2014
 *      Author: nikica
 */
#include <string.h>
#include "LPC17xx.h"			/* LPC17xx Peripheral Registers */
#include "i2c.h"
#include "PCF8574.h"
/*
 * 	Function for set state of the pin
 * */
uint32_t PCF8574_Wr(uint32_t Address, uint8_t portState)
{

	if(Address > 0x1FFF)
		return FALSE;

	//memcpy((void*)(&I2CMasterBuffer[1]), (void*)Buffer, 1);

	I2CWriteLength = 1 + 1;
	I2CReadLength = 0;
	I2CMasterBuffer[0] = PCF8574_ADDR;
	I2CMasterBuffer[1] = portState;

	uint32_t fin_state = I2CEngine();

	return TRUE;
}

/*
 * 	Function for reading the states from the port
 * */
uint32_t PCF8574_Rd(uint32_t Address, uint8_t *Buffer)
{
	if(Address > 0x1FFF)
		return FALSE;

	if(Buffer == 0)
		return FALSE;

	I2CWriteLength = 1;
	I2CReadLength = 2;
	I2CMasterBuffer[0] = PCF8574_ADDR;
	I2CMasterBuffer[0] = PCF8574_ADDR | RD_BIT;

	while(I2CEngine() == I2CSTATE_SLA_NACK);

	memcpy((void*)Buffer, (void*)I2CSlaveBuffer, 2);

	return TRUE;
}

/*
 * 	Function for initialization of the peripheral
 * */
uint32_t PCF8574_Init(void)
{
	if(I2CInit((uint32_t)I2CMASTER) == 0)	/* initialize I2c */
		return FALSE;				/* Fatal error */

	return TRUE;
}
