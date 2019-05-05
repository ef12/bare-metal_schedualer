################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C++_SRCS += \
./tests/main.cpp

OBJS += \
./Debug/tests/main.o 

C++_DEPS += \
./Debug/tests/main.d 


# Each subdirectory must supply rules for building sources it contributes
./Debug/tests/%.o: ./tests/%.cpp
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(USER_INCLUDE) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '