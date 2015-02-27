/*
 * PCF8574.h
 *
 *  Created on: Oct 8, 2014
 *      Author: nikica
 */

#ifndef PCF8574_H_
#define PCF8574_H_

#define PCF8574_ADDR 	0x4E // A2=1; A1=1; A0=1;

uint32_t PCF8574_Wr(uint32_t Address, uint8_t portState);
uint32_t PCF8574_Rd(uint32_t Address, uint8_t *Buffer);
uint32_t PCF8574_Init(void);

#endif /* PCF8574_H_ */
