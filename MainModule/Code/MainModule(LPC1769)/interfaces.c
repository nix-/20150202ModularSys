/*
 * interfaces.c
 *
 *  Created on: Nov 29, 2014
 *      Author: nix
 */
#include "interfaces.h"
#include "LPC17xx.h"


// *** Peripheral for driving motor1 *** //
int initPeripheral(void){

	LPC_PINCON->PINSEL3 &= ~(0x0f000000); 	//set P1.28 and P1.29 as GPIO
	LPC_GPIO1->FIODIR 	|= 0x30000000; 		//set P1.28 and P1.29 as output

	LPC_PINCON->PINSEL4 &= ~(0x0003ffff);	//set P2.0 - P2.8 set as GPIO
	LPC_GPIO2->FIODIR	|= 0x000001ff;		//set P2.0 - P2.8 set as output
	LPC_GPIO2->FIODIR	&= ~(0x00000001);	//set P2.0 as input

	return 1;
}

int setReset(int state){

	switch(state){
	case LOW:
		LPC_GPIO1->FIOCLR = 0x010000000;
		break;

	case HIGH:
		LPC_GPIO1->FIOSET = 0x010000000;
		break;

	default:
		// illegal input
		return 0;
		break;
	}

	return 1;
}

int setSleep(int state){

	switch(state){
	case LOW:
		LPC_GPIO1->FIOCLR = 0x020000000;
		break;

	case HIGH:
		LPC_GPIO1->FIOSET = 0x020000000;
		break;

	default:
		// illegal input
		return 0;
		break;
	}

	return 1;
}

int readFault(void){

	return (LPC_GPIO2->FIOPIN && 0x01); // return value of the P2.0
}

int setDecay(int state){

	switch(state){
	case LOW:
		LPC_GPIO2->FIOCLR = 0x000000002;
		break;

	case HIGH:
		LPC_GPIO2->FIOSET = 0x000000002;
		break;

	default:
		// illegal input
		return 0;
		break;
	}

	return 1;
}

int setPhase(int state){

	switch(state){
	case LOW:
		LPC_GPIO2->FIOCLR = 0x000000004;
		break;

	case HIGH:
		LPC_GPIO2->FIOSET = 0x000000004;
		break;

	default:
		// illegal input
		return 0;
		break;
	}

	return 1;
}

int setEnable(int state){
	switch(state){
	case LOW:
		LPC_GPIO2->FIOCLR = 0x000000008;
		break;

	case HIGH:
		LPC_GPIO2->FIOSET = 0x000000008;
		break;

	default:
		// illegal input
		return 0;
		break;
	}

	return 1;
}

int setCurrent(int value){

	int temp;

	if((value > 0x1f) || (value < 0x00)){	// Validation of the value
		return 0; 		// not valid input
	}



	value &= 0x1f;

	temp = value << 4;
	LPC_GPIO2->FIOCLR = (0xff << 4);
	LPC_GPIO2->FIOSET = temp;

	return value;

}
