################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
TEST2_CPP_SRCS += \
../tests/test2/test2.cpp 

TEST2_OBJS += \
./tests/test2/test2.o 

TEST2_CPP_DEPS += \
./tests/test2/test2.d 

CPP_INCS := \
-I"C:\Users\efrank\Documents\StudyWorkspace\bare-metal_schedualer\extern\cpputest_build\include"\
-I"C:\Users\efrank\Documents\StudyWorkspace\bare-metal_schedualer\bmed_tdd\tests\test2"

# Each subdirectory must supply rules for building sources it contributes
tests/test2/%.o: ../tests/test2/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(CPP_INCS) -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

test2_clean:

ifneq ($(strip $(TES2_CPP_DEPS)),)
-include $(TEST2_CPP_DEPS)
endif