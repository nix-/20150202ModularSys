/*
 * ads1115.h
 *
 *  Created on: Dec 13, 2014
 *      Author: nikica
 */

#ifndef ADS1115_H_
#define ADS1115_H_

/* I2C ADDRESS ADC (ADS1115) */
#define ADS1115_ADDR0 		0x90	//GND pin
#define ADS1115_ADDR1 		0x92	//VCC pin
#define ADS1115_ADDR2 		0x94	//SDA pin
#define ADS1115_ADDR3 		0x96	//SCL pin

/* REGISTER ADDRESS */
#define CONVER_REG			0x00
#define CONF_REG			0x01
#define LO_THR_REG			0x02
#define HI_THR_REG			0x03

/* CONFIGURATION REG BITS */
//bit[15]					OS:
#define NO_EFFECT			0x0
#define SING_CONV			0x1
//	bits[14-12]				MUX: Input multiplexer configuration
#define AIN0P_AIN1N			0x0
#define AIN0P_AIN3N			0x1
#define AIN1P_AIN3N			0x2
#define AIN2P_AIN3N			0x3
#define AIN0_GND			0x4
#define AIN1_GND			0x5
#define AIN2_GND			0x6
#define AIN3_GND			0x7
//	bits[11-9]				PGA: Programmable gain amplifier configuration
#define RANGE_6144V			0x0
#define RANGE_4096V			0x1
#define RANGE_2048V			0x2
#define RANGE_1024V			0x3
#define RANGE_0512V			0x4
#define RANGE_0256V			0x5
//#define RANGE_0256V			0x0c00
//#define RANGE_0256V			0x0e00
//	bit[8]					MODE: Device operation mode
#define CONT_CONV			0x0 // Continuous conversion mode
#define SHOT_POW_DOWN		0x1 // Power-down single-shot mode (default)
//	bits[7-5]				DATA RATE:
#define SPS8				0x0
#define SPS16				0x1
#define SPS32				0x2
#define SPS64				0x3
#define SPS128				0x4	// 	(default)
#define SPS250				0x5
#define SPS475				0x6
#define SPS860				0x7
//	bit[4]					COMP_MODE: Comparator mode
#define TRADI				0x0	// 	(default)
#define WINDOW				0x1
//	bit[3]					COMP_POL: Comparator polarity
#define ACT_LOW				0x0	// 	(default)
#define ACT_HIGH			0x8
// 	bit[2]					COMP_LAT: Latching comparator
#define NON_LATCH			0x0	//	(default)
#define LATCHING			0x1
//	bit[1-0]				COMP_QUE: Comparator queue and disable
#define ASSERT_1			0x0
#define ASSERT_2			0x1
#define ASSERT_4			0x2
#define ASSERT_DIS			0x3	//	(default)


// ADS1115 configuration register buffer
#pragma pack(push, 1) // exact fit - no padding
typedef struct ads1115_conf_reg_tag{
	// second byte
	unsigned int mode:1; 		// bit 8
	unsigned int pga:3; 		// bit 9, 10, 11
	unsigned int mux:3;			// bit 12, 13, 14
	unsigned int os:1; 			// bit 15
	// first byte
	unsigned int cmp_que:2; 	// bit 0, 1
	unsigned int cmp_lat:1;		// bit 2
	unsigned int cmp_pol:1;		// bit 3
	unsigned int cmp_mode: 1;	// bit 4
	unsigned int data_rate:3; 	// bit 5, 6, 7
}ads1115_conf_reg;
#pragma pack(pop) //back to whatever the previous packing mode was

/* DEFINITION OF THE FUNCTINOS */
uint32_t ads1115_init(void);
uint32_t ads1115_rd(uint8_t Add, uint8_t *Buffer, uint32_t Length);
uint32_t ads1115_wr(uint8_t Add, uint8_t RegAdd, uint8_t *Buffer, uint32_t Length);


#endif /* ADS1115_H_ */
