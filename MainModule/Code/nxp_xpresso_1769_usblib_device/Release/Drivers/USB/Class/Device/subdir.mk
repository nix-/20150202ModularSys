################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/USB/Class/Device/AudioClassDevice.c \
../Drivers/USB/Class/Device/CDCClassDevice.c \
../Drivers/USB/Class/Device/HIDClassDevice.c \
../Drivers/USB/Class/Device/MIDIClassDevice.c \
../Drivers/USB/Class/Device/MassStorageClassDevice.c \
../Drivers/USB/Class/Device/RNDISClassDevice.c 

OBJS += \
./Drivers/USB/Class/Device/AudioClassDevice.o \
./Drivers/USB/Class/Device/CDCClassDevice.o \
./Drivers/USB/Class/Device/HIDClassDevice.o \
./Drivers/USB/Class/Device/MIDIClassDevice.o \
./Drivers/USB/Class/Device/MassStorageClassDevice.o \
./Drivers/USB/Class/Device/RNDISClassDevice.o 

C_DEPS += \
./Drivers/USB/Class/Device/AudioClassDevice.d \
./Drivers/USB/Class/Device/CDCClassDevice.d \
./Drivers/USB/Class/Device/HIDClassDevice.d \
./Drivers/USB/Class/Device/MIDIClassDevice.d \
./Drivers/USB/Class/Device/MassStorageClassDevice.d \
./Drivers/USB/Class/Device/RNDISClassDevice.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/USB/Class/Device/%.o: ../Drivers/USB/Class/Device/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCORE_M3 -DNDEBUG -D__CODE_RED -I"C:\LPCOpen\lpcopen\software\CMSIS\CMSIS\Include" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_ip" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_chip\chip_common" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_chip\chip_17xx_40xx" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_board\boards_17xx_40xx\nxp_xpresso_1769" -O2 -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

