/*
 * drv8840.c
 *
 *  Created on: Nov 29, 2014
 *      Author: nix
 */
#include "drv8840.h"

void initDriver(
		drv8840 *driver,
		int (*setReset)(int state),
		int (*setSleep)(int state),
		int (*readFault)(void),
		int (*setDecay)(int state),
		int (*setPhase)(int state),
		int (*setEnable)(int state),
		int (*setCurrent)(int value)
		){

	driver->setReset 	= setReset;
	driver->setSleep 	= setSleep;
	driver->readFault 	= readFault;
	driver->setDecay	= setDecay;
	driver->setPhase	= setPhase;
	driver->setEnable	= setEnable;
	driver->setCurrent	= setCurrent;

}

void setDriverMode(drv8840 *driver, drv8840State *driverState){

	driver->setReset(driverState->ResetPin);
	driver->setSleep(driverState->SleepPin);
	driver->setDecay(driverState->DecayPin);
	driver->setPhase(driverState->PhasePin);
	driver->setEnable(driverState->EnablePin);
	driver->setCurrent(driverState->CurrentValue);

}
