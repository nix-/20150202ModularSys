################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/USB/Core/DCD/USBRom/usbd_adcuser.c \
../Drivers/USB/Core/DCD/USBRom/usbd_cdc.c \
../Drivers/USB/Core/DCD/USBRom/usbd_hid.c \
../Drivers/USB/Core/DCD/USBRom/usbd_msc.c \
../Drivers/USB/Core/DCD/USBRom/usbd_rom.c 

OBJS += \
./Drivers/USB/Core/DCD/USBRom/usbd_adcuser.o \
./Drivers/USB/Core/DCD/USBRom/usbd_cdc.o \
./Drivers/USB/Core/DCD/USBRom/usbd_hid.o \
./Drivers/USB/Core/DCD/USBRom/usbd_msc.o \
./Drivers/USB/Core/DCD/USBRom/usbd_rom.o 

C_DEPS += \
./Drivers/USB/Core/DCD/USBRom/usbd_adcuser.d \
./Drivers/USB/Core/DCD/USBRom/usbd_cdc.d \
./Drivers/USB/Core/DCD/USBRom/usbd_hid.d \
./Drivers/USB/Core/DCD/USBRom/usbd_msc.d \
./Drivers/USB/Core/DCD/USBRom/usbd_rom.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/USB/Core/DCD/USBRom/%.o: ../Drivers/USB/Core/DCD/USBRom/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCORE_M3 -DNDEBUG -D__CODE_RED -I"C:\LPCOpen\lpcopen\software\CMSIS\CMSIS\Include" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_ip" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_chip\chip_common" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_chip\chip_17xx_40xx" -I"C:\LPCOpen\lpcopen\software\lpc_core\lpc_board\boards_17xx_40xx\nxp_xpresso_1769" -O2 -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -D__REDLIB__ -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


