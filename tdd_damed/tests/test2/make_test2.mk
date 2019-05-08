################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
TEST2_C++_SRCS += \
./tests/test2/test2.cpp

TEST2_OBJS += \
./Debug/tests/test2/test2.o 

TEST2_C++_DEPS += \
./Debug/tests/test2/test2.d 

# Each subdirectory must supply rules for building sources it contributes
./Debug/tests/test2/%.o: ./tests/test2/%.cpp
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(USER_INCLUDE) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

