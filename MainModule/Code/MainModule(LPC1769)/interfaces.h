/*
 * interfaces.h
 *
 *  Created on: Nov 29, 2014
 *      Author: nix
 */

#ifndef INTERFACES_H_
#define INTERFACES_H_

#define HIGH	1
#define LOW		0



// DRV8840 module //
/********************
P1.28	- Reset
P1.29	- Sleep
P2.0	- Fault
P2.1	- Decay
P2.2	- Phase
P2.3	- Enable
P2.4	- I0|
P2.5	- I1|
P2.6	- I2| Current
P2.7	- I3| in [%]
P2.8	- I4|
********************/
int setReset(int state);
int setSleep(int state);
int readFault(void);
int setDecay(int state);
int setPhase(int state);
int setEnable(int state);
int setCurrent(int value);
int initPeripheral(void); // ToDo: da se inicijaliziraat site pinovi sto se prikazani gore




#endif /* INTERFACES_H_ */
