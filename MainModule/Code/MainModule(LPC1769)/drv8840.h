/*
 * drv8840.h
 *
 *  Created on: Nov 29, 2014
 *      Author: nix
 */

#ifndef DRV8840_H_
#define DRV8840_H_

#define SET			1
#define RESET		0

#define WAKEUP		1
#define SLEEP		0

#define ERROR 		1
#define NONE		0

#define SLOW		0
#define FAST		1

#define FORWARD 	1
#define BACKWARD 	0

#define ENABLE 		1
#define DISABLE 	0

// motor driver function structure
typedef struct drv8840Tag{
	// state could be 1/0
	int (*setReset)(int state);
	int (*setSleep)(int state);
	int (*readFault)(void);
	int (*setDecay)(int state);
	int (*setPhase)(int state);
	int (*setEnable)(int state);
	int (*setCurrent)(int value);

}drv8840;

// motor driver status structure
typedef struct drv8840StateTag{

	int ResetPin;
	int SleepPin;
	int FaultPin;
	int DecayPin;
	int PhasePin;
	int EnablePin;
	int CurrentValue;

}drv8840State;

// function for initializartion of the driver
void initDriver(
		drv8840 *driver,
		int (*setReset)(int state),
		int (*setSleep)(int state),
		int (*readFault)(void),
		int (*setDecay)(int state),
		int (*setPhase)(int state),
		int (*setEnable)(int state),
		int (*setCurrent)(int value)
		);

void setDriverMode(drv8840 *driver, drv8840State *driverState);

#endif /* DRV8840_H_ */
