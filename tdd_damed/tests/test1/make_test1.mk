################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
TEST1_C++_SRCS += \
./tests/test1/test1.cpp

TEST1_OBJS += \
./Debug/tests/test1/test1.o 

TEST1_C++_DEPS += \
./Debug/tests/test1/test1.d 

# Each subdirectory must supply rules for building sources it contributes
./Debug/tests/test1/%.o: ./tests/test1/%.cpp
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(USER_INCLUDE) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
