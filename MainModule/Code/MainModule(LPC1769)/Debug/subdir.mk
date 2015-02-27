################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ADCext.c \
../Descriptors.c \
../MC24LC64.c \
../PCF8574.c \
../VirtualSerial.c \
../ads1115.c \
../console.c \
../cr_startup_lpc17xx40xx.c \
../drv8840.c \
../drv_hd44780.c \
../drv_hd44780_l.c \
../i2c.c \
../interfaces.c \
../protocol.c \
../system_LPC17xx.c \
../transmitter_interface.c 

OBJS += \
./ADCext.o \
./Descriptors.o \
./MC24LC64.o \
./PCF8574.o \
./VirtualSerial.o \
./ads1115.o \
./console.o \
./cr_startup_lpc17xx40xx.o \
./drv8840.o \
./drv_hd44780.o \
./drv_hd44780_l.o \
./i2c.o \
./interfaces.o \
./protocol.o \
./system_LPC17xx.o \
./transmitter_interface.o 

C_DEPS += \
./ADCext.d \
./Descriptors.d \
./MC24LC64.d \
./PCF8574.d \
./VirtualSerial.d \
./ads1115.d \
./console.d \
./cr_startup_lpc17xx40xx.d \
./drv8840.d \
./drv_hd44780.d \
./drv_hd44780_l.d \
./i2c.d \
./interfaces.d \
./protocol.d \
./system_LPC17xx.d \
./transmitter_interface.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -DUSB_DEVICE_ONLY -D__LPC175X_6X__ -D__CODE_RED -DCORE_M3 -I"../../software/CMSIS/CMSIS/Include" -I"../HD44780" -I"../../software/lpc_core/lpc_ip" -I"../../software/lpc_core/lpc_chip/chip_common" -I"../../software/lpc_core/lpc_chip/chip_17xx_40xx" -I"../../software/lpc_core/lpc_board/board_common" -I"../../software/lpc_core/lpc_board/boards_17xx_40xx/nxp_xpresso_1769" -I"../../software/LPCUSBLib/Drivers/USB" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fsingle-precision-constant -mcpu=cortex-m3 -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


