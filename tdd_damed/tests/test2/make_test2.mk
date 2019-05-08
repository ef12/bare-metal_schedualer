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
	g++ -I$(CPPUTEST_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

clean_test2:
	-$(RM) $(TEST2_C++_DEPS) $(TEST2_OBJS) $(TEST2_CUT_C_DEPS) $(TEST2_CUT_OBJS) Debug/test2 ./Debug/$(TEST1_LOC)/cut/test2_cut.a

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(TEST2_C++_DEPS)),)
-include $(TEST2_C++_DEPS)
endif
endif