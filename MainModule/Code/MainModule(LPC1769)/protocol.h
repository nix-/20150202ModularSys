/*
 * protocol.h
 *
 *  Created on: May 12, 2014
 *      Author: nikica
 */

#ifndef PROTOCOL_H_
#define PROTOCOL_H_


//COMMANDS
#define COMMAND_ADC_READ		'A'
#define COMMAND_PIN_CLR			0x0E
#define COMMAND_PIN_SET			0x0F
#define COMMAND_COSOLE_COM		'C' 	//komanda za aktiviranje na konzolata

//COMMANDS PACKETS SIZE
#define COMMAND_ADC_READ_PACKET_SIZE	1 	//bytes
#define COMMAND_PIN_CLR_PACKET_SIZE 	2	//bytes
#define COMMAND_PIN_SET_PACKET_SIZE 	2	//bytes

#define NUM_ADC_CHANNELS 		16	 	//defining number of ADC channel, depend of the number of
											//channels in the controller and external ADC

#define NUM_OUTPUT_CHANNELS		32		//maximum number of control outputs
											//external peripherals and internal

// COMMAND STRUCTURES

typedef struct{ // PIN STRUCTURE
	uint8_t command;
	uint8_t pinNumber;
} pinCommand;

typedef struct{ // ??
	uint8_t command;
	uint8_t *consolBuff;
} consolCommand;

#define MAX_PACKET_LENGTH		5 /*bytes*/

/**
 * definicija na niza od funkcii koi se koristat za citanje na ADC (externi/interni)
 */
volatile uint32_t ( *adcFuncArray[NUM_ADC_CHANNELS] )(void);		// function array of NUMBER_OF_ADC_CHANNELS elements

/**
 * definicija na niza od funkcii koi se koristat za postavuvanje na izlezen kontrolen signal na pin
 */
volatile void (*outputFuncArray[NUM_OUTPUT_CHANNELS])(uint32_t);	// array of output functions


volatile uint32_t adcValue[NUM_OUTPUT_CHANNELS];

//SEND function
volatile uint32_t (*adcSend)(uint32_t);

//GPIO functions
volatile uint32_t (*setPin)(uint32_t);
volatile uint32_t (*clrPin)(uint32_t);

extern uint32_t comunicationHandler(uint8_t buffSeriall);
extern void initTransmitter(void);
uint32_t addAdcArrayFunction(volatile uint32_t (*adcReadCallback)(void), int index);

#endif /* PROTOCOL_H_ */
