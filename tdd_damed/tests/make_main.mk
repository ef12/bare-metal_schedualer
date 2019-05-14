################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C++_SRCS += \
./tests/main.cpp

MAIN_OBJS += \
./Debug/tests/main.o 

MAIN_C++_DEPS += \
./Debug/tests/main.d 

# Each subdirectory must supply rules for building sources it contributes
./Debug/tests/%.o: ./tests/%.cpp
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -I"C:\Users\efrank\Documents\StudyWorkspace\bare-metal_schedualer\extern\cpputest_build\include" -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

#g++ -I$(CPPUTEST_INCS) $(I_TEST1_INCS) $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(MAIN_C++_DEPS)),)
-include $(MAIN_C++_DEPS)
endif
endif