/*
 * protocol.c
 *
 *  Created on: May 12, 2014
 *      Author: nikica
 */
#include "LPC17xx.h"			/* LPC17xx Peripheral Registers */
#include "protocol.h"
#include "string.h"
#include "console.h"
#include "transmitter_interface.h"


/********************************************************************nixson\
* Function Name: parsingSerialCommand
* Description: Function that parse the data received through serial port
*
* Last Modification: 22.04.2013
\**************************************************************************/
uint32_t parsingSerialCommand(uint8_t* buffSeriall){

	static uint8_t state;
	static uint32_t buffSize;

	state = buffSeriall[0]; // Take state

	buffSize =  strlen((char*) buffSeriall); // posledniot simbol od nizata mora da e oznaka za kraj na string '\0'

	switch(state){

		case COMMAND_ADC_READ: // AD conversion

			// signal toggle LED
			if(LPC_GPIO0->FIOPIN & ((uint32_t)(1 << 22))){
				LPC_GPIO0->FIOCLR = (1 << 22);			/* Vkluci LED */
			}else{
				LPC_GPIO0->FIOSET = (1 << 22);			/* Iskluci LED */
			}

			//printc("<- A \r\n");

			if(buffSize == COMMAND_ADC_READ_PACKET_SIZE){ //packet size check

				// Burst read
				int i = 0;
				for(i = 0; i < NUM_ADC_CHANNELS; i++){
					// Reading ADC
					if(adcFuncArray[i] != 0){				// Function address check
						adcValue[i] = (*adcFuncArray[i])();	// Burst reading

					}else{
						//printc("error: function for ADC is not installed!\r\n");
						break;
					}
				} // <- end ADC converstion

				//Send Data
				for(i = 0; i < NUM_ADC_CHANNELS; i++){
					if(adcSend != 0){
						adcSend(adcValue[i]);
						//printc("ADC%d: %d\r\n", i, adcValue[i]);
					}else{
						adcSend('\0');
						//printc("error: function for Sending ADC data is not installed!\r\n");
						//break; //prekini ciklusot ako nema setirano funkcija
					}
				} // <-end burst sending

				return (uint32_t) 'A';

			}else{
				//printc("Packet error: Unexpected packet size!\r\n");
			} // <- end packet check
		  break;

		  //Control symbols (0x01 - 0x0F)

		case 0x01: // Write to LCD (last sent char must to be zero)
			 break;
		case 0x02:
			 break;
		case 0x03:
			 break;
		case 0x04:
			 break;
		case 0x05:
			 break;
		case 0x06:
			 break;
		case 0x07:
			 break;
		case 0x08:
			 break;
		case 0x09:
			 break;
		case 0x0A:
			 break;
		case 0x0B:
			 break;
		case 0x0C:
			 break;
		case 0x0D:
		  // BUZZER Freq
			 break;

		case COMMAND_PIN_CLR: // Clear PIN


			if(buffSize == COMMAND_PIN_CLR_PACKET_SIZE){

				if(setPin != 0){
					// implementacija na setiranje na pin
					//LPC_GPIO0->FIOCLR = 1 << ((pinCommand*) buffSeriall)->pinNumber;
				}else{
					//printc("Error: Ne e setirana funkcija za postavuvanje na pin!");
				}

				return 0x0E;

			}else{	//Error message
				//printc("Packet error: Unexpected packet size!");
			}
			break;

		case COMMAND_PIN_SET: // Set PIN

			if(buffSize == COMMAND_PIN_SET_PACKET_SIZE){

				if(clrPin != 0){
					// implementacija na cistenje na pin
					//LPC_GPIO0->FIOSET = 1 << ((pinCommand*) buffSeriall)->pinNumber;
				}else{
					//printc("Error: Ne e serana funkcija za cistenje na pin!");
				}

				return 0x0F;

			}else{	//Error message
				//printc("Packet error: Unexpected packet size!");
			}
			break;

		//End Control symbols

		case COMMAND_COSOLE_COM: // 'C' - komanda
			pecati_adc();
			break;

		default:	//Error message
			//printc("Command error: Undefined command!\r\n");
			break;
	} // <- end switch

	return 0;
}

/********************************************************************nixson\
* Function Name: addAdcArrayFunction
* Description: Set function in function array
*
* Last Modification: 22.04.2013
\**************************************************************************/
uint32_t addAdcArrayFunction(volatile uint32_t (*adcReadCallback)(void), int index){

	if(index < NUM_ADC_CHANNELS){
		adcFuncArray[index] = adcReadCallback;
		return 0;

	}else{
		//printc("Error: irregular index!");
		// za pogolem broj na ADC treba da se izimeni NUMBER_OF_ADC_CHANNELS vo transmitter.h
		// a i da se implementiraat i ADC konvertori
		return 1;
	}

}

/*****************************************************************************
** Function name:	initTransmiter
**
** Descriptions:	function for initialization of the transmitter
**
** parameters:		None
** Returned value:	None
**
*****************************************************************************/
uint32_t comunicationHandler(uint8_t buffSeriall){

	static volatile uint8_t dataBuffer[64] = {0};
	static int i = 0;

	/*Assembling the packet*/
	dataBuffer[i] = buffSeriall;

	switch(dataBuffer[0]){

	case COMMAND_ADC_READ:

		i = 0;	// point to start of a buffer
		return parsingSerialCommand(dataBuffer);
		break;

	case COMMAND_PIN_SET:

		break;

	case COMMAND_PIN_CLR:

		break;

	default:
		/*undefined command*/
		i = 0; 	// point to start of a buffer
		break;

	}



	dataBuffer[0] = buffSeriall;

	// ToDo: commands before parsing

	return 0;
}

/*****************************************************************************
** Function name:	initTransmiter
**
** Descriptions:	function for initialization of the transmitter
**
** parameters:		None
** Returned value:	None
**
*****************************************************************************/
void initTransmitter(void){

	initPeripherals();
	addFunctions();
}
