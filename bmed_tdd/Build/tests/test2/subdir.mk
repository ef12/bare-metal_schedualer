################################################################################
# Automatically-generated file. Do not edit!
################################################################################
WORKSPACE_LOC := ./../..
# The location of the project with the code under test 
PROD_CODE_LOC := $(WORKSPACE_LOC)/bare_metal_event_driven/prod_code
# The location of the TTD project with all the tests
TDD_PROJ_LOC := ./..
# The location of the outpout object files form the testing code
TEST2_BUILD_LOC := ./tests/test2
# The location of the testing code
TEST2_CODE_LOC := ../$(TEST2_BUILD_LOC)

# Add inputs and outputs from these tool invocations to the build variables 
TEST2_CPP_SRCS += \
../tests/test2/test2.cpp 

TEST2_OBJS += \
./tests/test2/test2.o 

TEST2_CPP_DEPS += \
./tests/test2/test2.d 

CPP_INCS := \
-I$(WORKSPACE_LOC)/extern/cpputest_build/include\
-I"C:\Users\efrank\Documents\StudyWorkspace\bare-metal_schedualer\bmed_tdd\tests\test2"

# Each subdirectory must supply rules for building sources it contributes
tests/test2/%.o: ../tests/test2/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(CPP_INCS) -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

# clean rule for main makefile
test2_clean:
	-$(RM) $(TEST2_OBJS) $(TEST2_CPP_DEPS) $(TEST2_BUILD_LOC)/test2
	-@echo ' '

# use dependencies for clean	
ifneq ($(strip $(TEST2_CPP_DEPS)),)
-include $(TEST2_CPP_DEPS)
endif
#ifneq ($(strip $(TEST1_CUT_C_DEPS)),)
#-include $(TEST1_CUT_C_DEPS)
#endif